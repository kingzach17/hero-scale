local _, playerClass = UnitClass("player")
if playerClass ~= "DRUID" then return end

local _, Addon = ...

-- Druid weapon subclass IDs (shared across all specs)
local druidWeapons = {
    [4]  = true, -- One-Handed Maces
    [15] = true, -- Daggers
    [13] = true, -- Fist Weapons
    [6]  = true, -- Polearms
    [10] = true, -- Staves
}

-- Ensure the table exists in the master object
Addon.ClassData["DRUID"] = {
    -- BALANCE (Spec ID: 102)
    [102] = {
        name = "Balance",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 780, -- Astral Invocation: increased Arcane and Nature damage
        armorType = 2, -- Leather
        role = "CASTER_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true,
        allowedWeaponTypes = druidWeapons,
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, MASTERY = 0.96, CRIT = 0.35, VERS = 0.25, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, MASTERY = 1.05, HASTE = 0.98, CRIT = 0.32, VERS = 0.30, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 0.98, MASTERY = 1.05, CRIT = 0.86, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 1.05, HASTE = 0.94, CRIT = 0.86, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = {},
                ["A"] = { 249346, 249343, 250256, 250144 },                    -- Vaelgor's Final Stare, Gaze of the Alnseer, Heart of Wind, Emberwing Feather
                ["B"] = { 264507, 250223, 249809, 251792, 250258, 250257, 248583 }, -- Crucible of Erratic Energies, Soulcatcher's Charm, Locus-Walker's Ribbon, Glorious Crusader's Keepsake, Vessel of Tortured Souls, Eye of the Drowning Void, Drum of Renewed Bonds
                ["C"] = { 251785 },                                            -- Void-Reaper's Libram
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = {},
                ["A"] = { 249346, 249343, 250256, 264507, 250144, 249809 },    -- Vaelgor's Final Stare, Gaze of the Alnseer, Heart of Wind, Crucible of Erratic Energies, Emberwing Feather, Locus-Walker's Ribbon
                ["B"] = { 250223, 251792 },                                    -- Soulcatcher's Charm, Glorious Crusader's Keepsake
                ["C"] = { 248583, 249810 },                                    -- Drum of Renewed Bonds, Shadow of the Empyrean Requiem
                ["D"] = {},
            },
        }
    },

    -- FERAL (Spec ID: 103)
    [103] = {
        name = "Feral",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 1540, -- Razor Claws: increased bleed damage
        armorType = 2, -- Leather
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = druidWeapons,
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, MASTERY = 1.05, HASTE = 0.56, CRIT = 0.44, VERS = 0.18, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, MASTERY = 1.05, HASTE = 0.79, CRIT = 0.52, VERS = 0.36, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, MASTERY = 1.05, HASTE = 0.92, CRIT = 0.83, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 1.05, HASTE = 0.94, CRIT = 0.84, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
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
                ["S"] = {},
                ["A"] = { 193701, 249343, 250256, 252420, 264507 },            -- Algeth'ar Puzzle Box, Gaze of the Alnseer, Heart of Wind, Solarflare Prism, Crucible of Erratic Energies
                ["B"] = { 249806, 250144, 251792, 250258 },                    -- Radiant Plume, Emberwing Feather, Glorious Crusader's Keepsake, Vessel of Tortured Souls
                ["C"] = { 250227 },                                            -- Kroluk's Warbanner
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 193701, 249343 },                                    -- Algeth'ar Puzzle Box, Gaze of the Alnseer
                ["A"] = { 250256, 249806, 252420, 264507 },                    -- Heart of Wind, Radiant Plume, Solarflare Prism, Crucible of Erratic Energies
                ["B"] = { 250144, 251792, 250227, 249805 },                    -- Emberwing Feather, Glorious Crusader's Keepsake, Kroluk's Warbanner, Undreamt God's Oozing Vestige
                ["C"] = {},
                ["D"] = {},
            },
        }
    },

    -- GUARDIAN (Spec ID: 104)
    [104] = {
        name = "Guardian",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 750, -- Nature's Guardian: increased armor and attack power
        armorType = 2, -- Leather
        role = "TANK",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = druidWeapons,
        weights = {
            ["Leveling"]     = { PRIMARY = 3.00, HASTE = 1.05, VERS = 0.67, MASTERY = 0.50, CRIT = 0.25, STAMINA = 2.50, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Solo/Delves"]  = { PRIMARY = 1.20, HASTE = 1.05, VERS = 0.72, MASTERY = 0.64, CRIT = 0.40, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Mythic+"]      = { PRIMARY = 1.20, HASTE = 1.05, VERS = 0.67, MASTERY = 0.71, CRIT = 0.65, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Raid"]         = { PRIMARY = 1.20, HASTE = 1.05, VERS = 0.65, MASTERY = 0.71, CRIT = 0.65, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
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
                ["S"] = {},
                ["A"] = { 250256, 250144, 193701, 249343 },                    -- Heart of Wind, Emberwing Feather, Algeth'ar Puzzle Box, Gaze of the Alnseer
                ["B"] = { 264507, 252420, 249339, 252418, 250242, 251792 },    -- Crucible of Erratic Energies, Solarflare Prism, Gloom-Spattered Dreadscale, Solar Core Igniter, Jelly Replicator, Glorious Crusader's Keepsake
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = {},
                ["A"] = { 193701, 249343, 250256, 250144, 249339 },            -- Algeth'ar Puzzle Box, Gaze of the Alnseer, Heart of Wind, Emberwing Feather, Gloom-Spattered Dreadscale
                ["B"] = { 264507, 252420, 249807, 260235, 249805 },            -- Crucible of Erratic Energies, Solarflare Prism, The Eternal Egg, Umbral Plume, Undreamt God's Oozing Vestige
                ["C"] = {},
                ["D"] = {},
            },
        }
    },

    -- RESTORATION (Spec ID: 105)
    [105] = {
        name = "Restoration",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 652, -- Harmony: increased healing on targets with HoTs
        armorType = 2, -- Leather
        role = "HEALER",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true,
        allowedWeaponTypes = druidWeapons,
        weights = {
            ["Leveling"]     = { PRIMARY = 4.00, HASTE = 1.05, MASTERY = 0.85, VERS = 0.33, CRIT = 0.21, STAMINA = 2.00, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.60, HASTE = 1.05, MASTERY = 0.80, VERS = 0.41, CRIT = 0.24, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.60, HASTE = 1.05, MASTERY = 0.97, VERS = 0.66, CRIT = 0.65, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.60, HASTE = 1.05, MASTERY = 0.97, VERS = 0.65, CRIT = 0.65, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
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
                ["S"] = {},
                ["A"] = { 250256, 249343, 193718, 250144, 249809 },            -- Heart of Wind, Gaze of the Alnseer, Emerald Coach's Whistle, Emberwing Feather, Locus-Walker's Ribbon
                ["B"] = { 249341, 249346, 264507, 251792, 250253, 249808, 250258 }, -- Volatile Void Suffuser, Vaelgor's Final Stare, Crucible of Erratic Energies, Glorious Crusader's Keepsake, Whisper of the Duskwraith, Litany of Lightblind Wrath, Vessel of Tortured Souls
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = {},
                ["A"] = { 250256, 249343, 249809, 249341, 193718, 249346, 250144 }, -- Heart of Wind, Gaze of the Alnseer, Locus-Walker's Ribbon, Volatile Void Suffuser, Emerald Coach's Whistle, Vaelgor's Final Stare, Emberwing Feather
                ["B"] = { 264507, 251792, 249808 },                            -- Crucible of Erratic Energies, Glorious Crusader's Keepsake, Litany of Lightblind Wrath
                ["C"] = {},
                ["D"] = {},
            },
        }
    },

    -- INITIAL (Spec ID: 1447)
    [1447] = {
        name = "Initial",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 800,
        armorType = 2, -- Leather
        role = "LEVELING",
        canUseOffhand = true,
        allowedWeaponTypes = {
            [4]  = true, -- One-Handed Maces
            [6]  = true, -- Polearms
            [10] = true, -- Staves
            [13] = true, -- Fist Weapons
            [15] = true, -- Daggers
        },
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Druid Module Loaded.")
