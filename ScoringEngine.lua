local _, Addon = ...
local API = Addon.API
Addon.ScoringEngine = {}

local pairs = pairs
local ipairs = ipairs
local select = select
local wipe = wipe
local math_max = math.max
local math_min = math.min
local math_huge = math.huge
local string_format = string.format
local table_insert = table.insert

-- ============================================================
-- Item Info Cache (reduces redundant GetItemInfoInstant API calls)
-- ============================================================

local equipSlotCache = {} -- itemLink -> {equipSlot, classID, subclassID}

local function GetEquipSlotInfo(itemLink)
    if not itemLink then return nil, nil, nil end
    local cached = equipSlotCache[itemLink]
    if cached then return cached[1], cached[2], cached[3] end
    local _, _, _, equipSlot, _, classID, subclassID = API:GetItemInfoInstant(itemLink)
    if equipSlot then
        equipSlotCache[itemLink] = { equipSlot, classID, subclassID }
    end
    return equipSlot, classID, subclassID
end

-- ============================================================
-- Stat Mapping Tables
-- ============================================================

local StatLookup = {
    ["ITEM_MOD_CRIT_RATING_SHORT"] = "CRIT",
    ["ITEM_MOD_HASTE_RATING_SHORT"] = "HASTE",
    ["ITEM_MOD_MASTERY_RATING_SHORT"] = "MASTERY",
    ["ITEM_MOD_VERSATILITY"] = "VERS",
    ["ITEM_MOD_STAMINA_SHORT"] = "STAMINA",
    ["ITEM_MOD_CR_LIFESTEAL_SHORT"] = "LEECH",
    ["ITEM_MOD_CR_SPEED_SHORT"] = "SPEED",
    ["ITEM_MOD_CR_AVOIDANCE_SHORT"] = "AVOIDANCE",
}

-- All primary stat keys — used by GetMultiplicativeScore() for off-spec comparisons
-- where the displayed primary stat may differ from the target spec's primary
-- (e.g., item shows Agility on Havoc but Devourer expects Intellect).
local PRIMARY_STATS = {
    ["ITEM_MOD_AGILITY_SHORT"] = true,
    ["ITEM_MOD_INTELLECT_SHORT"] = true,
    ["ITEM_MOD_STRENGTH_SHORT"] = true,
}

-- Stats that should not have diminishing returns applied
local NoDRStats = {
    STAMINA = true,
    LEECH = true,
    SPEED = true,
    AVOIDANCE = true,
}

-- ============================================================
-- Slot and Weapon Tables
-- ============================================================

-- Two-handed equip slots that displace the off-hand
local TWO_HAND_SLOTS = {
    INVTYPE_2HWEAPON = true,
    INVTYPE_RANGED = true,
    INVTYPE_RANGEDRIGHT = true,
}

-- Off-hand equip slots that require canUseOffhand in spec data
-- canUseOffhand values: "SHIELD" (shields only), "HOLDABLE" (frills only), true (both)
local OFF_HAND_SLOTS = {
    INVTYPE_HOLDABLE = "HOLDABLE",
    INVTYPE_SHIELD = "SHIELD",
}

-- Slot category classification for routing to category-specific comparison functions
local SLOT_TO_CATEGORY = {
    INVTYPE_HEAD = "ARMOR", INVTYPE_SHOULDER = "ARMOR", INVTYPE_CHEST = "ARMOR",
    INVTYPE_ROBE = "ARMOR", INVTYPE_WAIST = "ARMOR", INVTYPE_LEGS = "ARMOR",
    INVTYPE_FEET = "ARMOR", INVTYPE_WRIST = "ARMOR", INVTYPE_HAND = "ARMOR",
    INVTYPE_CLOAK = "ARMOR",
    INVTYPE_NECK = "JEWELRY", INVTYPE_FINGER = "JEWELRY",
    INVTYPE_WEAPON = "WEAPON", INVTYPE_2HWEAPON = "WEAPON",
    INVTYPE_WEAPONMAINHAND = "WEAPON", INVTYPE_WEAPONOFFHAND = "WEAPON",
    INVTYPE_HOLDABLE = "WEAPON", INVTYPE_SHIELD = "WEAPON",
    INVTYPE_RANGED = "WEAPON", INVTYPE_RANGEDRIGHT = "WEAPON",
    INVTYPE_TRINKET = "TRINKET",
}

-- Static slot mapping: equip slot string -> list of {slotName, inventorySlotID}
local SLOT_MAP = {
    INVTYPE_FINGER          = { {"Finger 1", 11}, {"Finger 2", 12} },
    INVTYPE_TRINKET         = { {"Trinket 1", 13}, {"Trinket 2", 14} },
    INVTYPE_WEAPON          = { {"Main Hand", 16}, {"Off Hand", 17} },
    INVTYPE_2HWEAPON        = { {"", 16} },
    INVTYPE_WEAPONMAINHAND  = { {"", 16} },
    INVTYPE_WEAPONOFFHAND   = { {"", 17} },
    INVTYPE_HOLDABLE        = { {"", 17} },
    INVTYPE_SHIELD          = { {"", 17} },
    INVTYPE_HEAD            = { {"", 1} },
    INVTYPE_NECK            = { {"", 2} },
    INVTYPE_SHOULDER        = { {"", 3} },
    INVTYPE_BODY            = { {"", 4} },
    INVTYPE_CHEST           = { {"", 5} },
    INVTYPE_ROBE            = { {"", 5} },
    INVTYPE_WAIST           = { {"", 6} },
    INVTYPE_LEGS            = { {"", 7} },
    INVTYPE_FEET            = { {"", 8} },
    INVTYPE_WRIST           = { {"", 9} },
    INVTYPE_HAND            = { {"", 10} },
    INVTYPE_CLOAK           = { {"", 15} },
    INVTYPE_RANGED          = { {"", 16} },
    INVTYPE_RANGEDRIGHT     = { {"", 16} },
}

-- ============================================================
-- Gear Track System (from GearTrack.lua)
-- ============================================================

-- Track hierarchy: higher tier = better upgrade potential
local TRACK_TIERS = {
    ["Adventurer"] = 1,
    ["Veteran"]    = 2,
    ["Champion"]   = 3,
    ["Hero"]       = 4,
    ["Myth"]       = 5,
}

-- Pre-compiled patterns for track name detection (avoids per-line string concatenation)
local TRACK_PATTERNS = {}
for trackName in pairs(TRACK_TIERS) do
    TRACK_PATTERNS[#TRACK_PATTERNS + 1] = { pattern = trackName .. " %d+/%d+", name = trackName }
end

-- Max item level per track (Midnight Season 3, post-squish -- update each season)
local TRACK_MAX_ILVL = {
    ["Adventurer"] = 237,
    ["Veteran"]    = 250,
    ["Champion"]   = 263,
    ["Hero"]       = 276,
    ["Myth"]       = 289,
}

-- Cache: itemLink -> trackInfo or false (nil = not yet queried)
local trackCache = {}

-- ============================================================
-- Set Items System (from SetItems.lua)
-- ============================================================

-- Tier set-eligible inventory slot IDs: Helm, Shoulders, Chest, Gloves, Legs
local TIER_SLOTS = { [1] = true, [3] = true, [5] = true, [10] = true, [7] = true }

-- Result type constants
Addon.ScoringEngine.NORMAL          = "NORMAL"
Addon.ScoringEngine.SET_ILVL_UP     = "SET_ILVL_UP"
Addon.ScoringEngine.SET_ILVL_DOWN   = "SET_ILVL_DOWN"
Addon.ScoringEngine.SET_SIDEGRADE   = "SET_SIDEGRADE"
Addon.ScoringEngine.SET_NEED_PIECES = "SET_NEED_PIECES"
Addon.ScoringEngine.SET_TRACK_UP    = "SET_TRACK_UP"
Addon.ScoringEngine.CATALYST_TRACK  = "CATALYST_TRACK"
Addon.ScoringEngine.SET_PROTECTED   = "SET_PROTECTED"

-- ============================================================
-- Utility Functions
-- ============================================================

local function GetSlotCategory(itemLink)
    if not itemLink then return nil end
    local equipSlot = GetEquipSlotInfo(itemLink)
    return equipSlot and SLOT_TO_CATEGORY[equipSlot] or nil
end

function Addon.ScoringEngine:GetSlotCategory(itemLink)
    return GetSlotCategory(itemLink)
end

-- Returns true if the item link is a two-handed weapon that occupies both weapon slots
function Addon.ScoringEngine:IsTwoHandEquip(itemLink)
    if not itemLink then return false end
    local equipSlot = GetEquipSlotInfo(itemLink)
    return TWO_HAND_SLOTS[equipSlot] or false
end

local function IsTwoHandEquip(itemLink)
    return Addon.ScoringEngine:IsTwoHandEquip(itemLink)
end

-- Filters a SLOT_MAP mapping for 1H weapons: returns main-hand only when the
-- spec uses off-hand items or when a 2H weapon is currently equipped.
local function FilterWeaponMapping(mapping, snapshot, specData)
    if #mapping <= 1 then return mapping end
    local sd = specData or Addon.ActiveSpecData
    if sd and sd.canUseOffhand then
        return { mapping[1] }
    end
    local mhLink = snapshot and snapshot[16] or API:GetInventoryItemLink("player", 16)
    if mhLink and IsTwoHandEquip(mhLink) then
        return { mapping[1] }
    end
    return mapping
end

-- Infer weapon DPS role multiplier from spec weights.
-- Melee DPS: 1.15x (weapon DPS is critical), Caster: 0.85x (stats dominate), Tank/other: 1.0x
-- When called without args, uses active spec data.
local function GetWeaponRoleMultiplier(specData, weights)
    weights = weights or Addon.ActiveWeights
    specData = specData or Addon.ActiveSpecData
    if not weights then return 1.0 end
    if specData and specData.primary == "ITEM_MOD_INTELLECT_SHORT" then
        return 0.85
    end
    if (weights["STAMINA"] or 0) >= 0.5 then
        return 1.0
    end
    if (weights["WEAPON_DPS"] or 0) >= 5.5 then
        return 1.15
    end
    return 1.0
end

-- Strips enchant and gem data from an item link so equipped items
-- are scored on base stats only, matching how unenchanted drops appear.
local function StripEnchantAndGems(itemLink)
    if not itemLink then return itemLink end
    local cached = Addon.StrippedLinkCache[itemLink]
    if cached then return cached end
    local stripped = itemLink:gsub("(|Hitem:%d+):(%d*):(%d*):(%d*):(%d*):(%d*)", "%1:0:0:0:0:0")
    Addon.StrippedLinkCache[itemLink] = stripped
    return stripped
end

-- Public wrapper for StripEnchantAndGems
function Addon.ScoringEngine:StripLink(itemLink)
    return StripEnchantAndGems(itemLink)
end

-- Computes the weapon DPS score adjustment for a role multiplier.
local function GetWeaponDpsAdjustment(itemLink, weights, roleMult)
    if not itemLink or roleMult == 1.0 then return 0 end
    local strippedLink = StripEnchantAndGems(itemLink)
    if not strippedLink then return 0 end
    local stats = API:GetItemStats(strippedLink)
    if not stats then return 0 end
    local weaponDPS = stats["ITEM_MOD_DAMAGE_PER_SECOND_SHORT"]
    if not weaponDPS or weaponDPS <= 0 then return 0 end
    local dpsWeight = weights and weights["WEAPON_DPS"] or 0
    return weaponDPS * dpsWeight * (roleMult - 1.0)
end

-- ============================================================
-- Gear Track Functions
-- ============================================================

function Addon.ScoringEngine:InvalidateTrackCache()
    wipe(trackCache)
end

function Addon.ScoringEngine:GetTrackInfo(itemLink)
    if not itemLink then return nil end

    local cached = trackCache[itemLink]
    if cached ~= nil then
        return cached or nil
    end

    local info = self:QueryTrackInfo(itemLink)
    trackCache[itemLink] = info or false
    return info
end

function Addon.ScoringEngine:QueryTrackInfo(itemLink)
    local currentLevel, maxLevel = API:GetItemUpgradeCurrentLevel(itemLink)
    if currentLevel and maxLevel and maxLevel > 0 then
        local trackName = self:GetTrackName(itemLink)
        if trackName and TRACK_TIERS[trackName] then
            local currentIlvl = self:GetEffectiveItemLevel(itemLink)
            return {
                name = trackName,
                tier = TRACK_TIERS[trackName],
                currentIlvl = currentIlvl,
                maxIlvl = TRACK_MAX_ILVL[trackName] or currentIlvl,
                currentLevel = currentLevel,
                maxLevel = maxLevel,
            }
        end
    end

    return nil
end

function Addon.ScoringEngine:GetTrackName(itemLink)
    if not itemLink then return nil end

    local tooltipData = API:GetTooltipHyperlink(itemLink)
    if not tooltipData or not tooltipData.lines then return nil end

    for _, line in ipairs(tooltipData.lines) do
        local text = line.leftText
        if text then
            for _, tp in ipairs(TRACK_PATTERNS) do
                if text:find(tp.pattern) then
                    return tp.name
                end
            end
        end
    end

    return nil
end

function Addon.ScoringEngine:GetEffectiveItemLevel(itemLink)
    if not itemLink then return 0 end
    local effectiveIlvl = API:GetDetailedItemLevelInfo(itemLink)
    return effectiveIlvl or 0
end

function Addon.ScoringEngine:IsHigherTrack(candidateLink, equippedLink)
    local candidateTrack = self:GetTrackInfo(candidateLink)
    if not candidateTrack then return false, nil end

    local equippedTrack = self:GetTrackInfo(equippedLink)
    if not equippedTrack then return false, nil end

    if candidateTrack.tier > equippedTrack.tier then
        return true, candidateTrack
    end

    return false, nil
end

function Addon.ScoringEngine:EstimateMaxScore(currentScore, trackInfo)
    if not trackInfo or not trackInfo.currentIlvl or trackInfo.currentIlvl <= 0 then
        return currentScore
    end
    if not trackInfo.maxIlvl or trackInfo.maxIlvl <= trackInfo.currentIlvl then
        return currentScore
    end

    return currentScore * (trackInfo.maxIlvl / trackInfo.currentIlvl)
end

-- Returns a tier-gap category: 0 (same or higher), 1 (one tier lower), 2 (two+ tiers lower).
-- Compares track tiers directly when available, falling back to ilvl difference.
local function GetTrackGap(self, candidateLink, equippedLink)
    local candidateTrack = self:GetTrackInfo(candidateLink)
    local equippedTrack = self:GetTrackInfo(equippedLink)

    if candidateTrack and equippedTrack then
        local tierDiff = equippedTrack.tier - candidateTrack.tier
        if tierDiff >= 2 then return 2 end
        if tierDiff == 1 then return 1 end
        return 0
    end

    -- Fallback: use ilvl difference if track detection fails for either item
    -- Each track tier is roughly 13 ilvl apart
    local candidateIlvl = self:GetEffectiveItemLevel(candidateLink)
    local equippedIlvl = self:GetEffectiveItemLevel(equippedLink)

    if candidateIlvl > 0 and equippedIlvl > 0 then
        local ilvlDiff = equippedIlvl - candidateIlvl
        if ilvlDiff >= 26 then return 2 end
        if ilvlDiff >= 13 then return 1 end
    end

    return 0
end

local TRACK_GAP_PENALTY  = { [0] = 0, [1] = 2, [2] = 5 }
local TRACK_GAP_WARNING  = { [1] = "LIMITED", [2] = "DEAD_END" }

-- Returns percentage penalty for lower-track items (0, 2, or 5)
function Addon.ScoringEngine:GetTrackPenalty(candidateLink, equippedLink)
    return TRACK_GAP_PENALTY[GetTrackGap(self, candidateLink, equippedLink)]
end

-- Returns warning type for lower-track items: "LIMITED", "DEAD_END", or nil
function Addon.ScoringEngine:GetTrackWarning(candidateLink, equippedLink)
    return TRACK_GAP_WARNING[GetTrackGap(self, candidateLink, equippedLink)]
end

-- ============================================================
-- Catalyst System
-- ============================================================

-- Catalyst currency ID (The War Within / Midnight)
local CATALYST_CURRENCY_ID = 2167

-- Cache for catalyst charges
local catalystChargeCache = nil
local catalystCacheTime = 0
local CATALYST_CACHE_DURATION = 5  -- seconds

-- Catalyst-eligible equip slots (tier slots)
local CATALYST_ELIGIBLE_SLOTS = {
    INVTYPE_HEAD = true,
    INVTYPE_SHOULDER = true,
    INVTYPE_CHEST = true,
    INVTYPE_ROBE = true,
    INVTYPE_HAND = true,
    INVTYPE_LEGS = true,
}

-- Catalyst priority levels
Addon.ScoringEngine.CATALYST_PRIORITY = {
    IMMEDIATE = 1,     -- Myth track item
    HIGH = 2,          -- Hero track + gains 4pc
    MEDIUM = 3,        -- Hero track + gains 2pc, or Hero with 2+ charges
    LOW = 4,           -- Champion track, or scarce charges
    DO_NOT_USE = 5,    -- Veteran or below track
    UNAVAILABLE = 6,   -- No charges available
}

function Addon.ScoringEngine:GetCatalystCharges()
    local now = API:GetTime()
    if catalystChargeCache and (now - catalystCacheTime) < CATALYST_CACHE_DURATION then
        return catalystChargeCache
    end

    local info = API:GetCurrencyInfo(CATALYST_CURRENCY_ID)
    if info then
        catalystChargeCache = {
            current = info.quantity or 0,
            max = info.maxQuantity or 6,
        }
        catalystCacheTime = now
        return catalystChargeCache
    end

    -- Fallback if API unavailable
    return { current = 0, max = 6 }
end

function Addon.ScoringEngine:InvalidateCatalystCache()
    catalystChargeCache = nil
    catalystCacheTime = 0
end

function Addon.ScoringEngine:IsCatalystEligible(itemLink)
    if not itemLink then return false end

    -- Check slot is a tier slot
    local equipSlot = GetEquipSlotInfo(itemLink)
    if not CATALYST_ELIGIBLE_SLOTS[equipSlot] then return false end

    -- Check if NOT already a set piece (can't catalyst an existing set item)
    if self:IsSetItem(itemLink) then return false end

    return true
end

function Addon.ScoringEngine:GetCatalystPriority(candidateLink, setTransition, charges)
    local P = self.CATALYST_PRIORITY

    if not charges or charges.current == 0 then
        return P.UNAVAILABLE, "No catalyst charges available"
    end

    local trackInfo = self:GetTrackInfo(candidateLink)
    if not trackInfo then
        return P.LOW, "Unknown track"
    end

    local trackTier = trackInfo.tier
    local wouldGain4pc = setTransition and setTransition.gaining4pc
    local wouldGain2pc = setTransition and setTransition.gaining2pc

    -- Myth track (tier 5)
    if trackTier >= 5 then
        return P.IMMEDIATE, "Myth track - use catalyst"
    end

    -- Hero track (tier 4)
    if trackTier == 4 then
        if wouldGain4pc then
            return P.HIGH, "Hero track + gains 4pc"
        elseif wouldGain2pc then
            return P.MEDIUM, "Hero track + gains 2pc"
        elseif charges.current >= 2 then
            return P.MEDIUM, "Hero track item"
        else
            return P.LOW, "Save charge for better item"
        end
    end

    -- Champion track (tier 3)
    if trackTier == 3 then
        if wouldGain4pc and charges.current >= 3 then
            return P.MEDIUM, "Champion track + gains 4pc"
        else
            return P.LOW, "Save charge for higher track"
        end
    end

    -- Veteran (tier 2) or Adventurer (tier 1) or below
    return P.DO_NOT_USE, "Do not catalyst low track item"
end

-- ============================================================
-- Set Items Functions
-- ============================================================

function Addon.ScoringEngine:IsSetItem(itemLink)
    if not itemLink then return false end
    local setID = select(16, API:GetItemInfo(itemLink))
    return setID and setID > 0
end

function Addon.ScoringEngine:IsTierSlot(slotID)
    return TIER_SLOTS[slotID] == true
end

function Addon.ScoringEngine:CountEquippedSetPieces()
    local count = 0
    for slotID in pairs(TIER_SLOTS) do
        local link = API:GetInventoryItemLink("player", slotID)
        if link and self:IsSetItem(link) then
            count = count + 1
        end
    end
    return count
end

function Addon.ScoringEngine:CountSnapshotSetPieces(snapshot)
    if not snapshot then return 0 end
    local count = 0
    for slotID in pairs(TIER_SLOTS) do
        local link = snapshot[slotID]
        if link and self:IsSetItem(link) then
            count = count + 1
        end
    end
    return count
end

-- NEW: Get set bonus score value based on piece count
function Addon.ScoringEngine:GetSetBonusValue(specData, pieceCount)
    if not specData or not specData.setBonusValues then
        return 0
    end
    local values = specData.setBonusValues
    if pieceCount >= 4 then
        return (values.twoPiece or 0) + (values.fourPiece or 0)
    elseif pieceCount >= 2 then
        return values.twoPiece or 0
    end
    return 0
end

-- NEW: Calculate set bonus transition impact
function Addon.ScoringEngine:EvaluateSetBonusTransition(currentPieces, newPieces, specData)
    local currentBonus = self:GetSetBonusValue(specData, currentPieces)
    local newBonus = self:GetSetBonusValue(specData, newPieces)
    return {
        bonusDiff = newBonus - currentBonus,
        gaining2pc = (currentPieces < 2 and newPieces >= 2),
        gaining4pc = (currentPieces < 4 and newPieces >= 4),
        losing2pc = (currentPieces >= 2 and newPieces < 2),
        losing4pc = (currentPieces >= 4 and newPieces < 4),
    }
end

-- Central decision function for set piece comparisons.
function Addon.ScoringEngine:EvaluateSetComparison(candidateLink, equippedLink, slotID, snapshot)
    local S = self

    if not slotID or not self:IsTierSlot(slotID) then
        return { type = S.NORMAL }
    end

    -- Skip all set piece logic during Leveling — raw stats matter more than set bonuses
    if Addon.ActiveContentType == "Leveling" then
        return { type = S.NORMAL }
    end

    local newIsSet = self:IsSetItem(candidateLink)
    local equippedIsSet = equippedLink and self:IsSetItem(equippedLink) or false

    if not newIsSet and not equippedIsSet then
        return { type = S.NORMAL }
    end

    local setPieceCount = snapshot
        and self:CountSnapshotSetPieces(snapshot)
        or self:CountEquippedSetPieces()

    -- Calculate piece count after swap for set transition scoring
    local newPieceCount = setPieceCount
    if newIsSet and not equippedIsSet then
        newPieceCount = setPieceCount + 1
    elseif equippedIsSet and not newIsSet then
        newPieceCount = setPieceCount - 1
    end
    -- If both are set pieces, count stays the same (replacing set with set)

    -- Calculate set transition (for scoring modifiers)
    local setTransition = self:EvaluateSetBonusTransition(setPieceCount, newPieceCount, Addon.ActiveSpecData)

    local ilvlDiff = 0
    if candidateLink and equippedLink then
        local newIlvl = self:GetEffectiveItemLevel(candidateLink)
        local equippedIlvl = self:GetEffectiveItemLevel(equippedLink)
        ilvlDiff = newIlvl - equippedIlvl
    end

    local isHigherTrack, trackInfo = false, nil
    if equippedLink then
        isHigherTrack, trackInfo = self:IsHigherTrack(candidateLink, equippedLink)
    end

    -- Case: equipped IS a set piece
    if equippedIsSet then
        if newIsSet then
            local reasons = {}

            if setPieceCount < 4 then
                table_insert(reasons, string_format("%d/4 set", setPieceCount))
            end
            if isHigherTrack and trackInfo then
                table_insert(reasons, trackInfo.name .. " Track")
            end

            if #reasons > 0 then
                return {
                    type = S.SET_NEED_PIECES,
                    setPieceCount = setPieceCount,
                    trackInfo = trackInfo,
                    reasons = reasons,
                    setTransition = setTransition,
                }
            end

            if ilvlDiff > 0 then
                return { type = S.SET_ILVL_UP, ilvlDiff = ilvlDiff, setTransition = setTransition }
            elseif ilvlDiff < 0 then
                return { type = S.SET_ILVL_DOWN, ilvlDiff = ilvlDiff, setTransition = setTransition }
            else
                return { type = S.SET_SIDEGRADE, setTransition = setTransition }
            end
        else
            -- Equipped is set, candidate is NOT set (losing a set piece)
            if isHigherTrack and trackInfo then
                -- Enhanced catalyst analysis
                local isCatalystEligible = self:IsCatalystEligible(candidateLink)
                local catalyst = nil

                if isCatalystEligible then
                    local charges = self:GetCatalystCharges()
                    -- For catalyst, we need to consider what happens if we catalyst the new item
                    -- If catalyzed, piece count stays the same (replacing set with catalyzed set)
                    local catalyzedTransition = self:EvaluateSetBonusTransition(setPieceCount, setPieceCount, Addon.ActiveSpecData)
                    local priority, reason = self:GetCatalystPriority(candidateLink, catalyzedTransition, charges)

                    catalyst = {
                        eligible = true,
                        charges = charges,
                        priority = priority,
                        reason = reason,
                    }
                else
                    catalyst = {
                        eligible = false,
                        charges = self:GetCatalystCharges(),
                        priority = self.CATALYST_PRIORITY.UNAVAILABLE,
                        reason = "Item not catalyst eligible",
                    }
                end

                return {
                    type = S.CATALYST_TRACK,
                    trackInfo = trackInfo,
                    setTransition = setTransition,
                    catalyst = catalyst,
                }
            end
            return { type = S.SET_PROTECTED, setTransition = setTransition }
        end
    end

    -- Case: equipped is NOT a set piece, candidate IS a set piece (gaining a set piece)
    if newIsSet then
        local reasons = {}

        if setPieceCount < 4 then
            table_insert(reasons, string_format("%d/4 set", setPieceCount))
        end
        if isHigherTrack and trackInfo then
            table_insert(reasons, trackInfo.name .. " Track")
        end

        if #reasons > 0 then
            return {
                type = S.SET_NEED_PIECES,
                setPieceCount = setPieceCount,
                trackInfo = trackInfo,
                reasons = reasons,
                setTransition = setTransition,
            }
        end

        return { type = S.NORMAL, setTransition = setTransition }
    end

    return { type = S.NORMAL }
end

-- ============================================================
-- Validation Functions
-- ============================================================

function Addon.ScoringEngine:ValidateEquippable(itemLink, specData)
    specData = specData or Addon.ActiveSpecData
    local equipSlot, classID, subclassID = GetEquipSlotInfo(itemLink)

    -- Reject items without a recognized equipment slot (non-gear: tokens, consumables, etc.)
    if not equipSlot or not SLOT_TO_CATEGORY[equipSlot] then
        return false, "NOT_EQUIPPABLE"
    end

    local offhandType = OFF_HAND_SLOTS[equipSlot]
    if offhandType then
        local canUse = specData and specData.canUseOffhand
        if not canUse then return false, "OFFHAND" end
        -- canUseOffhand = true allows all off-hand types; string value must match
        if canUse ~= true and canUse ~= offhandType then return false, "OFFHAND" end
    end

    if classID == 2 then
        local allowed = specData and specData.allowedWeaponTypes
        if allowed and not allowed[subclassID] then return false, "WEAPON" end
    end

    if classID == 4 and subclassID ~= 0 and equipSlot ~= "INVTYPE_CLOAK" and equipSlot ~= "INVTYPE_SHIELD" then
        local preferred = specData and specData.armorType
        if preferred and subclassID ~= preferred then return false, "ARMOR" end
    end

    return true, nil
end

-- ============================================================
-- Cache Management
-- ============================================================

function Addon.ScoringEngine:InvalidateCaches()
    wipe(Addon.ScoreCache)
    wipe(Addon.StrippedLinkCache)
    wipe(Addon.DRCache)
    wipe(trackCache)
    wipe(equipSlotCache)
end

-- ============================================================
-- Scoring Functions
-- ============================================================

function Addon.ScoringEngine:GetMultiplicativeScore(itemLink, specData, weights, combatRatings)
    specData = specData or Addon.ActiveSpecData
    weights = weights or Addon.ActiveWeights
    if not itemLink or not weights then return 0 end

    local strippedLink = StripEnchantAndGems(itemLink)

    -- Only use cache for active spec (most common hot path)
    local isActiveSpec = (specData == Addon.ActiveSpecData)
    if isActiveSpec and not combatRatings then
        local cached = Addon.ScoreCache[strippedLink]
        if cached ~= nil then return cached end
    end

    local valid = self:ValidateEquippable(itemLink, specData)
    if not valid then
        if isActiveSpec and not combatRatings then Addon.ScoreCache[strippedLink] = 0 end
        return 0
    end

    local stats = API:GetItemStats(strippedLink)
    if not stats then return 0 end

    local totalScore = 0
    local primaryStatKey = specData and specData.primary or "ITEM_MOD_AGILITY_SHORT"

    for statName, statValue in pairs(stats) do
        if statName == primaryStatKey or (not isActiveSpec and PRIMARY_STATS[statName]) then
            totalScore = totalScore + (statValue * (weights["PRIMARY"] or 0))
        elseif StatLookup[statName] then
            local statKey = StatLookup[statName]
            local weight = weights[statKey] or 0
            if NoDRStats[statKey] then
                totalScore = totalScore + (statValue * weight)
            else
                local drMult = Addon.DR:GetDRMultiplier(statKey, statValue, weights, combatRatings)
                totalScore = totalScore + (statValue * weight * drMult)
            end
        end
    end

    local weaponDPS = stats["ITEM_MOD_DAMAGE_PER_SECOND_SHORT"]
    if weaponDPS and weaponDPS > 0 then
        totalScore = totalScore + (weaponDPS * (weights["WEAPON_DPS"] or 0))
    end

    local numSockets = stats["EMPTY_SOCKET_PRISMATIC"] or 0
    if numSockets > 0 then
        local socketValue = weights["SOCKET_VALUE"] or 420
        totalScore = totalScore + (numSockets * socketValue)
    end

    if isActiveSpec and not combatRatings then Addon.ScoreCache[strippedLink] = totalScore end
    return totalScore
end

-- ============================================================
-- Slot Comparison Functions
-- ============================================================

function Addon.ScoringEngine:GetEquippedScoresForSlots(itemLink, snapshot, specData, weights, combatRatings)
    local equipSlot = GetEquipSlotInfo(itemLink)
    if not equipSlot or equipSlot == "" then return {}, false end

    local mapping = SLOT_MAP[equipSlot]
    if not mapping then return {}, false end

    local slots = equipSlot == "INVTYPE_WEAPON"
        and FilterWeaponMapping(mapping, snapshot, specData)
        or mapping

    local candidateID = API:GetItemIDForItemInfo(itemLink)
    local candidateStripped = StripEnchantAndGems(itemLink)

    -- Dual-slot matching by item ID (live inventory only)
    if not snapshot and #slots > 1 and candidateID and equipSlot ~= "INVTYPE_WEAPON" then
        local matched = {}
        for _, slotInfo in ipairs(slots) do
            if API:GetInventoryItemID("player", slotInfo[2]) == candidateID then
                table_insert(matched, slotInfo)
            end
        end
        if #matched > 0 then slots = matched end
    end

    local results = {}
    local allEquipped = true
    for _, slotInfo in ipairs(slots) do
        local slotName, slotID = slotInfo[1], slotInfo[2]
        local link = snapshot and snapshot[slotID] or API:GetInventoryItemLink("player", slotID)

        local slotEquipped = false
        if not snapshot and candidateStripped and link then
            local equippedStripped = StripEnchantAndGems(link)
            if equippedStripped == candidateStripped then slotEquipped = true end
        end
        if not slotEquipped then allEquipped = false end

        local equippedLink = link  -- preserve original link for set comparison
        link = StripEnchantAndGems(link)
        local score = link and self:GetMultiplicativeScore(link, specData, weights, combatRatings) or 0

        if equipSlot == "INVTYPE_2HWEAPON" and slotID == 16 then
            local ohLink = snapshot and snapshot[17] or API:GetInventoryItemLink("player", 17)
            if ohLink then
                ohLink = StripEnchantAndGems(ohLink)
                score = score + (ohLink and self:GetMultiplicativeScore(ohLink, specData, weights, combatRatings) or 0)
            end
        end

        table_insert(results, {
            slotName = slotName,
            score = score,
            slotID = slotID,
            isEquipped = slotEquipped,
            equippedLink = equippedLink,
        })
    end

    return results, allEquipped
end

function Addon.ScoringEngine:GetCurrentEquippedScore(itemLink)
    local results = self:GetEquippedScoresForSlots(itemLink)
    if #results == 0 then return 0 end

    if #results == 1 then return results[1].score end

    local score1, score2 = results[1].score, results[2].score
    if score1 > 0 and score2 > 0 then return math_min(score1, score2) end
    return math_max(score1, score2)
end

function Addon.ScoringEngine:GetWeakestEquippedSlotID(itemLink, snapshot, specData, weights, combatRatings)
    local _, slotID = self:GetWeakestEquipped(itemLink, snapshot, specData, weights, combatRatings)
    return slotID
end

-- Returns both the weakest equipped link and slot ID in a single pass.
function Addon.ScoringEngine:GetWeakestEquipped(itemLink, snapshot, specData, weights, combatRatings)
    local equipSlot = GetEquipSlotInfo(itemLink)
    if not equipSlot or equipSlot == "" then return nil, nil end

    local mapping = SLOT_MAP[equipSlot]
    if not mapping then return nil, nil end

    if equipSlot == "INVTYPE_WEAPON" then
        mapping = FilterWeaponMapping(mapping, snapshot, specData)
    end

    local weakestLink, weakestSlotID, weakestScore = nil, nil, math_huge
    for _, slotInfo in ipairs(mapping) do
        local slotID = slotInfo[2]
        local link = snapshot and snapshot[slotID] or API:GetInventoryItemLink("player", slotID)
        if link then
            local stripped = StripEnchantAndGems(link)
            local score = stripped and self:GetMultiplicativeScore(stripped, specData, weights, combatRatings) or 0
            if score < weakestScore then
                weakestScore = score
                weakestLink = link
                weakestSlotID = slotID
            end
        elseif not weakestLink then
            weakestScore = 0
            weakestSlotID = slotID
        end
    end

    return weakestLink, weakestSlotID
end

-- ============================================================
-- Category Comparison Functions
-- ============================================================

function Addon.ScoringEngine:CompareArmor(itemLink, snapshot, specData, weights, combatRatings)
    local candidateScore = self:GetMultiplicativeScore(itemLink, specData, weights, combatRatings)
    local equippedScores, isEquipped = self:GetEquippedScoresForSlots(itemLink, snapshot, specData, weights, combatRatings)
    return {
        category = "ARMOR",
        candidateScore = candidateScore,
        equippedScores = equippedScores,
        isEquipped = isEquipped,
    }
end

function Addon.ScoringEngine:CompareJewelry(itemLink, snapshot, specData, weights, combatRatings)
    local candidateScore = self:GetMultiplicativeScore(itemLink, specData, weights, combatRatings)
    local equippedScores, isEquipped = self:GetEquippedScoresForSlots(itemLink, snapshot, specData, weights, combatRatings)
    local strippedLink = StripEnchantAndGems(itemLink)
    local stats = strippedLink and API:GetItemStats(strippedLink)
    local numSockets = stats and (stats["EMPTY_SOCKET_PRISMATIC"] or 0) or 0
    return {
        category = "JEWELRY",
        candidateScore = candidateScore,
        equippedScores = equippedScores,
        isEquipped = isEquipped,
        metadata = { sockets = numSockets },
    }
end

function Addon.ScoringEngine:CompareWeapon(itemLink, snapshot, specData, weights, combatRatings)
    local baseScore = self:GetMultiplicativeScore(itemLink, specData, weights, combatRatings)
    local equippedScores, isEquipped = self:GetEquippedScoresForSlots(itemLink, snapshot, specData, weights, combatRatings)

    weights = weights or Addon.ActiveWeights
    specData = specData or Addon.ActiveSpecData
    local roleMult = GetWeaponRoleMultiplier(specData, weights)
    local candidateAdj = GetWeaponDpsAdjustment(itemLink, weights, roleMult)

    -- Adjust equipped scores in-place (avoids cloning the results table)
    for _, slotInfo in ipairs(equippedScores) do
        local link = slotInfo.equippedLink
        if link then
            slotInfo.score = slotInfo.score + GetWeaponDpsAdjustment(link, weights, roleMult)
        end
    end

    local equipSlot = GetEquipSlotInfo(itemLink)

    return {
        category = "WEAPON",
        candidateScore = baseScore + candidateAdj,
        equippedScores = equippedScores,
        isEquipped = isEquipped,
        metadata = {
            roleMultiplier = roleMult,
            displacesOffhand = TWO_HAND_SLOTS[equipSlot] or false,
        },
    }
end

function Addon.ScoringEngine:CompareTrinket(itemLink, snapshot, specData, weights, combatRatings)
    local candidateScore = self:GetMultiplicativeScore(itemLink, specData, weights, combatRatings)
    local equippedScores, isEquipped = self:GetEquippedScoresForSlots(itemLink, snapshot, specData, weights, combatRatings)

    local trinketComparison = nil
    if Addon.TrinketEvaluator then
        trinketComparison = Addon.TrinketEvaluator:EvaluateTrinketComparison(
            itemLink, equippedScores,
            specData or Addon.ActiveSpecData,
            Addon.ActiveContentType
        )
    end

    return {
        category = "TRINKET",
        candidateScore = candidateScore,
        equippedScores = equippedScores,
        isEquipped = isEquipped,
        trinketComparison = trinketComparison,
    }
end

function Addon.ScoringEngine:CompareForSlotCategory(itemLink, snapshot, specData, weights, combatRatings)
    if not itemLink then return nil end
    local category = GetSlotCategory(itemLink)
    if not category then return nil end

    if category == "ARMOR" then
        return self:CompareArmor(itemLink, snapshot, specData, weights, combatRatings)
    elseif category == "JEWELRY" then
        return self:CompareJewelry(itemLink, snapshot, specData, weights, combatRatings)
    elseif category == "WEAPON" then
        return self:CompareWeapon(itemLink, snapshot, specData, weights, combatRatings)
    elseif category == "TRINKET" then
        return self:CompareTrinket(itemLink, snapshot, specData, weights, combatRatings)
    end
    return nil
end
