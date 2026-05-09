local _, Addon = ...
local API = Addon.API
Addon.DR = {}

local ipairs = ipairs
local pcall = pcall
local wipe = wipe
local math_max = math.max
local math_min = math.min
local string_format = string.format
local UnitLevel = UnitLevel

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

-- Approximate rating-per-1%-bonus by player level. Used by the proxy fallback
-- when GetCombatRating returns a Secret Value (12.0+) and we cannot read the
-- player's live rating directly. Numbers are approximate and only need to be
-- close enough to place the player in the correct DR bracket; relative
-- ranking of items is preserved even if absolute conversion is off.
local RPP_BY_LEVEL = {
    [80] = { CRIT = 180, HASTE = 170, MASTERY = 180, VERS = 205 },
    [70] = { CRIT = 35,  HASTE = 33,  MASTERY = 35,  VERS = 40  },
}

local function GetRPP(statKey, playerLevel)
    local lvl = playerLevel or UnitLevel("player") or 80
    local row = RPP_BY_LEVEL[lvl] or RPP_BY_LEVEL[80]
    return row[statKey]
end

-- Memoized within a single DR evaluation pass; wiped by InvalidateCache when
-- equipment, spec, or active snapshot changes.
local activeProxyCache

local function GetActiveSnapshotTotalStats()
    if activeProxyCache ~= nil then
        if activeProxyCache == false then return nil end
        return activeProxyCache.totalStats, activeProxyCache.playerLevel
    end
    local specIndex = API:GetSpecialization()
    local specID = specIndex and API:GetSpecializationInfo(specIndex)
    local snap = specID and Addon.SpecSnapshots and Addon.SpecSnapshots[specID]
    if not snap then
        activeProxyCache = false
        return nil
    end
    activeProxyCache = {
        totalStats = snap.totalStats,
        playerLevel = snap.combatRatings and snap.combatRatings.playerLevel,
    }
    return activeProxyCache.totalStats, activeProxyCache.playerLevel
end

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
--
-- Tries (in order):
--   1. Snapshot rating + bonus passed in via combatRatings (may be Secret in 12.0+).
--   2. Live API:GetCombatRating / GetCombatRatingBonus (also may be Secret).
--   3. Proxy: gear-only rating from snapshot.totalStats + hardcoded
--      rating-per-percent constants. This path is non-secret-safe.
--
-- Wrapped in pcall so any future Secret Value surfacing through a path we
-- missed degrades to 1.0 (no DR scaling) instead of throwing a Lua error.
function Addon.DR:GetDRMultiplier(statKey, deltaRating, weights, combatRatings)
    local ok, result = pcall(self._ComputeDRMultiplier, self, statKey, deltaRating, weights, combatRatings)
    if not ok then return 1.0 end
    return result
end

function Addon.DR:_ComputeDRMultiplier(statKey, deltaRating, weights, combatRatings)
    if not deltaRating or deltaRating == 0 then return 1.0 end

    local ratingIdx = RatingIndex[statKey]
    if not ratingIdx then return 1.0 end

    local currentRating, currentPct
    if combatRatings and combatRatings[statKey] then
        currentRating = combatRatings[statKey].rating
        currentPct = combatRatings[statKey].bonus
    else
        currentRating = API:GetCombatRating(ratingIdx)
        currentPct = API:GetCombatRatingBonus(ratingIdx)
    end

    -- Proxy fallback when the API returned nil (Secret Value detected at the
    -- API boundary, see API.lua). Use gear-only rating + hardcoded RPP.
    if not currentRating or not currentPct then
        local totalStats = combatRatings and combatRatings.totalStats
        local playerLevel = combatRatings and combatRatings.playerLevel
        if not totalStats then
            totalStats, playerLevel = GetActiveSnapshotTotalStats()
        end
        local gearRating = totalStats and totalStats[statKey]
        local rpp = GetRPP(statKey, playerLevel)
        if gearRating and gearRating > 0 and rpp then
            currentRating = gearRating
            currentPct = gearRating / rpp
        end
    end

    if not currentRating or not currentPct then return 1.0 end
    if currentRating <= 0 or currentPct <= 0 then return 1.0 end

    local isTop = self:IsTopTwoStat(statKey, weights)
    local cacheKey = string_format("%s:%d:%d:%s", statKey, currentRating, deltaRating, isTop and "R" or "S")
    local cached = Addon.DRCache[cacheKey]
    if cached then return cached end

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
    activeProxyCache = nil
end

-- Returns the rating index for a stat key (for external use if needed)
function Addon.DR:GetRatingIndex(statKey)
    return RatingIndex[statKey]
end

-- Returns the list of secondary stats subject to DR
function Addon.DR:GetSecondaryStats()
    return SECONDARY_STATS
end
