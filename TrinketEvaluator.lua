local _, Addon = ...
local API = Addon.API
Addon.TrinketEvaluator = {}

local ipairs = ipairs
local math_abs = math.abs
local table_insert = table.insert

-- Tier hierarchy: lower number = better tier
local TIER_ORDER = {
    S = 1,
    A = 2,
    B = 3,
    C = 4,
    D = 5,
}

-- Tier display names
local TIER_NAMES = { "S", "A", "B", "C", "D" }

-- Result types for trinket comparison
Addon.TrinketEvaluator.TIER_UPGRADE    = "TIER_UPGRADE"
Addon.TrinketEvaluator.TIER_DOWNGRADE  = "TIER_DOWNGRADE"
Addon.TrinketEvaluator.TIER_SIDEGRADE  = "TIER_SIDEGRADE"
Addon.TrinketEvaluator.NOT_IN_LIST     = "NOT_IN_LIST"
Addon.TrinketEvaluator.FALLBACK        = "FALLBACK"

-- ============================================================
-- Tier Lookup Functions
-- ============================================================

-- Get the tier for a trinket item ID in the current content type
-- Returns tier name (S/A/B/C/D) or nil if not in tier list
function Addon.TrinketEvaluator:GetTrinketTier(itemID, specData, contentType)
    if not itemID or not specData or not specData.trinkets then
        return nil
    end

    local contentTrinkets = specData.trinkets[contentType]
    if not contentTrinkets then
        -- Fallback to Leveling if content type not found
        contentTrinkets = specData.trinkets["Leveling"]
    end

    if not contentTrinkets then
        return nil
    end

    -- Search through each tier
    for _, tierName in ipairs(TIER_NAMES) do
        local tierItems = contentTrinkets[tierName]
        if tierItems then
            for _, tierItemID in ipairs(tierItems) do
                if tierItemID == itemID then
                    return tierName
                end
            end
        end
    end

    return nil
end

-- Get the tier order value (lower = better)
function Addon.TrinketEvaluator:GetTierOrder(tier)
    if not tier then return 999 end -- Not in list = worst
    return TIER_ORDER[tier] or 999
end

-- ============================================================
-- Comparison Functions
-- ============================================================

-- Compare two trinkets using the tier system
-- Returns: { comparison = type, newTier, equippedTier, tierDiff, useFallback }
function Addon.TrinketEvaluator:CompareTrinkets(newItemID, equippedItemID, specData, contentType)
    local newTier = self:GetTrinketTier(newItemID, specData, contentType)
    local equippedTier = self:GetTrinketTier(equippedItemID, specData, contentType)

    local newOrder = self:GetTierOrder(newTier)
    local equippedOrder = self:GetTierOrder(equippedTier)

    -- Case 1: Both items are in tier lists - pure tier comparison
    if newTier and equippedTier then
        local tierDiff = equippedOrder - newOrder -- Positive = upgrade
        if tierDiff > 0 then
            return {
                comparison = self.TIER_UPGRADE,
                newTier = newTier,
                equippedTier = equippedTier,
                tierDiff = tierDiff,
                useFallback = false,
            }
        elseif tierDiff < 0 then
            return {
                comparison = self.TIER_DOWNGRADE,
                newTier = newTier,
                equippedTier = equippedTier,
                tierDiff = tierDiff,
                useFallback = false,
            }
        else
            return {
                comparison = self.TIER_SIDEGRADE,
                newTier = newTier,
                equippedTier = equippedTier,
                tierDiff = 0,
                useFallback = false,
            }
        end
    end

    -- Case 2: New item NOT in tier list, equipped IS in tier list
    if not newTier and equippedTier then
        return {
            comparison = self.NOT_IN_LIST,
            newTier = nil,
            equippedTier = equippedTier,
            tierDiff = nil,
            useFallback = false,
        }
    end

    -- Case 3: Neither in tier lists OR new is in list but equipped isn't
    -- Fall back to stat-based scoring
    return {
        comparison = self.FALLBACK,
        newTier = newTier,
        equippedTier = equippedTier,
        tierDiff = nil,
        useFallback = true,
    }
end

-- ============================================================
-- Evaluation for Tooltip Display
-- ============================================================

-- Evaluate trinket comparison for tooltip display
-- Called by ScoringEngine:CompareTrinket()
-- Returns structured data for Tooltip.lua to render
function Addon.TrinketEvaluator:EvaluateTrinketComparison(itemLink, equippedScores, specData, contentType)
    if not itemLink or not specData or not equippedScores then
        return nil
    end

    local newItemID = API:GetItemIDForItemInfo(itemLink)
    if not newItemID then return nil end

    local trinkets = specData.trinkets
    if not trinkets then return nil end

    -- Evaluate against each equipped trinket slot
    local results = {}
    for _, slotInfo in ipairs(equippedScores) do
        local equippedLink = slotInfo.equippedLink
        local equippedItemID = equippedLink and API:GetItemIDForItemInfo(equippedLink)

        local comparison = self:CompareTrinkets(newItemID, equippedItemID, specData, contentType)
        table_insert(results, {
            slotID = slotInfo.slotID,
            slotName = slotInfo.slotName,
            comparison = comparison,
        })
    end

    -- Determine overall result: use the best comparison among equipped slots
    local bestResult = nil
    local bestScore = -999

    for _, result in ipairs(results) do
        local comp = result.comparison
        local score = 0

        if comp.comparison == self.TIER_UPGRADE then
            score = 100 + (comp.tierDiff or 0)
        elseif comp.comparison == self.TIER_SIDEGRADE then
            score = 50
        elseif comp.comparison == self.FALLBACK then
            score = 25 -- Neutral, will use stat comparison
        elseif comp.comparison == self.NOT_IN_LIST then
            score = -50 -- Downgrade if not in list
        elseif comp.comparison == self.TIER_DOWNGRADE then
            score = -100 - math_abs(comp.tierDiff or 0)
        end

        if score > bestScore then
            bestScore = score
            bestResult = result
        end
    end

    return {
        perSlot = results,
        best = bestResult,
        hasNewTier = results[1] and results[1].comparison.newTier ~= nil or false,
    }
end

