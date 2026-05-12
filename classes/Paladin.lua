local _, playerClass = UnitClass("player")
if playerClass ~= "PALADIN" then return end

local _, Addon = ...

-- Ensure the table exists in the master object
Addon.ClassData["PALADIN"] = {
    -- HOLY (Spec ID: 65)
    [65] = {
        name = "Holy",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 952, -- Lightbringer: increased healing based on proximity
        armorType = 4, -- Plate
        role = "HEALER",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true, -- shield
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
            ["Leveling"]     = { PRIMARY = 4.00, HASTE = 1.05, CRIT = 0.48, MASTERY = 0.47, VERS = 0.42, STAMINA = 2.00, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.60, HASTE = 1.05, CRIT = 0.76, MASTERY = 0.62, VERS = 0.37, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.60, HASTE = 1.05, CRIT = 0.81, MASTERY = 0.98, VERS = 0.65, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.60, HASTE = 1.00, MASTERY = 1.05, CRIT = 0.80, VERS = 0.65, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 250256, 249343 },                                  -- Heart of Wind, Gaze of the Alnseer
                ["A"] = { 264507, 193718, 249808, 250144 },                  -- Crucible of Erratic Energies, Emerald Coach's Whistle, Litany of Lightblind Wrath, Emberwing Feather
                ["B"] = { 249809, 249346, 250253, 251792, 249341 },          -- Locus-Walker's Ribbon, Vaelgor's Final Stare, Whisper of the Duskwraith, Glorious Crusader's Keepsake, Volatile Void Suffuser
                ["C"] = { 250258 },                                          -- Vessel of Tortured Souls
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249343, 250256 },                                  -- Gaze of the Alnseer, Heart of Wind
                ["A"] = { 264507, 249809, 249808, 249346, 193718 },          -- Crucible of Erratic Energies, Locus-Walker's Ribbon, Litany of Lightblind Wrath, Vaelgor's Final Stare, Emerald Coach's Whistle
                ["B"] = { 250144, 249341, 249811 },                          -- Emberwing Feather, Volatile Void Suffuser, Light of the Cosmic Crescendo
                ["C"] = { 251792, 250253 },                                  -- Glorious Crusader's Keepsake, Whisper of the Duskwraith
                ["D"] = {},
            },
        }
    },

    -- PROTECTION (Spec ID: 66)
    [66] = {
        name = "Protection",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 800, -- Divine Bulwark: increased block chance and attack power
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
            ["Leveling"]     = { PRIMARY = 3.00, HASTE = 1.05, MASTERY = 0.50, VERS = 0.45, CRIT = 0.30, STAMINA = 2.50, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.0, SOCKET_VALUE = 70 },
            ["Solo/Delves"]  = { PRIMARY = 1.20, HASTE = 1.05, CRIT = 0.92, MASTERY = 0.66, VERS = 0.35, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.0, SOCKET_VALUE = 70 },
            ["Mythic+"]      = { PRIMARY = 1.20, HASTE = 1.05, MASTERY = 0.74, VERS = 0.65, CRIT = 0.86, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.0, SOCKET_VALUE = 70 },
            ["Raid"]         = { PRIMARY = 1.20, HASTE = 1.05, CRIT = 0.84, MASTERY = 0.74, VERS = 0.65, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.0, SOCKET_VALUE = 70 },
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
                ["A"] = { 252420, 249342, 249343, 193701 },                  -- Solarflare Prism, Heart of Ancient Hunger, Gaze of the Alnseer, Algeth'ar Puzzle Box
                ["B"] = { 264507, 252418, 249339, 252421, 250242 },          -- Crucible of Erratic Energies, Solar Core Igniter, Gloom-Spattered Dreadscale, Rotting Globule, Jelly Replicator
                ["C"] = { 251792, 260235 },                                  -- Glorious Crusader's Keepsake, Umbral Plume
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249342, 249343 },                                  -- Heart of Ancient Hunger, Gaze of the Alnseer
                ["A"] = { 250256, 193701, 252420 },                          -- Heart of Wind, Algeth'ar Puzzle Box, Solarflare Prism
                ["B"] = { 249339, 249344, 260235, 264507 },                  -- Gloom-Spattered Dreadscale, Light Company Guidon, Umbral Plume, Crucible of Erratic Energies
                ["C"] = { 249807, 252418, 249805 },                          -- The Eternal Egg, Solar Core Igniter, Undreamt God's Oozing Vestige
                ["D"] = {},
            },
        }
    },

    -- RETRIBUTION (Spec ID: 70)
    [70] = {
        name = "Retribution",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 1180, -- Hand of Light: extra holy damage per point
        armorType = 4, -- Plate
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [1]  = true, -- Two-Handed Axes
            [5]  = true, -- Two-Handed Maces
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, MASTERY = 0.81, CRIT = 0.61, VERS = 0.23, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 7.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 1.03, HASTE = 1.00, VERS = 0.31, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 7.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 0.95, MASTERY = 1.05, CRIT = 1.00, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 7.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.97, HASTE = 0.92, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 7.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 193701 },                                          -- Algeth'ar Puzzle Box
                ["A"] = { 252420, 249343, 249342, 264507 },                  -- Solarflare Prism, Gaze of the Alnseer, Heart of Ancient Hunger, Crucible of Erratic Energies
                ["B"] = { 250256, 249806, 260235 },                          -- Heart of Wind, Radiant Plume, Umbral Plume
                ["C"] = { 251792, 250258 },                                  -- Glorious Crusader's Keepsake, Vessel of Tortured Souls
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 193701, 249342 },                                  -- Algeth'ar Puzzle Box, Heart of Ancient Hunger
                ["A"] = { 249343, 252420 },                                  -- Gaze of the Alnseer, Solarflare Prism
                ["B"] = { 249806, 264507, 260235, 250256 },                  -- Radiant Plume, Crucible of Erratic Energies, Umbral Plume, Heart of Wind
                ["C"] = { 251792, 248583 },                                  -- Glorious Crusader's Keepsake, Drum of Renewed Bonds
                ["D"] = {},
            },
        }
    },

    -- INITIAL (Spec ID: 1451)
    [1451] = {
        name = "Initial",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 800,
        armorType = 4, -- Plate
        role = "LEVELING",
        canUseOffhand = true,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [1]  = true, -- Two-Handed Axes
            [4]  = true, -- One-Handed Maces
            [5]  = true, -- Two-Handed Maces
            [6]  = true, -- Polearms
            [7]  = true, -- One-Handed Swords
            [8]  = true, -- Two-Handed Swords
        },
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Paladin Module Loaded.")
