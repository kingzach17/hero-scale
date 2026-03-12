local _, Addon = ...
local API = Addon.API
local frame = CreateFrame("Frame")
local pendingTimer = nil
local snapshotTimer = nil
local autoEquipTimer = nil
local autoEquipCooldown = 0
local playerLevel = 0
local AUTO_EQUIP_COOLDOWN = 2.0
local AUTO_EQUIP_DELAY = 0.8

local pairs = pairs
local ipairs = ipairs
local wipe = wipe
local math_abs = math.abs
local table_insert = table.insert
local table_concat = table.concat
local table_sort = table.sort

local SNAPSHOT_STAT_MAP = {
    ["ITEM_MOD_CRIT_RATING_SHORT"]    = "CRIT",
    ["ITEM_MOD_HASTE_RATING_SHORT"]   = "HASTE",
    ["ITEM_MOD_MASTERY_RATING_SHORT"] = "MASTERY",
    ["ITEM_MOD_VERSATILITY"]          = "VERS",
}

-- Resolves spec data to a flat weight table.
-- Looks up the saved content type for the spec, defaulting to "Leveling".
function Addon:ResolveWeights(specData, specID)
    if not specData or not specData.weights then return nil end
    local ct = HeroScaleCharDB and HeroScaleCharDB.contentTypes
    local contentType = ct and ct[specID] or "Leveling"
    return specData.weights[contentType] or specData.weights["Leveling"]
end

function Addon:UpdateActiveData()
    local _, classTag = API:UnitClass("player")
    local specIndex = API:GetSpecialization()
    if not specIndex or specIndex == 0 then return end
    local specID, specName = API:GetSpecializationInfo(specIndex)

    if Addon.ClassData[classTag] and Addon.ClassData[classTag][specID] then
        local data = Addon.ClassData[classTag][specID]
        Addon.ActiveSpecData = data
        Addon.ActiveSpecName = data.name

        Addon.ActiveWeights = self:ResolveWeights(data, specID)

        -- Track active content type and role for display
        local ct = HeroScaleCharDB and HeroScaleCharDB.contentTypes
        Addon.ActiveContentType = ct and ct[specID] or "Leveling"
        Addon.ActiveRole = data.role

        Addon.ScoringEngine:InvalidateCaches()

    elseif not Addon.ClassData[classTag] then
        print("|cff00ccffHero Scale:|r No data for " .. (classTag or "unknown class") .. ". Module may not be available yet.")
    else
        -- Spec exists in WoW but not in ClassData — likely wrong specID in class module
        Addon.ActiveWeights = nil
        Addon.ActiveSpecData = nil
        Addon.ActiveSpecName = ""
        Addon.ActiveContentType = "Leveling"
        Addon.ActiveRole = nil
        print("|cff00ccffHero Scale:|r Spec ID " .. tostring(specID) .. " (" .. tostring(specName) .. ") not found in class data for " .. classTag .. ". Please report this.")
    end
end

function Addon:CaptureSpecSnapshot()
    local specIndex = API:GetSpecialization()
    if not specIndex or specIndex == 0 then return end
    local specID = API:GetSpecializationInfo(specIndex)
    if not specID then return end

    local snapshot = {
        timestamp = API:GetTime(),
        gear = {},
        totalStats = { CRIT = 0, HASTE = 0, MASTERY = 0, VERS = 0 },
        combatRatings = {},
    }

    for slotID = 1, 17 do
        local link = API:GetInventoryItemLink("player", slotID)
        if link then
            local strippedLink = Addon.ScoringEngine:StripLink(link)
            local itemStats = API:GetItemStats(strippedLink)
            local slotStats = {}
            if itemStats then
                for wowKey, shortKey in pairs(SNAPSHOT_STAT_MAP) do
                    local val = itemStats[wowKey]
                    if val and val > 0 then
                        slotStats[shortKey] = val
                        snapshot.totalStats[shortKey] = snapshot.totalStats[shortKey] + val
                    end
                end
            end
            snapshot.gear[slotID] = { link = strippedLink, stats = slotStats }
        end
    end

    local DR = Addon.DR
    for _, statKey in ipairs(DR:GetSecondaryStats()) do
        local ratingIdx = DR:GetRatingIndex(statKey)
        if ratingIdx then
            snapshot.combatRatings[statKey] = {
                rating = API:GetCombatRating(ratingIdx),
                bonus  = API:GetCombatRatingBonus(ratingIdx),
            }
        end
    end

    Addon.SpecSnapshots[specID] = snapshot
end

local function QueueSnapshotCapture(delay)
    if snapshotTimer then snapshotTimer:Cancel() end
    snapshotTimer = API:NewTimer(delay, function()
        snapshotTimer = nil
        Addon:CaptureSpecSnapshot()
    end)
end

local EvaluateSlotEntry -- forward declaration (defined after helper functions below)

-- Evaluates an item for a specific spec (active or off-spec).
-- Returns a list of entry tables suitable for tooltip display.
function Addon:EvaluateForSpec(itemLink, specID)
    local _, classTag = API:UnitClass("player")
    local classSpecs = Addon.ClassData[classTag]
    local specData = classSpecs and classSpecs[specID]
    if not specData then return {} end

    local specIndex = API:GetSpecialization()
    local activeSpecID = specIndex and API:GetSpecializationInfo(specIndex)
    local isActive = (specID == activeSpecID)

    local weights, snapshot, combatRatings
    if isActive then
        weights = Addon.ActiveWeights
    else
        local saved = Addon.SpecSnapshots[specID]
        if not saved then return {} end
        weights = self:ResolveWeights(specData, specID)
        snapshot = {}
        for slotID, slotData in pairs(saved.gear) do
            snapshot[slotID] = slotData.link
        end
        combatRatings = saved.combatRatings
    end

    if not weights then return {} end

    local specName = specData.name
    local valid, reason = Addon.ScoringEngine:ValidateEquippable(itemLink, specData)
    if not valid then
        if isActive then
            if reason == "WEAPON" then
                return {{ prefix = specName, type = "CANNOT_EQUIP_WEAPON" }}
            elseif reason == "ARMOR" then
                return {{ prefix = specName, type = "WRONG_ARMOR" }}
            end
        end
        return {}
    end

    local comparison = Addon.ScoringEngine:CompareForSlotCategory(
        itemLink, snapshot, specData, weights, combatRatings
    )
    if not comparison then return {} end

    local newScore = comparison.candidateScore
    if not newScore or newScore <= 0 then return {} end

    if comparison.isEquipped then
        return {{ prefix = specName, type = "CURRENTLY_EQUIPPED" }}
    end

    local slotScores = comparison.equippedScores
    local trinketResult = isActive and comparison.trinketComparison or nil
    local entries = {}

    if #slotScores > 0 then
        local slotEntries = {}
        for _, slotInfo in ipairs(slotScores) do
            local prefix = slotInfo.slotName ~= ""
                and (specName .. " " .. slotInfo.slotName)
                or specName

            if slotInfo.isEquipped then
                table_insert(slotEntries, { prefix = prefix, type = "CURRENTLY_EQUIPPED" })
            elseif slotInfo.equippedLink then
                local equippedLink = slotInfo.equippedLink
                local equippedScore = slotInfo.score or 0
                local setResult = Addon.ScoringEngine:EvaluateSetComparison(
                    itemLink, equippedLink, slotInfo.slotID, snapshot
                )
                local trackName = self:CheckHigherTrack(itemLink, slotInfo, newScore, equippedScore)
                table_insert(slotEntries, EvaluateSlotEntry(
                    prefix, newScore, equippedScore, setResult, trackName,
                    trinketResult, itemLink, equippedLink
                ))
            else
                table_insert(slotEntries, { prefix = prefix, type = "EMPTY_SLOT" })
            end
        end

        local POSITIVE_TYPES = {
            UPGRADE = true, BIG_UPGRADE = true, SET_ILVL_UP = true,
            SET_NEED_PIECES = true, SET_TRACK_UP = true, CATALYST_TRACK = true,
            HIGHER_TRACK = true, TIER_UPGRADE = true, EMPTY_SLOT = true,
        }
        if #slotEntries == 2 then
            local p1 = POSITIVE_TYPES[slotEntries[1].type]
            local p2 = POSITIVE_TYPES[slotEntries[2].type]
            if p1 and not p2 then
                slotEntries = { slotEntries[1] }
            elseif p2 and not p1 then
                slotEntries = { slotEntries[2] }
            end
        end

        for _, entry in ipairs(slotEntries) do
            table_insert(entries, entry)
        end
    else
        table_insert(entries, { prefix = specName, type = "EMPTY_SLOT" })
    end

    return entries
end

-- Returns the track name if the candidate item is on a higher upgrade track
-- and its max-upgraded score would beat the equipped item, or nil otherwise.
-- Uses slotInfo.equippedLink if available (off-spec), otherwise queries live inventory.
function Addon:CheckHigherTrack(candidateLink, slotInfo, newScore, currentScore)
    if not Addon.ScoringEngine then return nil end

    local equippedLink = slotInfo.equippedLink
        or (slotInfo.slotID and API:GetInventoryItemLink("player", slotInfo.slotID))
        or nil
    if not equippedLink then return nil end

    local isHigher, trackInfo = Addon.ScoringEngine:IsHigherTrack(candidateLink, equippedLink)
    if not isHigher or not trackInfo then return nil end

    local maxScore = Addon.ScoringEngine:EstimateMaxScore(newScore, trackInfo)
    if maxScore <= currentScore then return nil end

    return trackInfo.name
end

-- Calculate set bonus modifier based on transition
local function GetSetBonusModifier(setTransition)
    if not setTransition then return 0 end
    if setTransition.gaining4pc then
        return 15  -- +15% for gaining 4-piece bonus
    elseif setTransition.gaining2pc then
        return 8   -- +8% for gaining 2-piece bonus
    elseif setTransition.losing4pc then
        return -15 -- -15% for losing 4-piece bonus
    elseif setTransition.losing2pc then
        return -8  -- -8% for losing 2-piece bonus
    end
    return 0
end

-- Evaluates a slot comparison and returns a structured entry table
EvaluateSlotEntry = function(prefix, newScore, currentScore, setResult, trackName, trinketResult, candidateLink, equippedLink)
    local S = Addon.ScoringEngine
    local setType = setResult and setResult.type or S.NORMAL
    local setTransition = setResult and setResult.setTransition or nil
    local setBonusModifier = GetSetBonusModifier(setTransition)

    -- Calculate track penalty and warning for lower-track items
    local trackPenalty = 0
    local trackWarning = nil
    local candidateTrackName = nil
    if candidateLink and equippedLink and S.GetTrackPenalty then
        trackPenalty = S:GetTrackPenalty(candidateLink, equippedLink)
        trackWarning = S:GetTrackWarning(candidateLink, equippedLink)
        if trackWarning and S.GetTrackInfo then
            local candidateTrackInfo = S:GetTrackInfo(candidateLink)
            if candidateTrackInfo then
                candidateTrackName = candidateTrackInfo.name
            end
        end
    end

    -- Check trinket tier comparison first
    if trinketResult and trinketResult.best and not trinketResult.best.comparison.useFallback then
        local T = Addon.TrinketEvaluator
        local comp = trinketResult.best.comparison
        if comp.comparison == T.TIER_UPGRADE then
            return { prefix = prefix, type = "TIER_UPGRADE", newTier = comp.newTier, equippedTier = comp.equippedTier, confidence = "LOW" }
        elseif comp.comparison == T.TIER_DOWNGRADE then
            return { prefix = prefix, type = "TIER_DOWNGRADE", newTier = comp.newTier, equippedTier = comp.equippedTier, confidence = "LOW" }
        elseif comp.comparison == T.TIER_SIDEGRADE then
            return { prefix = prefix, type = "TIER_SIDEGRADE", newTier = comp.newTier, confidence = "LOW" }
        end
        -- FALLBACK: continue to standard score comparison below
    end

    if setType == S.SET_ILVL_UP then
        return { prefix = prefix, type = "SET_ILVL_UP", ilvlDiff = setResult.ilvlDiff, setTransition = setTransition }
    elseif setType == S.SET_ILVL_DOWN then
        return { prefix = prefix, type = "SET_ILVL_DOWN", ilvlDiff = setResult.ilvlDiff, setTransition = setTransition }
    elseif setType == S.SET_SIDEGRADE then
        return { prefix = prefix, type = "SET_SIDEGRADE", setTransition = setTransition }
    elseif setType == S.SET_NEED_PIECES then
        return { prefix = prefix, type = "SET_NEED_PIECES", detail = table_concat(setResult.reasons, ", "), setTransition = setTransition }
    elseif setType == S.SET_TRACK_UP then
        return { prefix = prefix, type = "SET_TRACK_UP", trackName = setResult.trackInfo.name, setTransition = setTransition }
    elseif setType == S.CATALYST_TRACK then
        return { prefix = prefix, type = "CATALYST_TRACK", trackName = setResult.trackInfo.name, setTransition = setTransition, catalyst = setResult.catalyst }
    elseif setType == S.SET_PROTECTED then
        local pct = ((newScore - currentScore) / currentScore) * 100 + setBonusModifier - trackPenalty
        return { prefix = prefix, type = "SET_PROTECTED", pct = pct, setTransition = setTransition, trackWarning = trackWarning, candidateTrackName = candidateTrackName }
    end

    -- NORMAL: standard score comparison with set bonus modifier and track penalty applied
    local basePct = ((newScore - currentScore) / currentScore) * 100
    local pct = basePct + setBonusModifier - trackPenalty
    local closeCall = math_abs(pct) < 2

    if pct > 100 then
        return { prefix = prefix, type = "BIG_UPGRADE", pct = pct, setTransition = setTransition, trackWarning = trackWarning, candidateTrackName = candidateTrackName }
    elseif pct > 0.1 then
        return { prefix = prefix, type = "UPGRADE", pct = pct, setTransition = setTransition, trackWarning = trackWarning, candidateTrackName = candidateTrackName, confidence = closeCall and "LOW" or nil }
    elseif pct < -0.1 then
        if trackName then
            return { prefix = prefix, type = "HIGHER_TRACK", trackName = trackName, setTransition = setTransition }
        end
        return { prefix = prefix, type = "DOWNGRADE", pct = pct, setTransition = setTransition, trackWarning = trackWarning, candidateTrackName = candidateTrackName, confidence = closeCall and "LOW" or nil }
    else
        if trackName then
            return { prefix = prefix, type = "HIGHER_TRACK", trackName = trackName, setTransition = setTransition }
        end
        return { prefix = prefix, type = "SIDEGRADE", setTransition = setTransition, trackWarning = trackWarning, candidateTrackName = candidateTrackName, confidence = "LOW" }
    end
end

function Addon:EvaluateItemForTooltip(itemLink)
    if not Addon.ScoringEngine then return nil end

    local _, classTag = API:UnitClass("player")
    local classSpecs = Addon.ClassData[classTag]
    if not classSpecs then return nil end

    local specIndex = API:GetSpecialization()
    local activeSpecID = specIndex and API:GetSpecializationInfo(specIndex)

    -- Active spec
    local activeEntries = {}
    if activeSpecID and Addon.ActiveWeights then
        activeEntries = self:EvaluateForSpec(itemLink, activeSpecID)
    end

    -- Off-specs (downgrades filtered out)
    local NEGATIVE_TYPES = {
        DOWNGRADE = true, SET_ILVL_DOWN = true, SET_PROTECTED = true,
        SIDEGRADE = true, SET_SIDEGRADE = true, TIER_DOWNGRADE = true,
        TIER_SIDEGRADE = true,
    }
    local offSpecEntries = {}
    for specID in pairs(classSpecs) do
        if specID ~= activeSpecID then
            local specData = classSpecs[specID]
            if not specData or specData.name ~= "Initial" then
                local entries = self:EvaluateForSpec(itemLink, specID)
                for _, entry in ipairs(entries) do
                    if not NEGATIVE_TYPES[entry.type] then
                        table_insert(offSpecEntries, entry)
                    end
                end
            end
        end
    end

    if #activeEntries == 0 and #offSpecEntries == 0 then return nil end
    return { activeEntries = activeEntries, offSpecEntries = offSpecEntries }
end

------------------------------------------------------------
-- Auto-Equip System
------------------------------------------------------------

local AUTO_EQUIP_LOC_GROUP = {
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
local AUTO_EQUIP_DUAL_MAX = { RING = 2, TRINKET = 2, WEAPON = 2 }

function Addon:GetAutoEquip()
    return HeroScaleCharDB and HeroScaleCharDB.autoEquip or false
end

function Addon:SetAutoEquip(enabled)
    if HeroScaleCharDB then
        HeroScaleCharDB.autoEquip = enabled
    end
end

function Addon:TryAutoEquip()
    if not HeroScaleCharDB or not HeroScaleCharDB.autoEquip then return end
    if API:InCombatLockdown() then return end
    if not Addon.ActiveWeights or not Addon.ActiveSpecData or not Addon.ScoringEngine then return end

    local now = API:GetTime()
    if (now - autoEquipCooldown) < AUTO_EQUIP_COOLDOWN then return end

    local S = Addon.ScoringEngine
    local groups = {}

    for bagID = 0, (NUM_BAG_SLOTS or 4) do
        local numSlots = API:GetContainerNumSlots(bagID)
        for slotID = 1, (numSlots or 0) do
            local itemLink = API:GetContainerItemLink(bagID, slotID)
            if itemLink then
                local _, _, _, equipSlot = API:GetItemInfoInstant(itemLink)
                local groupKey = equipSlot and AUTO_EQUIP_LOC_GROUP[equipSlot]

                if groupKey then
                    local _, _, _, _, itemMinLevel = API:GetItemInfo(itemLink)
                    if itemMinLevel and itemMinLevel > playerLevel then
                        groupKey = nil
                    end
                end

                if groupKey then
                    local isUpgrade, isHigherTrack = Addon:IsUpgrade(itemLink)
                    if isUpgrade and not isHigherTrack then
                        local score = S:GetMultiplicativeScore(itemLink)
                        local targetSlotID = S:GetWeakestEquippedSlotID(itemLink)
                        if score and score > 0 and targetSlotID then
                            if not groups[groupKey] then groups[groupKey] = {} end
                            table_insert(groups[groupKey], {
                                link = itemLink,
                                score = score,
                                slotID = targetSlotID,
                            })
                        end
                    end
                end
            end
        end
    end

    local equipped = false
    for groupKey, candidates in pairs(groups) do
        table_sort(candidates, function(a, b) return a.score > b.score end)

        local maxSlots = AUTO_EQUIP_DUAL_MAX[groupKey] or 1
        local count = 0
        local usedSlots = {}

        for _, candidate in ipairs(candidates) do
            if count >= maxSlots then break end
            if not usedSlots[candidate.slotID] then
                API:EquipItemByName(candidate.link, candidate.slotID)
                print("|cff00ccffHero Scale:|r Auto-equipped " .. candidate.link)
                usedSlots[candidate.slotID] = true
                count = count + 1
                equipped = true
            end
        end
    end

    if equipped then
        autoEquipCooldown = API:GetTime()
    end
end

frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
frame:RegisterEvent("TRAIT_CONFIG_UPDATED")
frame:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
frame:RegisterEvent("CVAR_UPDATE")
frame:RegisterEvent("CURRENCY_DISPLAY_UPDATE")
frame:RegisterEvent("BAG_UPDATE_DELAYED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:RegisterEvent("PLAYER_LEVEL_UP")
frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "HeroScale" then
        HeroScaleCharDB = HeroScaleCharDB or {}
        HeroScaleCharDB.contentTypes = HeroScaleCharDB.contentTypes or {}
        if HeroScaleCharDB.autoEquip == nil then
            HeroScaleCharDB.autoEquip = false
        end

        -- Migrate old gearSnapshots to new specs format
        if HeroScaleCharDB.gearSnapshots and not HeroScaleCharDB.specs then
            HeroScaleCharDB.specs = {}
            for specID, old in pairs(HeroScaleCharDB.gearSnapshots) do
                local migrated = {
                    timestamp = old.timestamp or 0,
                    heroTalent = old.heroTalent or "None",
                    gear = {},
                    totalStats = { CRIT = 0, HASTE = 0, MASTERY = 0, VERS = 0 },
                    combatRatings = {},
                }
                for slotID = 1, 17 do
                    if old[slotID] then
                        migrated.gear[slotID] = { link = old[slotID], stats = {} }
                    end
                end
                HeroScaleCharDB.specs[specID] = migrated
            end
            HeroScaleCharDB.gearSnapshots = nil
        end

        HeroScaleCharDB.specs = HeroScaleCharDB.specs or {}
        Addon.SpecSnapshots = HeroScaleCharDB.specs
        self:UnregisterEvent("ADDON_LOADED")
        return
    end

    if event == "CVAR_UPDATE" then
        if arg1 == "colorblindMode" or arg1 == "colorblindsimulator" then
            Addon:ApplyColorblindPalette()
            if Addon.RefreshAllOverlays then
                Addon:RefreshAllOverlays()
            end
        end
        return
    end

    if event == "CURRENCY_DISPLAY_UPDATE" then
        -- Invalidate catalyst charge cache when currency changes
        if Addon.ScoringEngine and Addon.ScoringEngine.InvalidateCatalystCache then
            Addon.ScoringEngine:InvalidateCatalystCache()
        end
        return
    end

    if event == "BAG_UPDATE_DELAYED" then
        if HeroScaleCharDB and HeroScaleCharDB.autoEquip then
            if autoEquipTimer then autoEquipTimer:Cancel() end
            autoEquipTimer = API:NewTimer(AUTO_EQUIP_DELAY, function()
                autoEquipTimer = nil
                Addon:TryAutoEquip()
            end)
        end
        return
    end

    if event == "PLAYER_REGEN_ENABLED" then
        if HeroScaleCharDB and HeroScaleCharDB.autoEquip then
            autoEquipCooldown = 0
            if autoEquipTimer then autoEquipTimer:Cancel() end
            autoEquipTimer = API:NewTimer(AUTO_EQUIP_DELAY, function()
                autoEquipTimer = nil
                Addon:TryAutoEquip()
            end)
        end
        return
    end

    if event == "PLAYER_LEVEL_UP" then
        playerLevel = arg1
        return
    end

    if event == "PLAYER_EQUIPMENT_CHANGED" then
        wipe(Addon.DRCache)
        wipe(Addon.ScoreCache)
        wipe(Addon.StrippedLinkCache)
        if Addon.ScoringEngine then Addon.ScoringEngine:InvalidateTrackCache() end
        if Addon.InvalidateBestUpgradeMap then Addon.InvalidateBestUpgradeMap() end
        QueueSnapshotCapture(0.5)
        -- Only schedule refresh if no spec/trait change is pending.
        -- When pendingTimer is active, its callback handles refresh after UpdateActiveData.
        if not pendingTimer and Addon.RefreshAllOverlays then
            API:After(0.6, function() Addon:RefreshAllOverlays() end)
        end
        return
    end

    if event == "PLAYER_ENTERING_WORLD" then
        playerLevel = API:UnitLevel("player")
    end

    if event == "PLAYER_SPECIALIZATION_CHANGED" then
        -- Clean up Initial spec data once a real spec is chosen
        local specIdx = API:GetSpecialization()
        local activeID = specIdx and API:GetSpecializationInfo(specIdx)
        if activeID then
            local _, tag = API:UnitClass("player")
            local cs = Addon.ClassData[tag]
            if cs then
                local activeData = cs[activeID]
                if activeData and activeData.name ~= "Initial" then
                    for sid, sdata in pairs(cs) do
                        if sdata.name == "Initial" then
                            if Addon.SpecSnapshots then
                                Addon.SpecSnapshots[sid] = nil
                            end
                            if HeroScaleCharDB and HeroScaleCharDB.contentTypes then
                                HeroScaleCharDB.contentTypes[sid] = nil
                            end
                            break
                        end
                    end
                end
            end
        end
        QueueSnapshotCapture(2.0)
    end

    if pendingTimer then
        pendingTimer:Cancel()
    end
    pendingTimer = API:NewTimer(0.5, function()
        pendingTimer = nil
        Addon:UpdateActiveData()
        Addon:ApplyColorblindPalette()
        -- Invalidate stale overlay colors and refresh after game state stabilizes
        if Addon.InvalidateBestUpgradeMap then Addon.InvalidateBestUpgradeMap() end
        -- Immediate refresh with correct weights + delayed safety-net
        if Addon.RefreshAllOverlays then
            Addon:RefreshAllOverlays()
            API:After(1.5, function() Addon:RefreshAllOverlays() end)
        end
        if event == "PLAYER_ENTERING_WORLD" then
            QueueSnapshotCapture(2.0)
        end
    end)
end)
