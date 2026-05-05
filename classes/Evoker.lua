local _, playerClass = UnitClass("player")
if playerClass ~= "EVOKER" then return end

local _, Addon = ...

-- Evoker weapon subclass IDs (shared across all specs — only fist weapons, daggers, staves, swords, axes, maces)
local evokerWeapons = {
    [0]  = true, -- One-Handed Axes
    [4]  = true, -- One-Handed Maces
    [7]  = true, -- One-Handed Swords
    [15] = true, -- Daggers
    [13] = true, -- Fist Weapons
    [10] = true, -- Staves
}

-- Ensure the table exists in the master object
Addon.ClassData["EVOKER"] = {
    -- DEVASTATION (Spec ID: 1467)
    [1467] = {
        name = "Devastation",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 1530, -- Gigaflame: increased empower spell damage
        armorType = 3, -- Mail
        role = "CASTER_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true,
        allowedWeaponTypes = evokerWeapons,
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, CRIT = 1.05, HASTE = 1.05, MASTERY = 0.66, VERS = 0.34, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 0.90, MASTERY = 0.56, VERS = 0.28, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, CRIT = 1.05, HASTE = 0.88, MASTERY = 0.77, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 0.87, CRIT = 1.05, MASTERY = 0.78, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 250256, 249346 },                                  -- Heart of Wind, Vaelgor's Final Stare
                ["A"] = { 264507, 249343, 250144, 250223, 249809 },          -- Crucible of Erratic Energies, Gaze of the Alnseer, Emberwing Feather, Soulcatcher's Charm, Locus-Walker's Ribbon
                ["B"] = { 248583, 249810, 251792 },                          -- Drum of Renewed Bonds, Shadow of the Empyrean Requiem, Glorious Crusader's Keepsake
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249346, 249343 },                                  -- Vaelgor's Final Stare, Gaze of the Alnseer
                ["A"] = { 264507, 250223, 250256, 250144, 249809 },          -- Crucible of Erratic Energies, Soulcatcher's Charm, Heart of Wind, Emberwing Feather, Locus-Walker's Ribbon
                ["B"] = { 249810, 251792 },                                  -- Shadow of the Empyrean Requiem, Glorious Crusader's Keepsake
                ["C"] = { 248583, 250258, 250257 },                          -- Drum of Renewed Bonds, Vessel of Tortured Souls, Eye of the Drowning Void
                ["D"] = {},
            },
        }
    },

    -- AUGMENTATION (Spec ID: 1473)
    [1473] = {
        name = "Augmentation",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 950, -- Timewalker's Mastery: increased ally buff potency
        armorType = 3, -- Mail
        role = "CASTER_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true,
        allowedWeaponTypes = evokerWeapons,
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, CRIT = 0.84, MASTERY = 0.73, VERS = 0.21, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 0.78, MASTERY = 0.74, VERS = 0.30, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 0.89, CRIT = 1.05, MASTERY = 0.72, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 0.89, CRIT = 1.05, MASTERY = 0.73, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 250256, 264507 },                                  -- Heart of Wind, Crucible of Erratic Energies
                ["A"] = { 250223, 249343, 250144 },                          -- Soulcatcher's Charm, Gaze of the Alnseer, Emberwing Feather
                ["B"] = { 249346, 249810, 248583, 249809 },                  -- Vaelgor's Final Stare, Shadow of the Empyrean Requiem, Drum of Renewed Bonds, Locus-Walker's Ribbon
                ["C"] = { 50259 },                                           -- Nevermelting Ice Crystal
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 250256, 250223 },                                  -- Heart of Wind, Soulcatcher's Charm
                ["A"] = { 264507, 249346, 249343, 249810, 250144 },          -- Crucible of Erratic Energies, Vaelgor's Final Stare, Gaze of the Alnseer, Shadow of the Empyrean Requiem, Emberwing Feather
                ["B"] = { 249809, 248583 },                                  -- Locus-Walker's Ribbon, Drum of Renewed Bonds
                ["C"] = { 251792 },                                          -- Glorious Crusader's Keepsake
                ["D"] = {},
            },
        }
    },

    -- PRESERVATION (Spec ID: 1468)
    [1468] = {
        name = "Preservation",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 780, -- Life-Binder's Loom: increased healing over time
        armorType = 3, -- Mail
        role = "HEALER",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true,
        allowedWeaponTypes = evokerWeapons,
        weights = {
            ["Leveling"]     = { PRIMARY = 4.00, HASTE = 1.05, CRIT = 0.73, MASTERY = 0.63, VERS = 0.56, STAMINA = 2.00, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.60, HASTE = 1.05, MASTERY = 0.78, CRIT = 0.67, VERS = 0.31, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.60, HASTE = 0.99, CRIT = 0.97, MASTERY = 1.05, VERS = 0.65, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.60, MASTERY = 1.05, HASTE = 0.86, CRIT = 0.87, VERS = 0.65, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 250256, 249343 },                                              -- Heart of Wind, Gaze of the Alnseer
                ["A"] = { 264507, 193718, 249809, 250144, 249808, 249346 },              -- Crucible of Erratic Energies, Emerald Coach's Whistle, Locus-Walker's Ribbon, Emberwing Feather, Litany of Lightblind Wrath, Vaelgor's Final Stare
                ["B"] = { 251792, 249341, 250223, 250258 },                              -- Glorious Crusader's Keepsake, Volatile Void Suffuser, Soulcatcher's Charm, Vessel of Tortured Souls
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249343, 264507 },                                              -- Gaze of the Alnseer, Crucible of Erratic Energies
                ["A"] = { 249809, 250256, 249346, 193718, 249808 },                      -- Locus-Walker's Ribbon, Heart of Wind, Vaelgor's Final Stare, Emerald Coach's Whistle, Litany of Lightblind Wrath
                ["B"] = { 249341, 250144, 251792 },                                      -- Volatile Void Suffuser, Emberwing Feather, Glorious Crusader's Keepsake
                ["C"] = {},
                ["D"] = {},
            },
        }
    },

    -- INITIAL (Spec ID: 1465)
    [1465] = {
        name = "Initial",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 800,
        armorType = 3, -- Mail
        role = "LEVELING",
        canUseOffhand = true,
        allowedWeaponTypes = evokerWeapons,
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Evoker Module Loaded.")
