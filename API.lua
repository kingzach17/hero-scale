local _, Addon = ...
Addon.API = {}

-- ============================================================
-- Item Information Functions
-- ============================================================

function Addon.API:GetItemInfoInstant(itemLink)
    return C_Item.GetItemInfoInstant(itemLink)
end

function Addon.API:GetItemStats(itemLink)
    return C_Item.GetItemStats(itemLink)
end

function Addon.API:GetItemInfo(itemLink)
    return C_Item.GetItemInfo(itemLink)
end

function Addon.API:GetItemIDForItemInfo(itemLink)
    return C_Item.GetItemIDForItemInfo(itemLink)
end

function Addon.API:GetDetailedItemLevelInfo(itemLink)
    return GetDetailedItemLevelInfo(itemLink)
end

-- ============================================================
-- Equipment Functions
-- ============================================================

function Addon.API:GetInventoryItemLink(unit, slotID)
    return GetInventoryItemLink(unit, slotID)
end

function Addon.API:GetInventoryItemID(unit, slotID)
    return GetInventoryItemID(unit, slotID)
end

function Addon.API:EquipItemByName(itemIdentifier, slotID)
    EquipItemByName(itemIdentifier, slotID)
end

function Addon.API:InCombatLockdown()
    return InCombatLockdown()
end

-- ============================================================
-- Combat Rating Functions
-- ============================================================

function Addon.API:GetCombatRating(ratingIndex)
    return GetCombatRating(ratingIndex)
end

function Addon.API:GetCombatRatingBonus(ratingIndex)
    return GetCombatRatingBonus(ratingIndex)
end

-- ============================================================
-- Specialization and Talent Functions
-- ============================================================

function Addon.API:GetSpecialization()
    return GetSpecialization()
end

function Addon.API:GetSpecializationInfo(specIndex)
    return GetSpecializationInfo(specIndex)
end

-- ============================================================
-- Item Upgrade Functions
-- ============================================================

function Addon.API:GetItemUpgradeCurrentLevel(itemLink)
    if C_ItemUpgrade and C_ItemUpgrade.GetItemUpgradeCurrentLevel then
        return C_ItemUpgrade.GetItemUpgradeCurrentLevel(itemLink)
    end
    return nil, nil
end

-- ============================================================
-- Tooltip Functions
-- ============================================================

function Addon.API:GetTooltipHyperlink(itemLink)
    return C_TooltipInfo.GetHyperlink(itemLink)
end

-- ============================================================
-- Container Functions
-- ============================================================

function Addon.API:GetContainerItemLink(bagID, slotID)
    return C_Container.GetContainerItemLink(bagID, slotID)
end

function Addon.API:GetContainerNumSlots(bagID)
    return C_Container.GetContainerNumSlots(bagID)
end

-- ============================================================
-- CVar Functions
-- ============================================================

function Addon.API:GetCVar(cvar)
    return C_CVar.GetCVar(cvar)
end

-- ============================================================
-- Unit Functions
-- ============================================================

function Addon.API:UnitClass(unit)
    return UnitClass(unit)
end

function Addon.API:UnitLevel(unit)
    return UnitLevel(unit)
end

-- ============================================================
-- Timer Functions
-- ============================================================

function Addon.API:NewTimer(duration, callback)
    return C_Timer.NewTimer(duration, callback)
end

function Addon.API:After(duration, callback)
    return C_Timer.After(duration, callback)
end

-- ============================================================
-- Loot Functions
-- ============================================================

function Addon.API:GetNumLootItems()
    return GetNumLootItems()
end

function Addon.API:GetLootSlotLink(slotIndex)
    return GetLootSlotLink(slotIndex)
end

function Addon.API:GetLootRollItemLink(rollID)
    return GetLootRollItemLink(rollID)
end

-- ============================================================
-- Quest Functions
-- ============================================================

function Addon.API:GetNumQuestChoices()
    return GetNumQuestChoices()
end

function Addon.API:GetNumQuestRewards()
    return GetNumQuestRewards()
end

function Addon.API:GetQuestItemLink(rewardType, index)
    return GetQuestItemLink(rewardType, index)
end

-- ============================================================
-- Merchant Functions
-- ============================================================

function Addon.API:GetMerchantNumItems()
    return GetMerchantNumItems()
end

function Addon.API:GetMerchantItemLink(index)
    return GetMerchantItemLink(index)
end

function Addon.API:GetBuybackItemLink(index)
    return GetBuybackItemLink(index)
end

function Addon.API:GetNumBuybackItems()
    return GetNumBuybackItems()
end

-- ============================================================
-- Currency Functions
-- ============================================================

function Addon.API:GetCurrencyInfo(currencyID)
    if C_CurrencyInfo and C_CurrencyInfo.GetCurrencyInfo then
        return C_CurrencyInfo.GetCurrencyInfo(currencyID)
    end
    return nil
end

-- ============================================================
-- Item GUID Functions
-- ============================================================

function Addon.API:GetItemLinkByGUID(guid)
    return C_Item.GetItemLinkByGUID(guid)
end

-- ============================================================
-- Time Functions
-- ============================================================

function Addon.API:GetTime()
    return GetTime()
end

-- ============================================================
-- Weekly Rewards Functions
-- ============================================================

function Addon.API:GetItemHyperlink(itemDBID)
    if C_WeeklyRewards and C_WeeklyRewards.GetItemHyperlink then
        return C_WeeklyRewards.GetItemHyperlink(itemDBID)
    end
    return nil
end
