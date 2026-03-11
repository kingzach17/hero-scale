local _, Addon = ...
local API = Addon.API

local pairs = pairs
local ipairs = ipairs
local wipe = wipe
local math_min = math.min
local math_max = math.max
local math_abs = math.abs
local table_insert = table.insert

local table_sort = table.sort
local tonumber = tonumber

local CHEVRON_SIZE = 14
local C = Addon.Colors

-- Canonical slot groups: equip locations that compete for the same slot(s)
local EQUIP_LOC_GROUP = {
    INVTYPE_HEAD = "1", INVTYPE_NECK = "2", INVTYPE_SHOULDER = "3",
    INVTYPE_BODY = "4", INVTYPE_CHEST = "5", INVTYPE_ROBE = "5",
    INVTYPE_WAIST = "6", INVTYPE_LEGS = "7", INVTYPE_FEET = "8",
    INVTYPE_WRIST = "9", INVTYPE_HAND = "10", INVTYPE_CLOAK = "15",
    INVTYPE_FINGER = "RING", INVTYPE_TRINKET = "TRINKET",
    INVTYPE_WEAPON = "WEAPON", INVTYPE_2HWEAPON = "WEAPON",
    INVTYPE_WEAPONMAINHAND = "WEAPON", INVTYPE_WEAPONOFFHAND = "WEAPON",
    INVTYPE_HOLDABLE = "WEAPON", INVTYPE_SHIELD = "WEAPON",
    INVTYPE_RANGED = "WEAPON", INVTYPE_RANGEDRIGHT = "WEAPON",
}
-- Max chevrons per slot group (dual-slot items get 2)
local DUAL_SLOT_MAX = { RING = 2, TRINKET = 2, WEAPON = 2 }

-- Best-upgrade-per-slot state
local bestUpgradeMap = {}   -- { [itemLink] = { r, g, b } }
local mapBuildTime = 0
local MAP_THROTTLE = 0.05   -- 50ms dedup window

-- Cached spec data (refreshed at the start of each evaluation pass)
local cachedClassTag = nil
local cachedClassSpecs = nil
local cachedActiveSpecID = nil

local function RefreshCachedSpec()
    local _, classTag = API:UnitClass("player")
    cachedClassTag = classTag
    cachedClassSpecs = Addon.ClassData[classTag]
    local specIndex = API:GetSpecialization()
    cachedActiveSpecID = specIndex and API:GetSpecializationInfo(specIndex) or nil
end

-- Returns isUpgrade, isHigherTrack, isSetUpgrade for any spec (active or off-spec).
-- specID defaults to active spec if nil.
function Addon:IsUpgrade(itemLink, specID)
    if not itemLink or not Addon.ScoringEngine then return false, false, false end

    -- Use module-level cached spec data (refreshed by RefreshCachedSpec)
    local classSpecs = cachedClassSpecs
    local activeSpecID = cachedActiveSpecID
    if not classSpecs then
        RefreshCachedSpec()
        classSpecs = cachedClassSpecs
        activeSpecID = cachedActiveSpecID
    end

    specID = specID or activeSpecID

    local specData, weights, snapshot, combatRatings
    local isActive = (specID == activeSpecID)

    if isActive then
        specData = Addon.ActiveSpecData
        weights = Addon.ActiveWeights
    else
        local saved = Addon.SpecSnapshots[specID]
        if not saved then return false, false, false end
        specData = classSpecs and classSpecs[specID]
        if not specData then return false, false, false end
        weights = Addon:ResolveWeights(specData, specID)
        snapshot = {}
        for slotID, slotData in pairs(saved.gear) do
            snapshot[slotID] = slotData.link
        end
        combatRatings = saved.combatRatings
    end

    if not specData or not weights then return false, false, false end

    local valid = Addon.ScoringEngine:ValidateEquippable(itemLink, specData)
    if not valid then return false, false, false end

    local comparison = Addon.ScoringEngine:CompareForSlotCategory(
        itemLink, snapshot, specData, weights, combatRatings
    )
    if not comparison then return false, false, false end

    local newScore = comparison.candidateScore
    if not newScore or newScore <= 0 then return false, false, false end
    if comparison.isEquipped then return false, false, false end

    local currentScore = 0
    local compareSlots = {}
    for _, entry in ipairs(comparison.equippedScores) do
        if not entry.isEquipped then
            table_insert(compareSlots, entry.score)
        end
    end
    if #compareSlots == 0 then
        return false, false, false
    elseif #compareSlots == 1 then
        currentScore = compareSlots[1]
    else
        if compareSlots[1] > 0 and compareSlots[2] > 0 then
            currentScore = math_min(compareSlots[1], compareSlots[2])
        else
            currentScore = math_max(compareSlots[1], compareSlots[2])
        end
    end
    if currentScore <= 0 then return true, false, false end

    local S = Addon.ScoringEngine
    local equippedLink, weakestSlotID = S:GetWeakestEquipped(itemLink, snapshot, specData, weights, combatRatings)
    if equippedLink and weakestSlotID then
        local result = S:EvaluateSetComparison(itemLink, equippedLink, weakestSlotID, snapshot)

        if result.type == S.SET_ILVL_UP then
            return true, false, false
        elseif result.type == S.SET_NEED_PIECES then
            return true, false, true
        elseif result.type == S.SET_TRACK_UP then
            return true, false, false
        elseif result.type == S.CATALYST_TRACK then
            return true, true, false
        elseif result.type == S.SET_PROTECTED or result.type == S.SET_ILVL_DOWN or result.type == S.SET_SIDEGRADE then
            return false, false, false
        end
    end

    local pct = ((newScore - currentScore) / currentScore) * 100

    if pct <= 0.1 then
        if equippedLink then
            local isHigher, trackInfo = S:IsHigherTrack(itemLink, equippedLink)
            if isHigher and trackInfo then
                local maxScore = S:EstimateMaxScore(newScore, trackInfo)
                if maxScore > currentScore then
                    return true, true, false
                end
            end
        end
    end

    return pct > 0.1, false, false
end

-- ============================================================
-- Best-Upgrade-Per-Slot Map
-- ============================================================

-- Scan all bag items, group by slot, keep only the best N per slot group.
-- Stores winners in bestUpgradeMap keyed by itemLink → {r, g, b}.
local function RebuildBestUpgradeMap()
    local now = API:GetTime()
    if next(bestUpgradeMap) ~= nil and (now - mapBuildTime) < MAP_THROTTLE then return end

    wipe(bestUpgradeMap)
    mapBuildTime = now

    if not Addon.ScoringEngine then return end

    local S = Addon.ScoringEngine
    RefreshCachedSpec()
    local classSpecs = cachedClassSpecs
    if not classSpecs then return end
    local activeSpecID = cachedActiveSpecID

    local groups = {} -- { [groupKey] = { {link, r, g, b, tier, priority, score}, ... } }

    for bagID = 0, (NUM_BAG_SLOTS or 4) do
        local numSlots = API:GetContainerNumSlots(bagID)
        for slotID = 1, (numSlots or 0) do
            local itemLink = API:GetContainerItemLink(bagID, slotID)
            if itemLink then
                local _, _, _, equipSlot = API:GetItemInfoInstant(itemLink)
                local groupKey = equipSlot and EQUIP_LOC_GROUP[equipSlot]

                if groupKey then
                    local r, g, b, tier, priority, score

                    -- Check active spec first
                    if activeSpecID then
                        local isUpgrade, isHigherTrack, isSetUpgrade = Addon:IsUpgrade(itemLink, activeSpecID)
                        if isUpgrade then
                            tier = 1
                            if isSetUpgrade then
                                r, g, b = C.CHEVRON_BLUE_R, C.CHEVRON_BLUE_G, C.CHEVRON_BLUE_B
                                priority = 1
                            elseif isHigherTrack then
                                r, g, b = C.CHEVRON_YELLOW_R, C.CHEVRON_YELLOW_G, C.CHEVRON_YELLOW_B
                                priority = 3
                            else
                                r, g, b = C.CHEVRON_GREEN_R, C.CHEVRON_GREEN_G, C.CHEVRON_GREEN_B
                                priority = 2
                            end
                            score = S:GetMultiplicativeScore(itemLink)
                        end
                    end

                    -- Check off-specs if not an active-spec upgrade
                    if not tier then
                        for specID in pairs(classSpecs) do
                            local sd = classSpecs[specID]
                            if specID ~= activeSpecID and (not sd or sd.name ~= "Initial") then
                                local isUpgrade = Addon:IsUpgrade(itemLink, specID)
                                if isUpgrade then
                                    tier = 2
                                    r, g, b = C.CHEVRON_OFFSPEC_R, C.CHEVRON_OFFSPEC_G, C.CHEVRON_OFFSPEC_B
                                    priority = 4
                                    score = S:GetMultiplicativeScore(itemLink)
                                    if score <= 0 then
                                        score = tonumber((API:GetDetailedItemLevelInfo(itemLink))) or 0
                                    end
                                    break
                                end
                            end
                        end
                    end

                    if tier then
                        if not groups[groupKey] then groups[groupKey] = {} end
                        table_insert(groups[groupKey], {
                            link = itemLink,
                            r = r, g = g, b = b,
                            tier = tier,
                            priority = priority,
                            score = score,
                        })
                    end
                end
            end
        end
    end

    -- For each slot group, sort and keep top N unique item links
    for groupKey, candidates in pairs(groups) do
        table_sort(candidates, function(a, b)
            if a.tier ~= b.tier then return a.tier < b.tier end
            if a.priority ~= b.priority then return a.priority < b.priority end
            return a.score > b.score
        end)

        local maxSlots = DUAL_SLOT_MAX[groupKey] or 1
        local count = 0
        for i = 1, #candidates do
            if count >= maxSlots then break end
            local c = candidates[i]
            if not bestUpgradeMap[c.link] then
                bestUpgradeMap[c.link] = { c.r, c.g, c.b }
                count = count + 1
            end
        end
    end
end

-- Invalidation hook for Core.lua to call on cache wipes
function Addon.InvalidateBestUpgradeMap()
    mapBuildTime = 0
end

-- Lazily create or retrieve the chevron overlay texture on a button
local function GetOrCreateChevron(button)
    if button.HeroScaleChevron then return button.HeroScaleChevron end

    local tex = button:CreateTexture(nil, "OVERLAY", nil, 2)
    tex:SetTexture(Addon.CHEVRON_PATH)
    tex:SetSize(CHEVRON_SIZE, CHEVRON_SIZE)
    tex:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -2, 2)
    tex:SetVertexColor(C.CHEVRON_GREEN_R, C.CHEVRON_GREEN_G, C.CHEVRON_GREEN_B)
    tex:Hide()

    button.HeroScaleChevron = tex
    return tex
end

-- Show or hide the chevron on a button based on whether its item is an upgrade.
-- isBagItem: when true, uses the pre-computed best-upgrade map (bag filtering).
-- When false/nil, evaluates every item individually (loot, vault, quest, roll contexts).
local function UpdateButton(button, itemLink, isBagItem)
    local chevron = GetOrCreateChevron(button)
    if not itemLink then
        chevron:Hide()
        return
    end

    if isBagItem then
        -- Bag context: only show chevron if this item is the best for its slot
        local color = bestUpgradeMap[itemLink]
        if color then
            chevron:SetVertexColor(color[1], color[2], color[3])
            chevron:Show()
        else
            chevron:Hide()
        end
    else
        -- Non-bag context (loot, vault, quest, rolls): show all upgrades
        local isUpgrade, isHigherTrack, isSetUpgrade = Addon:IsUpgrade(itemLink)
        if isUpgrade then
            if isHigherTrack then
                chevron:SetVertexColor(C.CHEVRON_YELLOW_R, C.CHEVRON_YELLOW_G, C.CHEVRON_YELLOW_B)
            elseif isSetUpgrade then
                chevron:SetVertexColor(C.CHEVRON_BLUE_R, C.CHEVRON_BLUE_G, C.CHEVRON_BLUE_B)
            else
                chevron:SetVertexColor(C.CHEVRON_GREEN_R, C.CHEVRON_GREEN_G, C.CHEVRON_GREEN_B)
            end
            chevron:Show()
        else
            -- Check off-specs (uses module-level cached spec data)
            local offSpecUpgrade = false
            if cachedClassSpecs then
                for specID in pairs(cachedClassSpecs) do
                    local sd = cachedClassSpecs[specID]
                    if specID ~= cachedActiveSpecID and (not sd or sd.name ~= "Initial") and Addon:IsUpgrade(itemLink, specID) then
                        offSpecUpgrade = true
                        break
                    end
                end
            end
            if offSpecUpgrade then
                chevron:SetVertexColor(C.CHEVRON_OFFSPEC_R, C.CHEVRON_OFFSPEC_G, C.CHEVRON_OFFSPEC_B)
                chevron:Show()
            else
                chevron:Hide()
            end
        end
    end
end

-- ============================================================
-- Bags
-- ============================================================

-- Scan a container frame using EnumerateValidItems (WoW 12.0 API)
local function UpdateBagFrame(containerFrame)
    if not containerFrame.EnumerateValidItems then return end
    RebuildBestUpgradeMap() -- throttled: no-op if recently built
    for _, button in containerFrame:EnumerateValidItems() do
        local bagID = button:GetBagID()
        local slotID = button:GetID()
        local link = API:GetContainerItemLink(bagID, slotID)
        UpdateButton(button, link, true)
    end
end

-- Hook the mixin prototype so all container frames inherit the hook
if ContainerFrameMixin then
    hooksecurefunc(ContainerFrameMixin, "UpdateItems", UpdateBagFrame)
end

-- Hook combined bags view directly as it may override UpdateItems
if ContainerFrameCombinedBags then
    hooksecurefunc(ContainerFrameCombinedBags, "UpdateItems", UpdateBagFrame)
end

-- Hook individual bag frame instances as fallback
for i = 1, 13 do
    local cf = _G["ContainerFrame" .. i]
    if cf then
        hooksecurefunc(cf, "UpdateItems", UpdateBagFrame)
    end
end

-- Force refresh all visible bag frames
local function UpdateAllBags()
    if ContainerFrameCombinedBags and ContainerFrameCombinedBags:IsShown() then
        UpdateBagFrame(ContainerFrameCombinedBags)
    end
    if ContainerFrameContainer and ContainerFrameContainer.ContainerFrames then
        for _, frame in ipairs(ContainerFrameContainer.ContainerFrames) do
            if frame:IsShown() then
                UpdateBagFrame(frame)
            end
        end
    end
end

-- ============================================================
-- Loot Window
-- ============================================================
local lootButtons = {}

local function UpdateLootFrame()
    for _, button in ipairs(lootButtons) do
        if button.HeroScaleChevron then
            button.HeroScaleChevron:Hide()
        end
    end
    wipe(lootButtons)

    local numItems = API:GetNumLootItems()
    for i = 1, numItems do
        local link = API:GetLootSlotLink(i)
        local button = _G["LootButton" .. i]
        if button then
            table_insert(lootButtons, button)
            UpdateButton(button, link)
        end
    end
end

local lootEventFrame = CreateFrame("Frame")
lootEventFrame:RegisterEvent("LOOT_OPENED")
lootEventFrame:RegisterEvent("LOOT_CLOSED")
lootEventFrame:SetScript("OnEvent", function(_, event)
    if event == "LOOT_OPENED" then
        API:After(0.1, UpdateLootFrame)
    else
        for _, button in ipairs(lootButtons) do
            if button.HeroScaleChevron then
                button.HeroScaleChevron:Hide()
            end
        end
        wipe(lootButtons)
    end
end)

-- ============================================================
-- Group Loot Rolls (Need/Greed/Transmog)
-- ============================================================
local rollButtons = {}

local function UpdateGroupLootFrame(frame)
    if not frame or not frame.rollID then return end
    local link = API:GetLootRollItemLink(frame.rollID)
    local iconFrame = frame.IconFrame
    if iconFrame then
        UpdateButton(iconFrame, link)
        rollButtons[iconFrame] = true
    end
end

local rollEventFrame = CreateFrame("Frame")
rollEventFrame:RegisterEvent("START_LOOT_ROLL")
rollEventFrame:RegisterEvent("CANCEL_LOOT_ROLL")
rollEventFrame:SetScript("OnEvent", function(_, event, rollID)
    if event == "START_LOOT_ROLL" then
        API:After(0.1, function()
            for i = 1, NUM_GROUP_LOOT_FRAMES or 4 do
                local frame = _G["GroupLootFrame" .. i]
                if frame and frame:IsShown() and frame.rollID == rollID then
                    UpdateGroupLootFrame(frame)
                    break
                end
            end
        end)
    elseif event == "CANCEL_LOOT_ROLL" then
        for i = 1, NUM_GROUP_LOOT_FRAMES or 4 do
            local frame = _G["GroupLootFrame" .. i]
            if frame and frame.rollID == rollID then
                local iconFrame = frame.IconFrame
                if iconFrame and iconFrame.HeroScaleChevron then
                    iconFrame.HeroScaleChevron:Hide()
                end
                rollButtons[iconFrame] = nil
                break
            end
        end
    end
end)

-- ============================================================
-- Great Vault (WeeklyRewardsFrame is load-on-demand)
-- ============================================================
local function UpdateWeeklyRewards()
    local frame = WeeklyRewardsFrame
    if not frame or not frame.Activities then return end

    for _, activityFrame in ipairs(frame.Activities) do
        local itemFrame = activityFrame.ItemFrame
        if itemFrame and itemFrame.displayedItemDBID then
            local link = API:GetItemHyperlink(itemFrame.displayedItemDBID)
            UpdateButton(itemFrame, link)
        elseif itemFrame and itemFrame.HeroScaleChevron then
            itemFrame.HeroScaleChevron:Hide()
        end
    end
end

local function HookWeeklyRewards()
    if not WeeklyRewardsFrame then return end
    WeeklyRewardsFrame:HookScript("OnShow", function()
        -- First pass after initial load
        API:After(0.5, UpdateWeeklyRewards)
        -- Second pass for async item data that loads slowly
        API:After(1.5, UpdateWeeklyRewards)
    end)
end

if WeeklyRewardsFrame then
    HookWeeklyRewards()
else
    local vaultLoader = CreateFrame("Frame")
    vaultLoader:RegisterEvent("ADDON_LOADED")
    vaultLoader:SetScript("OnEvent", function(_, _, addon)
        if addon == "Blizzard_WeeklyRewards" then
            HookWeeklyRewards()
            vaultLoader:UnregisterEvent("ADDON_LOADED")
        end
    end)
end

-- ============================================================
-- Quest Rewards
-- ============================================================
local function UpdateQuestRewards()
    -- Scan choice rewards (pick one of N — most gear comes from here)
    local numChoices = API:GetNumQuestChoices()
    for i = 1, numChoices do
        local button = _G["QuestInfoRewardsFrameQuestInfoItem" .. i]
        if button then
            local link = API:GetQuestItemLink("choice", i)
            UpdateButton(button, link)
        end
    end

    -- Scan guaranteed rewards (you get all of these)
    local numRewards = API:GetNumQuestRewards()
    for i = 1, numRewards do
        local button = _G["QuestInfoRewardsFrameQuestInfoItem" .. (numChoices + i)]
        if button then
            local link = API:GetQuestItemLink("reward", i)
            UpdateButton(button, link)
        end
    end
end

hooksecurefunc("QuestInfo_Display", function()
    API:After(0.3, UpdateQuestRewards)
    API:After(1.0, UpdateQuestRewards)
end)

-- ============================================================
-- Merchant / Vendor Window
-- ============================================================
local merchantButtons = {}

local function UpdateMerchantItems()
    for _, button in ipairs(merchantButtons) do
        if button.HeroScaleChevron then
            button.HeroScaleChevron:Hide()
        end
    end
    wipe(merchantButtons)

    if not MerchantFrame or not MerchantFrame:IsShown() then return end
    if not Addon.ScoringEngine then return end

    local S = Addon.ScoringEngine
    RefreshCachedSpec()
    local classSpecs = cachedClassSpecs
    local activeSpecID = cachedActiveSpecID

    local isBuyback = (MerchantFrame.selectedTab == 2)
    local itemsPerPage = isBuyback and (BUYBACK_ITEMS_PER_PAGE or 12) or (MERCHANT_ITEMS_PER_PAGE or 10)
    local numItems = isBuyback and API:GetNumBuybackItems() or API:GetMerchantNumItems()
    local pageOffset = isBuyback and 0 or (((MerchantFrame.page or 1) - 1) * itemsPerPage)

    -- First pass: collect upgrade candidates grouped by slot
    local groups = {}   -- { [groupKey] = { {button, r, g, b, tier, priority, score}, ... } }

    for i = 1, itemsPerPage do
        local button = _G["MerchantItem" .. i .. "ItemButton"]
        if button and button:IsShown() then
            table_insert(merchantButtons, button)

            local link
            if isBuyback then
                link = API:GetBuybackItemLink(i)
            elseif pageOffset + i <= numItems then
                link = API:GetMerchantItemLink(pageOffset + i)
            end

            if link then
                local _, _, _, equipSlot = API:GetItemInfoInstant(link)
                local groupKey = equipSlot and EQUIP_LOC_GROUP[equipSlot]

                if groupKey then
                    local r, g, b, tier, priority, score

                    -- Check active spec
                    if activeSpecID then
                        local isUpgrade, isHigherTrack, isSetUpgrade = Addon:IsUpgrade(link, activeSpecID)
                        if isUpgrade then
                            tier = 1
                            if isSetUpgrade then
                                r, g, b = C.CHEVRON_BLUE_R, C.CHEVRON_BLUE_G, C.CHEVRON_BLUE_B
                                priority = 1
                            elseif isHigherTrack then
                                r, g, b = C.CHEVRON_YELLOW_R, C.CHEVRON_YELLOW_G, C.CHEVRON_YELLOW_B
                                priority = 3
                            else
                                r, g, b = C.CHEVRON_GREEN_R, C.CHEVRON_GREEN_G, C.CHEVRON_GREEN_B
                                priority = 2
                            end
                            score = S:GetMultiplicativeScore(link)
                        end
                    end

                    -- Check off-specs if not an active-spec upgrade
                    if not tier and classSpecs then
                        for specID in pairs(classSpecs) do
                            local sd = classSpecs[specID]
                            if specID ~= activeSpecID and (not sd or sd.name ~= "Initial") then
                                local isUpgrade = Addon:IsUpgrade(link, specID)
                                if isUpgrade then
                                    tier = 2
                                    r, g, b = C.CHEVRON_OFFSPEC_R, C.CHEVRON_OFFSPEC_G, C.CHEVRON_OFFSPEC_B
                                    priority = 4
                                    score = S:GetMultiplicativeScore(link)
                                    if score <= 0 then
                                        score = tonumber((API:GetDetailedItemLevelInfo(link))) or 0
                                    end
                                    break
                                end
                            end
                        end
                    end

                    if tier then
                        if not groups[groupKey] then groups[groupKey] = {} end
                        table_insert(groups[groupKey], {
                            button = button,
                            r = r, g = g, b = b,
                            tier = tier, priority = priority, score = score,
                        })
                    end
                end
            end
        end
    end

    -- Second pass: pick best N per slot group, show chevrons only on winners
    for groupKey, candidates in pairs(groups) do
        table_sort(candidates, function(a, b)
            if a.tier ~= b.tier then return a.tier < b.tier end
            if a.priority ~= b.priority then return a.priority < b.priority end
            return a.score > b.score
        end)

        local maxSlots = DUAL_SLOT_MAX[groupKey] or 1
        local count = 0
        for _, c in ipairs(candidates) do
            if count >= maxSlots then break end
            local chevron = GetOrCreateChevron(c.button)
            chevron:SetVertexColor(c.r, c.g, c.b)
            chevron:Show()
            count = count + 1
        end
    end
end

local merchantEventFrame = CreateFrame("Frame")
merchantEventFrame:RegisterEvent("MERCHANT_SHOW")
merchantEventFrame:RegisterEvent("MERCHANT_UPDATE")
merchantEventFrame:RegisterEvent("MERCHANT_CLOSED")
merchantEventFrame:SetScript("OnEvent", function(_, event)
    if event == "MERCHANT_CLOSED" then
        for _, button in ipairs(merchantButtons) do
            if button.HeroScaleChevron then
                button.HeroScaleChevron:Hide()
            end
        end
        wipe(merchantButtons)
    else
        API:After(0.1, UpdateMerchantItems)
    end
end)

-- Hook MerchantFrame_Update for page changes and tab switches
if MerchantFrame_Update then
    hooksecurefunc("MerchantFrame_Update", function()
        API:After(0.1, UpdateMerchantItems)
    end)
end

-- ============================================================
-- Baganator Integration (optional — only active when Baganator is installed)
-- ============================================================
local function RegisterBaganator()
    if not Baganator or not Baganator.API or not Baganator.API.RegisterCornerWidget then return end

    Baganator.API.RegisterCornerWidget(
        "HeroScale",
        "heroscale_chevron",
        function(tex, details)
            if not details.itemLink then return false end
            RebuildBestUpgradeMap() -- throttled
            local color = bestUpgradeMap[details.itemLink]
            if color then
                tex:SetVertexColor(color[1], color[2], color[3])
                return true
            end
            return false
        end,
        function(itemButton)
            local tex = itemButton:CreateTexture(nil, "OVERLAY", nil, 2)
            tex:SetTexture(Addon.CHEVRON_PATH)
            tex:SetSize(CHEVRON_SIZE, CHEVRON_SIZE)
            return tex
        end,
        { corner = "bottom_right", priority = 2 }
    )

    if Baganator.API.RegisterUpgradePlugin then
        Baganator.API.RegisterUpgradePlugin(
            "HeroScale",
            "heroscale",
            function(itemLink)
                if not itemLink then return false end
                RebuildBestUpgradeMap() -- throttled
                return bestUpgradeMap[itemLink] ~= nil
            end
        )
    end
end

if Baganator and Baganator.API then
    RegisterBaganator()
else
    local bagLoader = CreateFrame("Frame")
    bagLoader:RegisterEvent("ADDON_LOADED")
    bagLoader:SetScript("OnEvent", function(_, _, addon)
        if addon == "Baganator" then
            API:After(0, RegisterBaganator)
            bagLoader:UnregisterEvent("ADDON_LOADED")
        end
    end)
end

-- ============================================================
-- Bagnon Integration (optional — only active when Bagnon is installed)
-- ============================================================
local bagnonButtons = {}

local function HookBagnon()
    if not Bagnon or not Bagnon.ContainerItem then return end

    local ContainerItem = Bagnon.ContainerItem
    if not ContainerItem.Update then return end

    hooksecurefunc(ContainerItem, 'Update', function(self)
        local info = self.info
        if info and info.hyperlink then
            RebuildBestUpgradeMap() -- throttled
            UpdateButton(self, info.hyperlink, true)
            bagnonButtons[self] = true
        else
            if self.HeroScaleChevron then
                self.HeroScaleChevron:Hide()
            end
            bagnonButtons[self] = nil
        end
    end)
end

if Bagnon then
    HookBagnon()
else
    local bgnLoader = CreateFrame("Frame")
    bgnLoader:RegisterEvent("ADDON_LOADED")
    bgnLoader:SetScript("OnEvent", function(_, _, addon)
        if addon == "Bagnon" then
            API:After(0, HookBagnon)
            bgnLoader:UnregisterEvent("ADDON_LOADED")
        end
    end)
end

-- ============================================================
-- Refresh all visible overlays (called from Core.lua on gear change)
-- ============================================================
function Addon:RefreshAllOverlays()
    -- Force rebuild the best-upgrade map with current weights.
    -- Critical for third-party bag addons (Baganator, Bagnon) that replace
    -- default bag frames — without this, UpdateAllBags finds no visible
    -- default frames and the map stays empty.
    mapBuildTime = 0
    RebuildBestUpgradeMap()

    UpdateAllBags()

    if LootFrame and LootFrame:IsShown() then
        UpdateLootFrame()
    end

    if MerchantFrame and MerchantFrame:IsShown() then
        UpdateMerchantItems()
    end

    if WeeklyRewardsFrame and WeeklyRewardsFrame:IsShown() then
        UpdateWeeklyRewards()
    end

    for iconFrame in pairs(rollButtons) do
        local parent = iconFrame:GetParent()
        if parent and parent.rollID then
            local link = API:GetLootRollItemLink(parent.rollID)
            if link then
                UpdateButton(iconFrame, link)
            elseif iconFrame.HeroScaleChevron then
                iconFrame.HeroScaleChevron:Hide()
            end
        end
    end

    if Baganator and Baganator.API and Baganator.API.RequestItemButtonsRefresh then
        Baganator.API.RequestItemButtonsRefresh()
    end

    for button in pairs(bagnonButtons) do
        local info = button.info
        if info and info.hyperlink then
            UpdateButton(button, info.hyperlink, true)
        elseif button.HeroScaleChevron then
            button.HeroScaleChevron:Hide()
        end
    end
end
