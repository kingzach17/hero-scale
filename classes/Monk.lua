local _, playerClass = UnitClass("player")
if playerClass ~= "MONK" then return end

local _, Addon = ...

-- Ensure the table exists in the master object
Addon.ClassData["MONK"] = {
    -- WINDWALKER (Spec ID: 269)
    [269] = {
        name = "Windwalker",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 429, -- Combo Strikes: 2.33% damage for non-repeating abilities per point
        armorType = 2, -- Leather
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [13] = true, -- Fist Weapons
            [6]  = true, -- Polearms
            [10] = true, -- Staves
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, CRIT = 0.59, MASTERY = 0.56, VERS = 0.27, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.98, CRIT = 0.75, VERS = 0.63, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 1.01, MASTERY = 0.85, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.87, CRIT = 1.01, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 193701, 249343 },                                 -- Algeth'ar Puzzle Box, Gaze of the Alnseer
                ["A"] = { 252420, 250256, 264507 },                         -- Solarflare Prism, Heart of Wind, Crucible of Erratic Energies
                ["B"] = { 250144, 249806, 251792 },                         -- Emberwing Feather, Radiant Plume, Glorious Crusader's Keepsake
                ["C"] = { 250227, 248583 },                                 -- Kroluk's Warbanner, Drum of Renewed Bonds
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 193701, 249343 },                                 -- Algeth'ar Puzzle Box, Gaze of the Alnseer
                ["A"] = { 252420, 250256 },                                 -- Solarflare Prism, Heart of Wind
                ["B"] = { 264507, 249806, 250144, 249805 },                 -- Crucible of Erratic Energies, Radiant Plume, Emberwing Feather, Undreamt God's Oozing Vestige
                ["C"] = { 249344, 251792 },                                 -- Light Company Guidon, Glorious Crusader's Keepsake
                ["D"] = {},
            },
        }
    },

    -- BREWMASTER (Spec ID: 268)
    [268] = {
        name = "Brewmaster",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 1082, -- Elusive Brawler: 0.924% dodge + 1% AP per point
        armorType = 2, -- Leather
        role = "TANK",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [13] = true, -- Fist Weapons
            [6]  = true, -- Polearms
            [10] = true, -- Staves
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 3.00, CRIT = 1.05, VERS = 0.94, MASTERY = 0.36, HASTE = 0.35, STAMINA = 2.50, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Solo/Delves"]  = { PRIMARY = 1.20, VERS = 1.05, CRIT = 0.93, MASTERY = 0.57, HASTE = 0.46, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Mythic+"]      = { PRIMARY = 1.20, CRIT = 1.05, VERS = 0.84, MASTERY = 0.67, HASTE = 0.65, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Raid"]         = { PRIMARY = 1.20, CRIT = 1.05, VERS = 0.81, MASTERY = 0.71, HASTE = 0.65, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
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
                ["A"] = { 264507, 249339, 252418 },                         -- Crucible of Erratic Energies, Gloom-Spattered Dreadscale, Solar Core Igniter
                ["B"] = { 151312, 260235, 252421, 248583, 251792 },         -- Ampoule of Pure Void, Umbral Plume, Rotting Globule, Drum of Renewed Bonds, Glorious Crusader's Keepsake
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 252420, 249343 },                                 -- Solarflare Prism, Gaze of the Alnseer
                ["A"] = { 249339, 264507, 260235 },                         -- Gloom-Spattered Dreadscale, Crucible of Erratic Energies, Umbral Plume
                ["B"] = { 249345, 151312, 252418, 252421, 249805 },         -- Ranger-Captain's Iridescent Insignia, Ampoule of Pure Void, Solar Core Igniter, Rotting Globule, Undreamt God's Oozing Vestige
                ["C"] = {},
                ["D"] = {},
            },
        }
    },

    -- MISTWEAVER (Spec ID: 270)
    [270] = {
        name = "Mistweaver",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 500, -- Gust of Mists: increased healing per point
        armorType = 2, -- Leather
        role = "HEALER",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [13] = true, -- Fist Weapons
            [6]  = true, -- Polearms
            [10] = true, -- Staves
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 4.00, HASTE = 1.05, CRIT = 0.53, VERS = 0.40, MASTERY = 0.26, STAMINA = 2.00, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.60, HASTE = 1.05, CRIT = 0.66, VERS = 0.49, MASTERY = 0.41, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.60, HASTE = 1.05, CRIT = 0.92, VERS = 0.67, MASTERY = 0.65, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.60, HASTE = 1.05, CRIT = 0.93, VERS = 0.65, MASTERY = 0.65, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 250256, 249808, 264507 },                         -- Heart of Wind, Litany of Lightblind Wrath, Crucible of Erratic Energies
                ["A"] = { 249343, 250144, 249341 },                         -- Gaze of the Alnseer, Emberwing Feather, Volatile Void Suffuser
                ["B"] = { 251792, 250253, 248583, 250246, 193718, 50259 },  -- Glorious Crusader's Keepsake, Whisper of the Duskwraith, Drum of Renewed Bonds, Refueling Orb, Emerald Coach's Whistle, Nevermelting Ice Crystal
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249808, 250256 },                                 -- Litany of Lightblind Wrath, Heart of Wind
                ["A"] = { 249343, 264507, 249341, 250144 },                 -- Gaze of the Alnseer, Crucible of Erratic Energies, Volatile Void Suffuser, Emberwing Feather
                ["B"] = { 249811, 251792 },                                 -- Light of the Cosmic Crescendo, Glorious Crusader's Keepsake
                ["C"] = { 249809, 248583 },                                 -- Locus-Walker's Ribbon, Drum of Renewed Bonds
                ["D"] = {},
            },
        }
    },

    -- INITIAL (Spec ID: 1450)
    [1450] = {
        name = "Initial",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 800,
        armorType = 2, -- Leather
        role = "LEVELING",
        canUseOffhand = true,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [13] = true, -- Fist Weapons
            [6]  = true, -- Polearms
            [10] = true, -- Staves
        },
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Monk Module Loaded.")
