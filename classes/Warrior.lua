local _, playerClass = UnitClass("player")
if playerClass ~= "WARRIOR" then return end

local _, Addon = ...

-- Ensure the table exists in the master object
Addon.ClassData["WARRIOR"] = {
    -- ARMS (Spec ID: 71)
    [71] = {
        name = "Arms",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 909, -- Deep Wounds: 1.1% damage to bleeding targets per point
        armorType = 4, -- Plate
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [15] = true, -- Daggers
            [13] = true, -- Fist Weapons
            [1]  = true, -- Two-Handed Axes
            [5]  = true, -- Two-Handed Maces
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
            [10] = true, -- Staves
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, CRIT = 0.65, MASTERY = 0.62, VERS = 0.25, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.5, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 0.90, MASTERY = 0.56, VERS = 0.28, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.5, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 0.98, CRIT = 1.05, MASTERY = 0.74, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 0.99, CRIT = 1.05, MASTERY = 0.75, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.5, SOCKET_VALUE = 65 },
        },
        trinkets = {
            ["Leveling"] = {
                ["S"] = {},
                ["A"] = {},
                ["B"] = {},
                ["C"] = {},
                ["D"] = {},
            },
            ["Solo/Delves"] = {
                ["S"] = {},
                ["A"] = {},
                ["B"] = {},
                ["C"] = {},
                ["D"] = {},
            },
            ["Mythic+"] = {
                ["S"] = { 249342, 249343 },                                  -- Heart of Ancient Hunger, Gaze of the Alnseer
                ["A"] = { 252420, 264507, 250256, 193701 },                  -- Solarflare Prism, Crucible of Erratic Energies, Heart of Wind, Algeth'ar Puzzle Box
                ["B"] = { 260235, 249344, 251792, 248583 },                  -- Umbral Plume, Light Company Guidon, Glorious Crusader's Keepsake, Drum of Renewed Bonds
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249342, 249343, 252420 },                          -- Heart of Ancient Hunger, Gaze of the Alnseer, Solarflare Prism
                ["A"] = { 264507, 250256, 193701 },                          -- Crucible of Erratic Energies, Heart of Wind, Algeth'ar Puzzle Box
                ["B"] = { 260235, 249344 },                                  -- Umbral Plume, Light Company Guidon
                ["C"] = { 248583, 251792, 251782, 265657 },                  -- Drum of Renewed Bonds, Glorious Crusader's Keepsake, Withered Saptor's Paw, Fiber of Living Agony
                ["D"] = {},
            },
        }
    },

    -- FURY (Spec ID: 72)
    [72] = {
        name = "Fury",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 714, -- Unshackled Fury: 1.4% damage while Enraged per point
        armorType = 4, -- Plate
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [15] = true, -- Daggers
            [13] = true, -- Fist Weapons
            [1]  = true, -- Two-Handed Axes
            [5]  = true, -- Two-Handed Maces
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
            [10] = true, -- Staves
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, MASTERY = 0.84, CRIT = 0.37, VERS = 0.21, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 7.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.92, CRIT = 0.43, VERS = 0.38, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 7.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 1.01, CRIT = 0.81, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 7.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 1.04, VERS = 0.65, CRIT = 0.81, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 7.0, SOCKET_VALUE = 65 },
        },
        trinkets = {
            ["Leveling"] = {
                ["S"] = {},
                ["A"] = {},
                ["B"] = {},
                ["C"] = {},
                ["D"] = {},
            },
            ["Solo/Delves"] = {
                ["S"] = {},
                ["A"] = {},
                ["B"] = {},
                ["C"] = {},
                ["D"] = {},
            },
            ["Mythic+"] = {
                ["S"] = { 249342, 249343 },                                  -- Heart of Ancient Hunger, Gaze of the Alnseer
                ["A"] = { 193701, 252420, 250256 },                          -- Algeth'ar Puzzle Box, Solarflare Prism, Heart of Wind
                ["B"] = { 264507, 249806, 251782, 249344, 251792 },          -- Crucible of Erratic Energies, Radiant Plume, Withered Saptor's Paw, Light Company Guidon, Glorious Crusader's Keepsake
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249342, 249343 },                                  -- Heart of Ancient Hunger, Gaze of the Alnseer
                ["A"] = { 193701, 252420 },                                  -- Algeth'ar Puzzle Box, Solarflare Prism
                ["B"] = { 250256, 264507, 249806, 249344 },                  -- Heart of Wind, Crucible of Erratic Energies, Radiant Plume, Light Company Guidon
                ["C"] = { 251782, 251792 },                                  -- Withered Saptor's Paw, Glorious Crusader's Keepsake
                ["D"] = {},
            },
        }
    },

    -- PROTECTION (Spec ID: 73)
    [73] = {
        name = "Protection",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 600, -- Critical Block: 0.5% block + 1.5% crit block + 1% AP per point
        armorType = 4, -- Plate
        role = "TANK",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = "SHIELD",
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 3.00, HASTE = 1.05, MASTERY = 0.55, VERS = 0.34, CRIT = 0.31, STAMINA = 2.50, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.0, SOCKET_VALUE = 70 },
            ["Solo/Delves"]  = { PRIMARY = 1.20, HASTE = 1.05, CRIT = 0.70, VERS = 0.51, MASTERY = 0.41, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.0, SOCKET_VALUE = 70 },
            ["Mythic+"]      = { PRIMARY = 1.20, HASTE = 1.05, MASTERY = 0.72, VERS = 0.65, CRIT = 0.84, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.0, SOCKET_VALUE = 70 },
            ["Raid"]         = { PRIMARY = 1.20, HASTE = 1.05, CRIT = 0.87, VERS = 0.65, MASTERY = 0.73, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.0, SOCKET_VALUE = 70 },
        },
        trinkets = {
            ["Leveling"] = {
                ["S"] = {},
                ["A"] = {},
                ["B"] = {},
                ["C"] = {},
                ["D"] = {},
            },
            ["Solo/Delves"] = {
                ["S"] = {},
                ["A"] = {},
                ["B"] = {},
                ["C"] = {},
                ["D"] = {},
            },
            ["Mythic+"] = {
                ["S"] = { 250256 },                                          -- Heart of Wind
                ["A"] = { 249342, 249343, 252420 },                          -- Heart of Ancient Hunger, Gaze of the Alnseer, Solarflare Prism
                ["B"] = { 264507, 252418, 193701, 249339, 250242, 252421 },  -- Crucible of Erratic Energies, Solar Core Igniter, Algeth'ar Puzzle Box, Gloom-Spattered Dreadscale, Jelly Replicator, Rotting Globule
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249342, 249343 },                                  -- Heart of Ancient Hunger, Gaze of the Alnseer
                ["A"] = { 250256, 252420 },                                  -- Heart of Wind, Solarflare Prism
                ["B"] = { 249344, 249339, 193701, 264507, 260235, 249806 },  -- Light Company Guidon, Gloom-Spattered Dreadscale, Algeth'ar Puzzle Box, Crucible of Erratic Energies, Umbral Plume, Radiant Plume
                ["C"] = { 249805, 249807 },                                  -- Undreamt God's Oozing Vestige, The Eternal Egg
                ["D"] = {},
            },
        }
    },

    -- INITIAL (Spec ID: 1446)
    [1446] = {
        name = "Initial",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 800,
        armorType = 4,
        role = "LEVELING",
        canUseOffhand = "SHIELD",
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [1]  = true, -- Two-Handed Axes
            [4]  = true, -- One-Handed Maces
            [5]  = true, -- Two-Handed Maces
            [6]  = true, -- Polearms
            [7]  = true, -- One-Handed Swords
            [8]  = true, -- Two-Handed Swords
            [10] = true, -- Staves
            [13] = true, -- Fist Weapons
            [15] = true, -- Daggers
        },
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Warrior Module Loaded.")
