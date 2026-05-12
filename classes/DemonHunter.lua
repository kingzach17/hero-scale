local _, playerClass = UnitClass("player")
if playerClass ~= "DEMONHUNTER" then return end

local _, Addon = ...

-- Ensure the table exists in the master object
Addon.ClassData["DEMONHUNTER"] = {
    -- HAVOC (Spec ID: 577)
    [577] = {
        name = "Havoc",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 428,
        armorType = 2, -- Leather
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil, -- Optional, skip when unavailable
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [7]  = true, -- One-Handed Swords
            [9]  = true, -- Warglaives
            [13] = true, -- Fist Weapons
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, CRIT = 1.05, MASTERY = 0.88, HASTE = 0.47, VERS = 0.05, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 0.00 },
            ["Solo/Delves"]  = { PRIMARY = 2.00, CRIT = 1.05, MASTERY = 0.81, HASTE = 0.47, VERS = 0.22, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 2.00, CRIT = 1.05, MASTERY = 0.94, HASTE = 0.77, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 2.00, CRIT = 1.05, MASTERY = 0.94, HASTE = 0.76, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 193701, 249343, 252420 },                          -- Algeth'ar Puzzle Box, Gaze of the Alnseer, Solarflare Prism
                ["A"] = { 264507 },                                          -- Crucible of Erratic Energies
                ["B"] = { 250258, 250256, 251792, 248583, 260235, 250144 },  -- Vessel of Tortured Souls, Heart of Wind, Glorious Crusader's Keepsake, Drum of Renewed Bonds, Umbral Plume, Emberwing Feather
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 193701, 249343, 252420 },                          -- Algeth'ar Puzzle Box, Gaze of the Alnseer, Solarflare Prism
                ["A"] = {},
                ["B"] = { 264507, 260235, 250258, 249806, 248583 },          -- Crucible of Erratic Energies, Umbral Plume, Vessel of Tortured Souls, Radiant Plume, Drum of Renewed Bonds
                ["C"] = { 249805, 249345 },                                  -- Undreamt God's Oozing Vestige, Ranger-Captain's Iridescent Insignia
                ["D"] = {},
            },
        }
    },

    -- VENGEANCE (Spec ID: 581)
    [581] = {
        name = "Vengeance",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 410,
        armorType = 2, -- Leather
        role = "TANK",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [7]  = true, -- One-Handed Swords
            [9]  = true, -- Warglaives
            [13] = true, -- Fist Weapons
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 3.00, HASTE = 1.05, VERS = 0.52, MASTERY = 0.42, CRIT = 0.38, STAMINA = 2.50, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Solo/Delves"]  = { PRIMARY = 3.00, HASTE = 1.05, CRIT = 1.01, MASTERY = 0.54, VERS = 0.40, STAMINA = 2.50, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Mythic+"]      = { PRIMARY = 3.00, HASTE = 1.05, VERS = 0.65, MASTERY = 0.71, CRIT = 0.83, STAMINA = 2.50, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Raid"]         = { PRIMARY = 3.00, CRIT = 0.85, HASTE = 1.05, MASTERY = 0.73, VERS = 0.65, STAMINA = 2.50, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
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
                ["S"] = { 250256, 252420, 249343 },                          -- Heart of Wind, Solarflare Prism, Gaze of the Alnseer
                ["A"] = { 250144, 264507 },                                  -- Emberwing Feather, Crucible of Erratic Energies
                ["B"] = { 252418, 249339, 251792, 249344, 252421 },          -- Solar Core Igniter, Gloom-Spattered Dreadscale, Glorious Crusader's Keepsake, Light Company Guidon, Rotting Globule
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249343, 250256, 252420 },                          -- Gaze of the Alnseer, Heart of Wind, Solarflare Prism
                ["A"] = { 249339, 249344 },                                  -- Gloom-Spattered Dreadscale, Light Company Guidon
                ["B"] = { 250144, 264507, 260235, 252418, 251792 },          -- Emberwing Feather, Crucible of Erratic Energies, Umbral Plume, Solar Core Igniter, Glorious Crusader's Keepsake
                ["C"] = {},
                ["D"] = {},
            },
        }
    },

    -- DEVOURER (Spec ID: 1480)
    [1480] = {
        name = "Devourer",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 400,
        armorType = 2, -- Leather
        role = "CASTER_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [7]  = true, -- One-Handed Swords
            [9]  = true, -- Warglaives
            [13] = true, -- Fist Weapons
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, MASTERY = 1.01, CRIT = 0.34, VERS = 0.18, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 2.00, MASTERY = 1.05, HASTE = 0.92, CRIT = 0.60, VERS = 0.20, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 2.00, HASTE = 0.97, MASTERY = 1.05, CRIT = 0.73, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 2.00, MASTERY = 1.05, HASTE = 0.97, CRIT = 0.73, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 249343, 249346, 250256 },                          -- Gaze of the Alnseer, Vaelgor's Final Stare, Heart of Wind
                ["A"] = { 250144 },                                          -- Emberwing Feather
                ["B"] = { 264507, 249809, 251792, 250258, 248583, 250223 },  -- Crucible of Erratic Energies, Locus-Walker's Ribbon, Glorious Crusader's Keepsake, Vessel of Tortured Souls, Drum of Renewed Bonds, Soulcatcher's Charm
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249343, 249346, 250256 },                          -- Gaze of the Alnseer, Vaelgor's Final Stare, Heart of Wind
                ["A"] = { 250144, 249809 },                                  -- Emberwing Feather, Locus-Walker's Ribbon
                ["B"] = { 264507, 251792, 248583 },                          -- Crucible of Erratic Energies, Glorious Crusader's Keepsake, Drum of Renewed Bonds
                ["C"] = { 250223, 250258 },                                  -- Soulcatcher's Charm, Vessel of Tortured Souls
                ["D"] = {},
            },
        }
    },

    -- INITIAL (Spec ID: 1456)
    [1456] = {
        name = "Initial",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 800,
        armorType = 2, -- Leather
        role = "LEVELING",
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [7]  = true, -- One-Handed Swords
            [9]  = true, -- Warglaives
            [13] = true, -- Fist Weapons
        },
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Demon Hunter Module Loaded.")
