local _, playerClass = UnitClass("player")
if playerClass ~= "SHAMAN" then return end

local _, Addon = ...

-- Ensure the table exists in the master object
Addon.ClassData["SHAMAN"] = {
    -- ELEMENTAL (Spec ID: 262)
    [262] = {
        name = "Elemental",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 1090, -- Elemental Overload: chance to duplicate spells
        armorType = 3, -- Mail
        role = "CASTER_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true, -- shield
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [15] = true, -- Daggers
            [13] = true, -- Fist Weapons
            [10] = true, -- Staves
            [1]  = true, -- Two-Handed Axes
            [5]  = true, -- Two-Handed Maces
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, MASTERY = 1.05, HASTE = 0.93, CRIT = 0.56, VERS = 0.30, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 1.03, CRIT = 0.63, VERS = 0.38, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, MASTERY = 1.05, HASTE = 0.84, CRIT = 0.90, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 1.05, HASTE = 0.83, CRIT = 0.90, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 250144, 249343, 250256 },              -- Emberwing Feather, Gaze of the Alnseer, Heart of Wind
                ["A"] = { 264507, 249346 },                       -- Crucible of Erratic Energies, Vaelgor's Final Stare
                ["B"] = { 249809, 250258, 251792 },               -- Locus-Walker's Ribbon, Vessel of Tortured Souls, Glorious Crusader's Keepsake
                ["C"] = { 248583, 250223 },                       -- Drum of Renewed Bonds, Soulcatcher's Charm
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 250144, 249343 },                       -- Emberwing Feather, Gaze of the Alnseer
                ["A"] = { 250256, 249346, 249809, 264507 },       -- Heart of Wind, Vaelgor's Final Stare, Locus-Walker's Ribbon, Crucible of Erratic Energies
                ["B"] = { 251792 },                               -- Glorious Crusader's Keepsake
                ["C"] = { 248583, 250258, 250223 },               -- Drum of Renewed Bonds, Vessel of Tortured Souls, Soulcatcher's Charm
                ["D"] = { 249810, 250257 },                       -- Shadow of the Empyrean Requiem, Eye of the Drowning Void
            },
        }
    },

    -- ENHANCEMENT (Spec ID: 263)
    [263] = {
        name = "Enhancement",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 875, -- Enhanced Elements: increased elemental damage
        armorType = 3, -- Mail
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [15] = true, -- Daggers
            [13] = true, -- Fist Weapons
            [10] = true, -- Staves
            [1]  = true, -- Two-Handed Axes
            [5]  = true, -- Two-Handed Maces
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, MASTERY = 0.87, CRIT = 0.27, VERS = 0.21, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.97, CRIT = 0.48, VERS = 0.27, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 0.94, MASTERY = 1.05, CRIT = 0.73, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 0.93, MASTERY = 1.05, CRIT = 0.72, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
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
                ["A"] = { 250256, 252420, 250144 },               -- Heart of Wind, Solarflare Prism, Emberwing Feather
                ["B"] = { 264507, 249806, 250258, 251792, 251782 }, -- Crucible of Erratic Energies, Radiant Plume, Vessel of Tortured Souls, Glorious Crusader's Keepsake, Withered Saptor's Paw
                ["C"] = { 248583, 250257 },                       -- Drum of Renewed Bonds, Eye of the Drowning Void
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 193701, 249343 },                       -- Algeth'ar Puzzle Box, Gaze of the Alnseer
                ["A"] = { 250256, 249806, 250144, 252420 },       -- Heart of Wind, Radiant Plume, Emberwing Feather, Solarflare Prism
                ["B"] = { 264507, 251792, 249344 },               -- Crucible of Erratic Energies, Glorious Crusader's Keepsake, Light Company Guidon
                ["C"] = { 250258 },                               -- Vessel of Tortured Souls
                ["D"] = {},
            },
        }
    },

    -- RESTORATION (Spec ID: 264)
    [264] = {
        name = "Restoration",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 600, -- Deep Healing: increased healing on low-health targets
        armorType = 3, -- Mail
        role = "HEALER",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true, -- shield
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [15] = true, -- Daggers
            [13] = true, -- Fist Weapons
            [10] = true, -- Staves
            [1]  = true, -- Two-Handed Axes
            [5]  = true, -- Two-Handed Maces
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 4.00, HASTE = 1.05, CRIT = 0.81, MASTERY = 0.52, VERS = 0.51, STAMINA = 2.00, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.60, HASTE = 1.05, CRIT = 0.99, VERS = 0.50, MASTERY = 0.46, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.60, HASTE = 0.76, CRIT = 1.05, MASTERY = 0.65, VERS = 0.67, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.60, HASTE = 0.72, CRIT = 1.05, VERS = 0.65, MASTERY = 0.66, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 264507 },                               -- Crucible of Erratic Energies
                ["A"] = { 250256, 249343, 193718, 250144 },       -- Heart of Wind, Gaze of the Alnseer, Emerald Coach's Whistle, Emberwing Feather
                ["B"] = { 250253, 249809, 249808, 250246, 248583 }, -- Whisper of the Duskwraith, Locus-Walker's Ribbon, Litany of Lightblind Wrath, Refueling Orb, Drum of Renewed Bonds
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 264507 },                               -- Crucible of Erratic Energies
                ["A"] = { 249343, 250256, 249809, 193718 },       -- Gaze of the Alnseer, Heart of Wind, Locus-Walker's Ribbon, Emerald Coach's Whistle
                ["B"] = { 249811, 250144, 249808, 250253, 248583, 249341, 251792 }, -- Light of the Cosmic Crescendo, Emberwing Feather, Litany of Lightblind Wrath, Whisper of the Duskwraith, Drum of Renewed Bonds, Volatile Void Suffuser, Glorious Crusader's Keepsake
                ["C"] = {},
                ["D"] = {},
            },
        }
    },

    -- INITIAL (Spec ID: 1444)
    [1444] = {
        name = "Initial",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 800,
        armorType = 3, -- Mail
        role = "LEVELING",
        canUseOffhand = true,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [13] = true, -- Fist Weapons
            [15] = true, -- Daggers
        },
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 4.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Shaman Module Loaded.")
