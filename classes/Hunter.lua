local _, playerClass = UnitClass("player")
if playerClass ~= "HUNTER" then return end

local _, Addon = ...

-- Ensure the table exists in the master object
Addon.ClassData["HUNTER"] = {
    -- BEAST MASTERY (Spec ID: 253)
    [253] = {
        name = "Beast Mastery",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 526, -- Master of Beasts
        armorType = 3, -- Mail
        role = "RANGED_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [7]  = true, -- One-Handed Swords
            [1]  = true, -- Two-Handed Axes
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
            [10] = true, -- Staves
            [2]  = true, -- Bows
            [3]  = true, -- Guns
            [18] = true, -- Crossbows
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, CRIT = 1.05, MASTERY = 0.80, HASTE = 0.70, VERS = 0.32, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 0.98, MASTERY = 0.54, VERS = 0.35, STAMINA = 0.00, LEECH = 0.10, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, CRIT = 1.05, MASTERY = 0.98, HASTE = 0.82, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 0.86, CRIT = 1.04, VERS = 0.65, MASTERY = 1.05, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 193701, 252420 },                       -- Algeth'ar Puzzle Box, Solarflare Prism
                ["A"] = { 249343, 264507, 249806 },               -- Gaze of the Alnseer, Crucible of Erratic Energies, Radiant Plume
                ["B"] = { 250144, 250256, 251792, 250258, 248583 }, -- Emberwing Feather, Heart of Wind, Glorious Crusader's Keepsake, Vessel of Tortured Souls, Drum of Renewed Bonds
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 193701, 249343 },                       -- Algeth'ar Puzzle Box, Gaze of the Alnseer
                ["A"] = { 252420, 249806, 264507 },               -- Solarflare Prism, Radiant Plume, Crucible of Erratic Energies
                ["B"] = { 250144, 250256, 251792 },               -- Emberwing Feather, Heart of Wind, Glorious Crusader's Keepsake
                ["C"] = { 249344, 248583, 249345, 250258 },       -- Light Company Guidon, Drum of Renewed Bonds, Ranger-Captain's Iridescent Insignia, Vessel of Tortured Souls
                ["D"] = {},
            },
        }
    },

    -- MARKSMANSHIP (Spec ID: 254)
    [254] = {
        name = "Marksmanship",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 714, -- Sniper Training
        armorType = 3, -- Mail
        role = "RANGED_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [7]  = true, -- One-Handed Swords
            [1]  = true, -- Two-Handed Axes
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
            [10] = true, -- Staves
            [2]  = true, -- Bows
            [3]  = true, -- Guns
            [18] = true, -- Crossbows
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, MASTERY = 1.05, CRIT = 0.97, HASTE = 0.69, VERS = 0.24, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, CRIT = 1.05, MASTERY = 0.60, HASTE = 0.59, VERS = 0.25, STAMINA = 0.00, LEECH = 0.10, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, MASTERY = 0.82, CRIT = 1.05, HASTE = 0.76, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, CRIT = 1.05, MASTERY = 0.84, HASTE = 0.76, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 193701, 252420 },                       -- Algeth'ar Puzzle Box, Solarflare Prism
                ["A"] = { 264507, 260235, 249343 },               -- Crucible of Erratic Energies, Umbral Plume, Gaze of the Alnseer
                ["B"] = { 250144, 249806, 250256, 249345, 250258 }, -- Emberwing Feather, Radiant Plume, Heart of Wind, Ranger-Captain's Iridescent Insignia, Vessel of Tortured Souls
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 193701, 252420 },                       -- Algeth'ar Puzzle Box, Solarflare Prism
                ["A"] = { 260235, 249343, 264507 },               -- Umbral Plume, Gaze of the Alnseer, Crucible of Erratic Energies
                ["B"] = { 249806, 250144, 249345 },               -- Radiant Plume, Emberwing Feather, Ranger-Captain's Iridescent Insignia
                ["C"] = { 250256, 249805, 251792, 249344 },       -- Heart of Wind, Undreamt God's Oozing Vestige, Glorious Crusader's Keepsake, Light Company Guidon
                ["D"] = {},
            },
        }
    },

    -- SURVIVAL (Spec ID: 255)
    [255] = {
        name = "Survival",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 588, -- Spirit Bond
        armorType = 3, -- Mail
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [7]  = true, -- One-Handed Swords
            [1]  = true, -- Two-Handed Axes
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
            [10] = true, -- Staves
            [2]  = true, -- Bows
            [3]  = true, -- Guns
            [18] = true, -- Crossbows
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, MASTERY = 1.05, CRIT = 0.60, HASTE = 0.58, VERS = 0.17, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.98, HASTE = 0.79, VERS = 0.27, STAMINA = 0.00, LEECH = 0.10, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.96, HASTE = 0.85, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.93, HASTE = 0.84, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 193701, 249343 },                       -- Algeth'ar Puzzle Box, Gaze of the Alnseer
                ["A"] = { 252420, 249806 },                       -- Solarflare Prism, Radiant Plume
                ["B"] = { 250256, 264507, 250144, 251792, 251782 }, -- Heart of Wind, Crucible of Erratic Energies, Emberwing Feather, Glorious Crusader's Keepsake, Withered Saptor's Paw
                ["C"] = { 250258 },                               -- Vessel of Tortured Souls
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 193701, 249343 },                       -- Algeth'ar Puzzle Box, Gaze of the Alnseer
                ["A"] = { 249806, 252420 },                       -- Radiant Plume, Solarflare Prism
                ["B"] = { 250256, 264507, 251792, 250144 },       -- Heart of Wind, Crucible of Erratic Energies, Glorious Crusader's Keepsake, Emberwing Feather
                ["C"] = { 248583, 251782, 171646 },               -- Drum of Renewed Bonds, Withered Saptor's Paw, Matrix Restabilizer
                ["D"] = { 249345 },                               -- Ranger-Captain's Iridescent Insignia
            },
        }
    },

    -- INITIAL (Spec ID: 1448)
    [1448] = {
        name = "Initial",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 800,
        armorType = 3,
        role = "LEVELING",
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [1]  = true, -- Two-Handed Axes
            [2]  = true, -- Bows
            [3]  = true, -- Guns
            [6]  = true, -- Polearms
            [7]  = true, -- One-Handed Swords
            [8]  = true, -- Two-Handed Swords
            [10] = true, -- Staves
            [18] = true, -- Crossbows
        },
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Hunter Module Loaded.")
