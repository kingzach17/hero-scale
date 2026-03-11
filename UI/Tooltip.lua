local _, Addon = ...
local API = Addon.API

local ipairs = ipairs
local math_abs = math.abs
local string_format = string.format

-- Returns a suffix describing the set bonus modifier baked into the percentage
local function GetSetBonusSuffix(entry)
    if not entry.setTransition then return "" end
    if entry.setTransition.gaining4pc then return " (incl. 4pc bonus)" end
    if entry.setTransition.gaining2pc then return " (incl. 2pc bonus)" end
    if entry.setTransition.losing4pc then return " (losing 4pc bonus)" end
    if entry.setTransition.losing2pc then return " (losing 2pc bonus)" end
    return ""
end

-- Returns a suffix describing track limitations
local function GetTrackWarningSuffix(entry)
    if not entry.trackWarning then return "" end
    if entry.candidateTrackName then
        return " (caps at " .. entry.candidateTrackName .. ")"
    end
    return " (lower track)"
end

-- Returns a suffix for low-confidence comparisons
local function GetConfidenceSuffix(entry)
    if entry.confidence == "LOW" then return " (sim to verify)" end
    return ""
end

-- Formats a single evaluation entry into a colored tooltip string
-- muted=true uses off-spec color variants
function Addon:FormatTooltipEntry(entry, classHex, CC, muted)
    local green, red, gray, blue, yellow, texGreen, texBlue, texYellow
    if muted then
        green, red, gray, blue, yellow = CC.GREEN_MUTED, CC.RED_MUTED, CC.GRAY_MUTED, CC.BLUE_MUTED, CC.YELLOW_MUTED
        texGreen, texBlue, texYellow = CC.TEX_GREEN_MUTED, CC.TEX_BLUE_MUTED, CC.TEX_YELLOW_MUTED
    else
        green, red, gray, blue, yellow = CC.GREEN, CC.RED, CC.GRAY, CC.BLUE, CC.YELLOW
        texGreen, texBlue, texYellow = CC.TEX_GREEN, CC.TEX_BLUE, CC.TEX_YELLOW
    end

    local prefix = entry.prefix
    local t = entry.type

    if t == "CANNOT_EQUIP_WEAPON" then
        return string_format("|cff%sCannot Equip This Weapon|r", red)
    elseif t == "WRONG_ARMOR" then
        return string_format("|cff%sWrong Armor Type|r", red)
    elseif t == "CURRENTLY_EQUIPPED" then
        return string_format("|cff%s%s:|r |cff%sCurrently Equipped|r", classHex, prefix, gray)
    elseif t == "EMPTY_SLOT" then
        return string_format("|cff%s%s:|r %s |cff%sEmpty Slot|r", classHex, prefix, texGreen, green)
    elseif t == "BIG_UPGRADE" then
        local trackSuffix = GetTrackWarningSuffix(entry)
        local setSuffix = GetSetBonusSuffix(entry)
        if entry.pct then
            return string_format("|cff%s%s:|r %s |cff%s+%.1f%% upgrade%s%s|r", classHex, prefix, texGreen, green, entry.pct, trackSuffix, setSuffix)
        else
            return string_format("|cff%s%s:|r %s |cff%sUpgrade%s%s|r", classHex, prefix, texGreen, green, trackSuffix, setSuffix)
        end
    elseif t == "UPGRADE" then
        local trackSuffix = GetTrackWarningSuffix(entry)
        local setSuffix = GetSetBonusSuffix(entry)
        local confSuffix = GetConfidenceSuffix(entry)
        return string_format("|cff%s%s:|r %s |cff%s+%.1f%% upgrade%s%s%s|r", classHex, prefix, texGreen, green, entry.pct, trackSuffix, setSuffix, confSuffix)
    elseif t == "DOWNGRADE" then
        local setSuffix = GetSetBonusSuffix(entry)
        local confSuffix = GetConfidenceSuffix(entry)
        return string_format("|cff%s%s:|r |cff%s-%.1f%% downgrade%s%s|r", classHex, prefix, red, math_abs(entry.pct), setSuffix, confSuffix)
    elseif t == "SIDEGRADE" then
        local trackSuffix = GetTrackWarningSuffix(entry)
        local confSuffix = GetConfidenceSuffix(entry)
        return string_format("|cff%s%s:|r |cff%sSidegrade%s%s|r", classHex, prefix, gray, trackSuffix, confSuffix)
    elseif t == "HIGHER_TRACK" then
        return string_format("|cff%s%s:|r %s |cff%s%s Track (upgradeable)|r", classHex, prefix, texYellow, yellow, entry.trackName)
    elseif t == "SET_ILVL_UP" then
        return string_format("|cff%s%s:|r %s |cff%sSet +%d ilvl|r", classHex, prefix, texGreen, green, entry.ilvlDiff)
    elseif t == "SET_ILVL_DOWN" then
        return string_format("|cff%s%s:|r |cff%sSet %d ilvl|r", classHex, prefix, red, entry.ilvlDiff)
    elseif t == "SET_SIDEGRADE" then
        return string_format("|cff%s%s:|r |cff%sSet Sidegrade|r", classHex, prefix, gray)
    elseif t == "SET_NEED_PIECES" then
        return string_format("|cff%s%s:|r %s |cff%sSet Upgrade (%s)|r", classHex, prefix, texBlue, blue, entry.detail)
    elseif t == "SET_TRACK_UP" then
        return string_format("|cff%s%s:|r %s |cff%s%s Track (upgradeable)|r", classHex, prefix, texGreen, green, entry.trackName)
    elseif t == "CATALYST_TRACK" then
        local catalystSuffix = ""
        if entry.catalyst then
            if entry.catalyst.charges and entry.catalyst.charges.current and entry.catalyst.charges.current > 0 then
                catalystSuffix = string_format(" - %d charge%s", entry.catalyst.charges.current, entry.catalyst.charges.current == 1 and "" or "s")
            else
                catalystSuffix = " - no charges"
            end
        end
        return string_format("|cff%s%s:|r %s |cff%s%s Track (catalyst)%s|r", classHex, prefix, texYellow, yellow, entry.trackName, catalystSuffix)
    elseif t == "SET_PROTECTED" then
        return string_format("|cff%s%s:|r |cff%s-%.1f%% downgrade (keeping set bonus)|r", classHex, prefix, red, math_abs(entry.pct))
    elseif t == "TIER_UPGRADE" then
        local confSuffix = GetConfidenceSuffix(entry)
        return string_format("|cff%s%s:|r %s |cff%s%s-Tier (from %s)%s|r", classHex, prefix, texGreen, green, entry.newTier, entry.equippedTier, confSuffix)
    elseif t == "TIER_DOWNGRADE" then
        local confSuffix = GetConfidenceSuffix(entry)
        return string_format("|cff%s%s:|r |cff%s%s-Tier (from %s)%s|r", classHex, prefix, red, entry.newTier, entry.equippedTier, confSuffix)
    elseif t == "TIER_SIDEGRADE" then
        local confSuffix = GetConfidenceSuffix(entry)
        return string_format("|cff%s%s:|r |cff%s%s-Tier Sidegrade%s|r", classHex, prefix, gray, entry.newTier, confSuffix)
    end

    return ""
end

TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, function(tooltip, data)
    -- Skip tooltips for items on the character equipment panel
    local owner = tooltip:GetOwner()
    if owner then
        local ownerName = owner:GetName()
        if ownerName and ownerName:match("^Character.+Slot$") then
            return
        end
    end

    local itemLink = data.hyperlink
    if not itemLink and data.guid then itemLink = API:GetItemLinkByGUID(data.guid) end
    if not itemLink or not Addon.EvaluateItemForTooltip then return end

    local result = Addon:EvaluateItemForTooltip(itemLink)
    if not result then return end

    local _, classTag = API:UnitClass("player")
    local classColor = RAID_CLASS_COLORS[classTag]
    local classHex = classColor and classColor.colorStr and classColor.colorStr:sub(3) or "ffffff"

    local CC = Addon.Colors

    tooltip:AddLine(" ")
    tooltip:AddLine("|cffffd100Hero Scale|r")

    for _, entry in ipairs(result.activeEntries) do
        tooltip:AddLine(Addon:FormatTooltipEntry(entry, classHex, CC, false))
    end

    for _, entry in ipairs(result.offSpecEntries) do
        tooltip:AddLine(Addon:FormatTooltipEntry(entry, classHex, CC, true))
    end
end)
