local _, Addon = ...
local API = Addon.API

local string_format = string.format

------------------------------------------------------------
-- Main Page: Visual Legend
------------------------------------------------------------
local panel = CreateFrame("Frame", "HeroScaleOptionsPanel", UIParent)
panel:Hide()
panel.name = "Hero Scale"

local category = Settings.RegisterCanvasLayoutCategory(panel, "Hero Scale")
Settings.RegisterAddOnCategory(category)

-- All legend font strings, rebuilt on OnShow to reflect colorblind palette
local legendLines = {}

local function CreateLine(parent, template, anchor, xOff, yOff)
    local fs = parent:CreateFontString(nil, "OVERLAY", template)
    fs:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", xOff, yOff)
    fs:SetJustifyH("LEFT")
    legendLines[#legendLines + 1] = fs
    return fs
end

-- Title (static)
local title = panel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 16, -16)
title:SetText("Hero Scale")

local subtitle = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
subtitle:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -4)
subtitle:SetText("Tooltip & Overlay Guide")

-- Auto-Equip toggle
local autoEquipCheck = CreateFrame("CheckButton", "HeroScaleAutoEquipCheck", panel, "UICheckButtonTemplate")
autoEquipCheck:SetPoint("TOPLEFT", subtitle, "BOTTOMLEFT", -2, -12)
autoEquipCheck.Text:SetText("Auto-Equip Upgrades")
autoEquipCheck.Text:SetFontObject("GameFontHighlight")
autoEquipCheck:SetChecked(Addon:GetAutoEquip())
autoEquipCheck:SetScript("OnClick", function(self)
    Addon:SetAutoEquip(self:GetChecked())
end)

local autoEquipNote = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
autoEquipNote:SetPoint("TOPLEFT", autoEquipCheck, "BOTTOMLEFT", 24, 0)
autoEquipNote:SetText("|cff999999Automatically equip items that are strict score upgrades|r")

-- Section 1: Overlay Icons
local s1Header = CreateLine(panel, "GameFontNormal", autoEquipNote, 0, -12)

local s1Line1 = CreateLine(panel, "GameFontHighlight", s1Header, 2, -6)
local s1Desc1 = CreateLine(panel, "GameFontHighlightSmall", s1Line1, 0, -2)

local s1Line2 = CreateLine(panel, "GameFontHighlight", s1Desc1, 0, -6)
local s1Desc2 = CreateLine(panel, "GameFontHighlightSmall", s1Line2, 0, -2)

local s1Line3 = CreateLine(panel, "GameFontHighlight", s1Desc2, 0, -6)
local s1Desc3 = CreateLine(panel, "GameFontHighlightSmall", s1Line3, 0, -2)

local s1Line4 = CreateLine(panel, "GameFontHighlight", s1Desc3, 0, -6)
local s1Desc4 = CreateLine(panel, "GameFontHighlightSmall", s1Line4, 0, -2)

-- Section 2: Tooltip Colors
local s2Header = CreateLine(panel, "GameFontNormal", s1Desc4, -2, -16)

local s2Line1 = CreateLine(panel, "GameFontHighlight", s2Header, 2, -6)
local s2Line2 = CreateLine(panel, "GameFontHighlight", s2Line1, 0, -4)
local s2Line3 = CreateLine(panel, "GameFontHighlight", s2Line2, 0, -4)
local s2Line4 = CreateLine(panel, "GameFontHighlight", s2Line3, 0, -4)
local s2Line5 = CreateLine(panel, "GameFontHighlight", s2Line4, 0, -4)
local s2Note  = CreateLine(panel, "GameFontHighlightSmall", s2Line5, 0, -6)

-- Section 3: Track Info
local s3Header = CreateLine(panel, "GameFontNormal", s2Note, -2, -16)

local s3Line1 = CreateLine(panel, "GameFontHighlight", s3Header, 2, -6)
local s3Line2 = CreateLine(panel, "GameFontHighlight", s3Line1, 0, -4)

-- Refresh all legend text using current Addon.Colors (respects colorblind palette)
local function RefreshLegend()
    autoEquipCheck:SetChecked(Addon:GetAutoEquip())
    local CC = Addon.Colors
    local TEX_FMT = "|T" .. Addon.CHEVRON_PATH .. ":0:0:0:0:64:64:0:64:0:64:%d:%d:%d|t"

    -- Build inline chevron textures from current palette
    local function ChevronTex(r01, g01, b01)
        return string_format(TEX_FMT, math.floor(r01 * 255), math.floor(g01 * 255), math.floor(b01 * 255))
    end

    local texGreen = ChevronTex(CC.CHEVRON_GREEN_R, CC.CHEVRON_GREEN_G, CC.CHEVRON_GREEN_B)
    local texBlue  = ChevronTex(CC.CHEVRON_BLUE_R, CC.CHEVRON_BLUE_G, CC.CHEVRON_BLUE_B)
    local texYellow = ChevronTex(CC.CHEVRON_YELLOW_R, CC.CHEVRON_YELLOW_G, CC.CHEVRON_YELLOW_B)
    local texOffSpec = ChevronTex(CC.CHEVRON_OFFSPEC_R, CC.CHEVRON_OFFSPEC_G, CC.CHEVRON_OFFSPEC_B)

    -- Section 1: Overlay Icons
    s1Header:SetText("Bag & Loot Overlays")

    s1Line1:SetText(texGreen .. "  |cff" .. CC.GREEN .. "Score Upgrade|r")
    s1Desc1:SetText("|cff999999Better stats than your currently equipped gear|r")

    s1Line2:SetText(texBlue .. "  |cff" .. CC.BLUE .. "Set Piece|r")
    s1Desc2:SetText("|cff999999Tier set piece needed for set bonus|r")

    s1Line3:SetText(texYellow .. "  |cff" .. CC.YELLOW .. "Track Potential|r")
    s1Desc3:SetText("|cff999999Can upgrade to a higher tier than your equipped item|r")

    s1Line4:SetText(texOffSpec .. "  |cff" .. CC.OFFSPEC .. "Off-Spec Upgrade|r")
    s1Desc4:SetText("|cff999999Upgrade for another specialization|r")

    -- Section 2: Tooltip Colors
    s2Header:SetText("Tooltip Colors")

    s2Line1:SetText("|cff" .. CC.GREEN .. "Green|r  — Upgrade percentage, set ilvl gain, or track upgrade")
    s2Line2:SetText("|cff" .. CC.BLUE .. "Blue|r  — Set piece acquisition (collecting tier bonus pieces)")
    s2Line3:SetText("|cff" .. CC.YELLOW .. "Yellow|r  — Higher upgrade track or catalyst conversion")
    s2Line4:SetText("|cff" .. CC.RED .. "Red|r  — Downgrade, wrong armor type, or set protected")
    s2Line5:SetText("|cff" .. CC.GRAY .. "Gray|r  — Sidegrade or currently equipped")
    s2Note:SetText("|cff999999Muted colors indicate off-spec comparisons|r")

    -- Section 3: Track Info
    s3Header:SetText("Track & Catalyst")

    s3Line1:SetText("|cff" .. CC.YELLOW .. "(caps at [Track])|r  — Item's max upgrade potential is limited to that track")
    s3Line2:SetText("|cff" .. CC.YELLOW .. "(catalyst)|r  — Non-set item on a higher track, convertible to tier via Catalyst")
end

panel:SetScript("OnShow", RefreshLegend)

------------------------------------------------------------
-- Stat Weights Subpage
------------------------------------------------------------
local weightsPanel = CreateFrame("Frame", "HeroScaleWeightsPanel", UIParent)
weightsPanel:Hide()
weightsPanel.name = "Stat Weights"

local weightsCategory = Settings.RegisterCanvasLayoutSubcategory(category, weightsPanel, "Stat Weights")

-- Title
local wTitle = weightsPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
wTitle:SetPoint("TOPLEFT", 16, -16)
wTitle:SetText("Stat Profile")

-- Detected spec/hero talent display
local detectedLabel = weightsPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
detectedLabel:SetPoint("TOPLEFT", wTitle, "BOTTOMLEFT", 0, -12)
detectedLabel:SetText("Detected Spec: |cff888888Unknown|r")

-- Content type label
local ctLabel = weightsPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ctLabel:SetPoint("TOPLEFT", detectedLabel, "BOTTOMLEFT", 0, -20)
ctLabel:SetText("Weight Profile:")

-- Forward declaration (referenced by OnContentTypeSelected before definition)
local RefreshWeightsPanel

-- Display name lookup tables
local PRIMARY_DISPLAY = {
    ["ITEM_MOD_AGILITY_SHORT"] = "Agility",
    ["ITEM_MOD_STRENGTH_SHORT"] = "Strength",
    ["ITEM_MOD_INTELLECT_SHORT"] = "Intellect",
}
local ARMOR_DISPLAY = { [1] = "Cloth", [2] = "Leather", [3] = "Mail", [4] = "Plate" }
local ROLE_DISPLAY = {
    MELEE_DPS = "Melee DPS",
    CASTER_DPS = "Caster DPS",
    TANK = "Tank",
    HEALER = "Healer",
}
local STAT_DISPLAY = { CRIT = "Crit", HASTE = "Haste", MASTERY = "Mastery", VERS = "Vers" }

-- Helpers for content type selection
local function GetActiveSpecID()
    local specIndex = API:GetSpecialization()
    if not specIndex or specIndex == 0 then return nil end
    local specID = API:GetSpecializationInfo(specIndex)
    return specID
end

local function GetCurrentContentType()
    local specID = GetActiveSpecID()
    local ct = HeroScaleCharDB and HeroScaleCharDB.contentTypes
    return ct and specID and ct[specID] or "Leveling"
end

local function GetCurrentContentTypeIndex()
    local current = GetCurrentContentType()
    for i, ct in ipairs(Addon.ContentTypes) do
        if ct == current then return i end
    end
    return 1
end

local function OnContentTypeSelected(selectedType)
    local specID = GetActiveSpecID()
    if not specID then return end

    if HeroScaleCharDB then
        HeroScaleCharDB.contentTypes[specID] = selectedType
    end

    Addon:UpdateActiveData()
    RefreshWeightsPanel()
end

-- Stepper control for content type selection
local stepper = CreateFrame("Frame", "HeroScaleContentTypeStepper", weightsPanel, "Metal2DropdownWithSteppersAndLabelTemplate")
stepper:SetPoint("TOPLEFT", ctLabel, "BOTTOMLEFT", -16, -6)
stepper:SetWidth(250)

-- Set up the dropdown inside the stepper
local stepperDropdown = stepper.Dropdown
stepperDropdown:SetWidth(200)

stepperDropdown:SetupMenu(function(_, rootDescription)
    for _, contentType in ipairs(Addon.ContentTypes) do
        rootDescription:CreateRadio(contentType, function()
            return GetCurrentContentType() == contentType
        end, function()
            OnContentTypeSelected(contentType)
        end)
    end
end)

local function UpdateStepper()
    stepperDropdown:GenerateMenu()
    stepper:UpdateSteppers()
end

------------------------------------------------------------
-- Stat Details (below stepper)
------------------------------------------------------------

-- Section: Base Priority
local basePrioHeader = weightsPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
basePrioHeader:SetPoint("TOPLEFT", stepper, "BOTTOMLEFT", 16, -12)
basePrioHeader:SetJustifyH("LEFT")
basePrioHeader:SetText("Base Priority")

local basePrioLine = weightsPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
basePrioLine:SetPoint("TOPLEFT", basePrioHeader, "BOTTOMLEFT", 2, -6)
basePrioLine:SetJustifyH("LEFT")

-- Section: Your Secondary Stats
local statsHeader = weightsPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
statsHeader:SetPoint("TOPLEFT", basePrioLine, "BOTTOMLEFT", -2, -16)
statsHeader:SetJustifyH("LEFT")
statsHeader:SetText("Your Secondary Stats")

local statLines = {}
local prevStatAnchor = statsHeader
for i = 1, 4 do
    local line = weightsPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    line:SetPoint("TOPLEFT", prevStatAnchor, "BOTTOMLEFT", i == 1 and 2 or 0, i == 1 and -6 or -4)
    line:SetJustifyH("LEFT")
    statLines[i] = line
    prevStatAnchor = line
end

local topTwoNote = weightsPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
topTwoNote:SetPoint("TOPLEFT", statLines[4], "BOTTOMLEFT", 0, -6)
topTwoNote:SetJustifyH("LEFT")

-- Section: Effective Priority
local effPrioHeader = weightsPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
effPrioHeader:SetPoint("TOPLEFT", topTwoNote, "BOTTOMLEFT", -2, -16)
effPrioHeader:SetJustifyH("LEFT")
effPrioHeader:SetText("Effective Priority")

local effPrioLine = weightsPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
effPrioLine:SetPoint("TOPLEFT", effPrioHeader, "BOTTOMLEFT", 2, -6)
effPrioLine:SetJustifyH("LEFT")

local effPrioNote = weightsPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
effPrioNote:SetPoint("TOPLEFT", effPrioLine, "BOTTOMLEFT", 0, -4)
effPrioNote:SetJustifyH("LEFT")

-- Section: Spec Info
local specInfoHeader = weightsPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
specInfoHeader:SetPoint("TOPLEFT", effPrioNote, "BOTTOMLEFT", -2, -16)
specInfoHeader:SetJustifyH("LEFT")
specInfoHeader:SetText("Spec Info")

local specInfoLine1 = weightsPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
specInfoLine1:SetPoint("TOPLEFT", specInfoHeader, "BOTTOMLEFT", 2, -6)
specInfoLine1:SetJustifyH("LEFT")

local specInfoLine2 = weightsPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
specInfoLine2:SetPoint("TOPLEFT", specInfoLine1, "BOTTOMLEFT", 0, -4)
specInfoLine2:SetJustifyH("LEFT")

------------------------------------------------------------
-- Refresh functions
------------------------------------------------------------

local function RefreshStatDetails()
    local weights = Addon.ActiveWeights
    local specData = Addon.ActiveSpecData
    local CC = Addon.Colors

    if not weights or not specData then
        basePrioLine:SetText("|cff888888No data available|r")
        for i = 1, 4 do statLines[i]:SetText("") end
        topTwoNote:SetText("")
        effPrioLine:SetText("")
        effPrioNote:SetText("")
        specInfoLine1:SetText("")
        specInfoLine2:SetText("")
        return
    end

    -- Build stat data for each secondary stat
    local stats = {}
    for _, key in ipairs(Addon.DR:GetSecondaryStats()) do
        local ratingIdx = Addon.DR:GetRatingIndex(key)
        local baseWeight = weights[key] or 0
        local rating = ratingIdx and API:GetCombatRating(ratingIdx) or 0
        local pct = ratingIdx and API:GetCombatRatingBonus(ratingIdx) or 0
        local drMult = (rating > 0) and Addon.DR:GetDRMultiplier(key, 1, weights) or 1.0
        local effWeight = baseWeight * drMult
        local isTopTwo = Addon.DR:IsTopTwoStat(key, weights)
        stats[#stats + 1] = {
            key = key,
            name = STAT_DISPLAY[key] or key,
            baseWeight = baseWeight,
            rating = rating,
            pct = pct,
            drMult = drMult,
            effWeight = effWeight,
            isTopTwo = isTopTwo,
        }
    end

    -- Base priority: sorted by raw weight (tiebreak on key for determinism)
    table.sort(stats, function(a, b)
        if a.baseWeight ~= b.baseWeight then return a.baseWeight > b.baseWeight end
        return a.key < b.key
    end)
    local baseOrder = {}
    local baseParts = {}
    for i, s in ipairs(stats) do
        baseOrder[i] = s.key
        baseParts[#baseParts + 1] = string_format("%s |cff%s(%.2f)|r", s.name, CC.GREEN, s.baseWeight)
    end
    basePrioLine:SetText(table.concat(baseParts, " |cff888888>|r "))

    -- Stat lines: sorted by effective weight
    table.sort(stats, function(a, b)
        if a.effWeight ~= b.effWeight then return a.effWeight > b.effWeight end
        return a.key < b.key
    end)
    local effOrder = {}
    local topTwoNames = {}
    for i, s in ipairs(stats) do
        effOrder[i] = s.key

        local drColor
        if s.drMult >= 1.0 then
            drColor = CC.GREEN
        elseif s.drMult >= 0.8 then
            drColor = CC.YELLOW
        else
            drColor = CC.RED
        end
        local drPct = math.floor(s.drMult * 100 + 0.5)

        local line
        if drPct < 100 then
            line = string_format(
                "%s: |cff%s%.2f|r |cff888888→|r |cff%s%.2f|r |cff888888— %d rating (%.1f%%) —|r DR: |cff%s%d%%|r",
                s.name, CC.GREEN, s.baseWeight, CC.YELLOW, s.effWeight,
                s.rating, s.pct, drColor, drPct)
        else
            line = string_format(
                "%s: |cff%s%.2f|r |cff888888— %d rating (%.1f%%) —|r DR: |cff%s%d%%|r",
                s.name, CC.GREEN, s.baseWeight, s.rating, s.pct, drColor, drPct)
        end
        statLines[i]:SetText(line)

        if s.isTopTwo then
            topTwoNames[#topTwoNames + 1] = s.name
        end
    end

    -- Top-two relaxed bracket note
    if #topTwoNames > 0 then
        topTwoNote:SetText(string_format("|cff999999%s use relaxed DR brackets (top 2 stats)|r",
            table.concat(topTwoNames, " and ")))
    else
        topTwoNote:SetText("")
    end

    -- Effective priority line
    local effParts = {}
    for _, s in ipairs(stats) do
        local color = (s.drMult < 1.0) and CC.YELLOW or CC.GREEN
        effParts[#effParts + 1] = string_format("%s |cff%s(%.2f)|r", s.name, color, s.effWeight)
    end
    effPrioLine:SetText(table.concat(effParts, " |cff888888>|r "))

    -- Check if DR changed the priority order
    local orderChanged = false
    for i = 1, #baseOrder do
        if baseOrder[i] ~= effOrder[i] then
            orderChanged = true
            break
        end
    end

    local drNotes = {}
    for _, s in ipairs(stats) do
        if s.drMult < 1.0 then
            drNotes[#drNotes + 1] = string_format("%s DR at %.1f%%", s.name, s.pct)
        end
    end

    if orderChanged and #drNotes > 0 then
        effPrioNote:SetText("|cff" .. CC.YELLOW .. table.concat(drNotes, ", ") .. " reducing effective value|r")
    elseif #drNotes > 0 then
        effPrioNote:SetText("|cff999999DR active but priority order unchanged|r")
    else
        effPrioNote:SetText("|cff999999No significant diminishing returns|r")
    end

    -- Spec info
    local primaryName = PRIMARY_DISPLAY[specData.primary] or "Unknown"
    local roleName = ROLE_DISPLAY[specData.role] or specData.role or "Unknown"
    local armorName = ARMOR_DISPLAY[specData.armorType] or "Unknown"
    specInfoLine1:SetText(string_format(
        "Primary: |cff00ff00%s|r  |  Role: |cff00ff00%s|r  |  Armor: |cff00ff00%s|r",
        primaryName, roleName, armorName))

    local setPieces = Addon.ScoringEngine and Addon.ScoringEngine.CountEquippedSetPieces
        and Addon.ScoringEngine:CountEquippedSetPieces() or 0
    local wdps = weights.WEAPON_DPS or 0
    specInfoLine2:SetText(string_format(
        "Set Pieces: |cff00ff00%d/4|r  |  Weapon DPS Weight: |cff00ff00%.1f|r",
        setPieces, wdps))
end

-- Refresh the panel state when shown
RefreshWeightsPanel = function()
    -- Update detected spec/hero talent
    local specName = Addon.ActiveSpecName or "Unknown"
    detectedLabel:SetText("Detected Spec: |cff00ff00" .. specName .. "|r")

    -- Refresh stepper to reflect current selection
    UpdateStepper()

    -- Refresh stat details, DR info, and spec metadata
    RefreshStatDetails()
end

weightsPanel:SetScript("OnShow", RefreshWeightsPanel)
