local _, playerClass = UnitClass("player")
if playerClass ~= "ROGUE" then return end

local _, Addon = ...

-- Ensure the table exists in the master object
Addon.ClassData["ROGUE"] = {
    -- ASSASSINATION (Spec ID: 259)
    [259] = {
        name = "Assassination",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 588, -- Potent Assassin: 1.7% poison/bleed damage per point
        armorType = 2, -- Leather
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil, -- Optional, skip when unavailable
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [15] = true, -- Daggers
            [13] = true, -- Fist Weapons
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, MASTERY = 1.05, CRIT = 0.89, HASTE = 0.58, VERS = 0.31, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.97, HASTE = 0.61, VERS = 0.47, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, MASTERY = 0.79, CRIT = 1.05, HASTE = 0.86, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, CRIT = 1.05, MASTERY = 0.80, HASTE = 0.86, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 193701, 249343 },                                  -- Algeth'ar Puzzle Box, Gaze of the Alnseer
                ["A"] = { 252420, 264507 },                                  -- Solarflare Prism, Crucible of Erratic Energies
                ["B"] = { 250144, 250256, 260235, 249344 },                  -- Emberwing Feather, Heart of Wind, Umbral Plume, Light Company Guidon
                ["C"] = { 251782, 251792 },                                  -- Withered Saptor's Paw, Glorious Crusader's Keepsake
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 193701, 249343 },                                  -- Algeth'ar Puzzle Box, Gaze of the Alnseer
                ["A"] = { 252420, 264507 },                                  -- Solarflare Prism, Crucible of Erratic Energies
                ["B"] = { 260235, 249344, 250144, 250256 },                  -- Umbral Plume, Light Company Guidon, Emberwing Feather, Heart of Wind
                ["C"] = { 249805, 265657 },                                  -- Undreamt God's Oozing Vestige, Fiber of Living Agony
                ["D"] = {},
            },
        }
    },

    -- OUTLAW (Spec ID: 260)
    [260] = {
        name = "Outlaw",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 500, -- Main Gauche: offhand attack proc chance
        armorType = 2, -- Leather
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
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, CRIT = 1.05, HASTE = 0.86, VERS = 0.53, MASTERY = 0.44, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, VERS = 1.05, HASTE = 0.99, CRIT = 0.98, MASTERY = 0.58, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, CRIT = 1.05, HASTE = 0.93, VERS = 0.65, MASTERY = 0.70, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, VERS = 0.65, CRIT = 1.05, HASTE = 0.93, MASTERY = 0.69, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 252420, 249343 },                                  -- Solarflare Prism, Gaze of the Alnseer
                ["A"] = { 264507, 250256 },                                  -- Crucible of Erratic Energies, Heart of Wind
                ["B"] = { 260235, 249344, 249345, 251782, 250227, 251792, 250226, 250144 }, -- Umbral Plume, Light Company Guidon, Ranger-Captain's Iridescent Insignia, Withered Saptor's Paw, Kroluk's Warbanner, Glorious Crusader's Keepsake, Latch's Crooked Hook, Emberwing Feather
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 252420, 249343 },                                  -- Solarflare Prism, Gaze of the Alnseer
                ["A"] = { 264507, 260235, 250256, 249345 },                  -- Crucible of Erratic Energies, Umbral Plume, Heart of Wind, Ranger-Captain's Iridescent Insignia
                ["B"] = { 249344, 250227 },                                  -- Light Company Guidon, Kroluk's Warbanner
                ["C"] = { 249805, 251782 },                                  -- Undreamt God's Oozing Vestige, Withered Saptor's Paw
                ["D"] = {},
            },
        }
    },

    -- SUBTLETY (Spec ID: 261)
    [261] = {
        name = "Subtlety",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 408, -- Executioner: 2.45% finisher damage per point
        armorType = 2, -- Leather
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
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, MASTERY = 1.05, CRIT = 0.67, HASTE = 0.36, VERS = 0.32, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, MASTERY = 1.05, VERS = 0.79, CRIT = 0.74, HASTE = 0.69, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.94, HASTE = 0.88, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.96, VERS = 0.65, HASTE = 0.92, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 249343, 193701, 249344 },                          -- Gaze of the Alnseer, Algeth'ar Puzzle Box, Light Company Guidon
                ["A"] = { 252420 },                                          -- Solarflare Prism
                ["B"] = { 264507, 249806, 250256, 250144, 251782, 251792 },  -- Crucible of Erratic Energies, Radiant Plume, Heart of Wind, Emberwing Feather, Withered Saptor's Paw, Glorious Crusader's Keepsake
                ["C"] = { 248583, 250227 },                                  -- Drum of Renewed Bonds, Kroluk's Warbanner
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249344, 249343 },                                  -- Light Company Guidon, Gaze of the Alnseer
                ["A"] = { 193701, 252420 },                                  -- Algeth'ar Puzzle Box, Solarflare Prism
                ["B"] = { 264507, 249806, 250256, 250144 },                  -- Crucible of Erratic Energies, Radiant Plume, Heart of Wind, Emberwing Feather
                ["C"] = { 260235, 251782, 251792, 248583 },                  -- Umbral Plume, Withered Saptor's Paw, Glorious Crusader's Keepsake, Drum of Renewed Bonds
                ["D"] = {},
            },
        }
    },

    -- INITIAL (Spec ID: 1453)
    [1453] = {
        name = "Initial",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 800,
        armorType = 2,
        role = "LEVELING",
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [13] = true, -- Fist Weapons
            [15] = true, -- Daggers
        },
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Rogue Module Loaded.")
