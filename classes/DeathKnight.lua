local _, playerClass = UnitClass("player")
if playerClass ~= "DEATHKNIGHT" then return end

local _, Addon = ...

-- Ensure the table exists in the master object
Addon.ClassData["DEATHKNIGHT"] = {
    -- BLOOD (Spec ID: 250)
    [250] = {
        name = "Blood",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 227, -- Blood Shield: 2% absorption from Death Strike + 1% AP per point
        armorType = 4, -- Plate
        role = "TANK",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [1]  = true, -- Two-Handed Axes
            [5]  = true, -- Two-Handed Maces
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 3.00, HASTE = 1.05, VERS = 1.03, MASTERY = 0.89, CRIT = 0.65, STAMINA = 2.50, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Solo/Delves"]  = { PRIMARY = 1.20, CRIT = 1.05, MASTERY = 1.04, HASTE = 1.00, VERS = 0.76, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Mythic+"]      = { PRIMARY = 1.20, HASTE = 0.93, VERS = 0.65, MASTERY = 0.95, CRIT = 1.05, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Raid"]         = { PRIMARY = 1.20, CRIT = 1.05, HASTE = 1.02, MASTERY = 0.89, VERS = 0.65, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
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
                ["S"] = { 252420, 249343 },                                 -- Solarflare Prism, Gaze of the Alnseer
                ["A"] = { 249344, 249342, 250256, 264507 },                 -- Light Company Guidon, Heart of Ancient Hunger, Heart of Wind, Crucible of Erratic Energies
                ["B"] = { 249339, 252418, 193701, 251792, 250258, 252421 }, -- Gloom-Spattered Dreadscale, Solar Core Igniter, Algeth'ar Puzzle Box, Glorious Crusader's Keepsake, Vessel of Tortured Souls, Rotting Globule
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249343, 249344, 249342 },                 -- Gaze of the Alnseer, Light Company Guidon, Heart of Ancient Hunger
                ["A"] = { 252420, 250256 },                         -- Solarflare Prism, Heart of Wind
                ["B"] = { 264507, 249339, 193701, 260235 },         -- Crucible of Erratic Energies, Gloom-Spattered Dreadscale, Algeth'ar Puzzle Box, Umbral Plume
                ["C"] = { 251792, 249805, 250227 },                 -- Glorious Crusader's Keepsake, Undreamt God's Oozing Vestige, Kroluk's Warbanner
                ["D"] = {},
            },
        }
    },

    -- FROST (Spec ID: 251)
    [251] = {
        name = "Frost",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 500, -- Frozen Heart: 2% Frost damage per point
        armorType = 4, -- Plate
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [1]  = true, -- Two-Handed Axes
            [5]  = true, -- Two-Handed Maces
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, MASTERY = 1.05, CRIT = 1.00, HASTE = 0.85, VERS = 0.75, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.99, HASTE = 0.69, VERS = 0.28, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 1.02, HASTE = 0.81, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 1.01, HASTE = 0.79, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 249343, 249344, 193701 },                         -- Gaze of the Alnseer, Light Company Guidon, Algeth'ar Puzzle Box
                ["A"] = { 249342, 252420, 264507 },                         -- Heart of Ancient Hunger, Solarflare Prism, Crucible of Erratic Energies
                ["B"] = { 250256, 251792, 250258, 249806, 248583, 265657 }, -- Heart of Wind, Glorious Crusader's Keepsake, Vessel of Tortured Souls, Radiant Plume, Drum of Renewed Bonds, Fiber of Living Agony
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249344, 249343 },                         -- Light Company Guidon, Gaze of the Alnseer
                ["A"] = { 249342, 193701, 252420 },                 -- Heart of Ancient Hunger, Algeth'ar Puzzle Box, Solarflare Prism
                ["B"] = { 249806, 264507, 250256 },                 -- Radiant Plume, Crucible of Erratic Energies, Heart of Wind
                ["C"] = { 251792, 248583, 265657, 260235 },         -- Glorious Crusader's Keepsake, Drum of Renewed Bonds, Fiber of Living Agony, Umbral Plume
                ["D"] = {},
            },
        }
    },

    -- UNHOLY (Spec ID: 252)
    [252] = {
        name = "Unholy",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 555, -- Dreadblade: 1.8% minion/shadow + 0.2% crit per point
        armorType = 4, -- Plate
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [1]  = true, -- Two-Handed Axes
            [5]  = true, -- Two-Handed Maces
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, MASTERY = 1.05, CRIT = 0.95, HASTE = 0.85, VERS = 0.78, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.84, HASTE = 0.70, VERS = 0.24, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 1.02, HASTE = 0.79, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 1.01, HASTE = 0.79, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 249344, 249343 },                                 -- Light Company Guidon, Gaze of the Alnseer
                ["A"] = { 252420, 249342, 193701 },                         -- Solarflare Prism, Heart of Ancient Hunger, Algeth'ar Puzzle Box
                ["B"] = { 264507, 250256, 250258, 251792, 248583, 249806 }, -- Crucible of Erratic Energies, Heart of Wind, Vessel of Tortured Souls, Glorious Crusader's Keepsake, Drum of Renewed Bonds, Radiant Plume
                ["C"] = { 265657 },                                         -- Fiber of Living Agony
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249344, 249343 },                         -- Light Company Guidon, Gaze of the Alnseer
                ["A"] = { 249342, 252420, 193701 },                 -- Heart of Ancient Hunger, Solarflare Prism, Algeth'ar Puzzle Box
                ["B"] = { 264507, 249806, 250256 },                 -- Crucible of Erratic Energies, Radiant Plume, Heart of Wind
                ["C"] = { 248583, 251792, 250258, 265657 },         -- Drum of Renewed Bonds, Glorious Crusader's Keepsake, Vessel of Tortured Souls, Fiber of Living Agony
                ["D"] = {},
            },
        }
    },

    -- INITIAL (Spec ID: 1455)
    [1455] = {
        name = "Initial",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 800,
        armorType = 4, -- Plate
        role = "LEVELING",
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [1]  = true, -- Two-Handed Axes
            [5]  = true, -- Two-Handed Maces
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
        },
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Death Knight Module Loaded.")
