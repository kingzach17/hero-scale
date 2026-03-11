local _, Addon = ...
local API = Addon.API
Addon.DR = {}

local ipairs = ipairs
local wipe = wipe
local math_max = math.max
local math_min = math.min
local string_format = string.format

-- Diminishing return brackets: {percentThreshold, multiplier}
-- Each penalty applies only to the portion of rating within that bracket
local DR_BRACKETS = {
    { 0,   1.0 },  -- 0-30%: full value
    { 30,  0.9 },  -- 30-39%: 10% penalty
    { 39,  0.8 },  -- 39-47%: 20% penalty
    { 47,  0.7 },  -- 47-54%: 30% penalty
    { 54,  0.6 },  -- 54-66%: 40% penalty
    { 66,  0.5 },  -- 66-126%: 50% penalty
    { 126, 0.0 },  -- 126%+: hard cap
}

-- Relaxed brackets for top-2 secondary stats: no penalty until 39%
local DR_BRACKETS_RELAXED = {
    { 0,   1.0 },  -- 0-39%: full value (breaching 30% is normal for top stats)
    { 39,  0.8 },  -- 39-47%: 20% penalty
    { 47,  0.7 },  -- 47-54%: 30% penalty
    { 54,  0.6 },  -- 54-66%: 40% penalty
    { 66,  0.5 },  -- 66-126%: 50% penalty
    { 126, 0.0 },  -- 126%+: hard cap
}

-- WoW combat rating constants for secondary stats
local RatingIndex = {
    CRIT    = CR_CRIT_SPELL,
    HASTE   = CR_HASTE_SPELL,
    MASTERY = CR_MASTERY,
    VERS    = CR_VERSATILITY_DAMAGE_DONE,
}

-- Secondary stat keys eligible for DR bracket selection
local SECONDARY_STATS = { "CRIT", "HASTE", "MASTERY", "VERS" }

-- Returns true if statKey is one of the two highest-weighted secondary stats
function Addon.DR:IsTopTwoStat(statKey, weights)
    if not weights then return false end

    local myWeight = weights[statKey] or 0
    local higherCount = 0
    for _, key in ipairs(SECONDARY_STATS) do
        if key ~= statKey and (weights[key] or 0) > myWeight then
            higherCount = higherCount + 1
        end
    end
    return higherCount < 2
end

-- Returns a multiplier (0.0-1.0) representing how much of deltaRating's
-- value survives diminishing returns at the player's current rating level.
-- Uses GetCombatRatingBonus() to derive accurate rating-to-percent conversion
-- at any level, rather than hardcoded constants.
function Addon.DR:GetDRMultiplier(statKey, deltaRating, weights, combatRatings)
    if not deltaRating or deltaRating == 0 then return 1.0 end

    local ratingIdx = RatingIndex[statKey]
    if not ratingIdx then return 1.0 end

    local currentRating, currentPct
    if combatRatings and combatRatings[statKey] then
        currentRating = combatRatings[statKey].rating
        currentPct = combatRatings[statKey].bonus
    else
        currentRating = API:GetCombatRating(ratingIdx)
    end
    if not currentRating or currentRating <= 0 then return 1.0 end

    -- Cache lookup: same stat + current rating + delta + bracket type + source = same result
    local isTop = self:IsTopTwoStat(statKey, weights)
    local cacheKey = string_format("%s:%d:%d:%s:%s", statKey, currentRating, deltaRating, isTop and "R" or "S", combatRatings and "snap" or "live")
    local cached = Addon.DRCache[cacheKey]
    if cached then return cached end

    if not currentPct then
        currentPct = API:GetCombatRatingBonus(ratingIdx)
    end
    if not currentPct or currentPct <= 0 then return 1.0 end

    -- Derive rating-per-percent dynamically from the player's actual stats
    local rpp = currentRating / currentPct
    local newPct = (currentRating + deltaRating) / rpp
    local rawGain = newPct - currentPct
    if rawGain <= 0 then return 1.0 end

    local effectiveGain = 0
    local brackets = isTop and DR_BRACKETS_RELAXED or DR_BRACKETS
    for i, bracket in ipairs(brackets) do
        local threshold = bracket[1]
        local multiplier = bracket[2]
        local nextThreshold = brackets[i + 1] and brackets[i + 1][1] or 9999

        local overlapStart = math_max(currentPct, threshold)
        local overlapEnd = math_min(newPct, nextThreshold)

        if overlapStart < overlapEnd then
            effectiveGain = effectiveGain + (overlapEnd - overlapStart) * multiplier
        end
    end

    local result = effectiveGain / rawGain
    Addon.DRCache[cacheKey] = result
    return result
end

-- Clears the DR cache (called on equipment change)
function Addon.DR:InvalidateCache()
    wipe(Addon.DRCache)
end

-- Returns the rating index for a stat key (for external use if needed)
function Addon.DR:GetRatingIndex(statKey)
    return RatingIndex[statKey]
end

-- Returns the list of secondary stats subject to DR
function Addon.DR:GetSecondaryStats()
    return SECONDARY_STATS
end
