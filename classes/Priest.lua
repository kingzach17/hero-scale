local _, playerClass = UnitClass("player")
if playerClass ~= "PRIEST" then return end

local _, Addon = ...

-- Priest weapon subclass IDs (shared across all specs)
local priestWeapons = {
    [15] = true, -- Daggers
    [4]  = true, -- One-Handed Maces
    [10] = true, -- Staves
    [19] = true, -- Wands
}

-- Ensure the table exists in the master object
Addon.ClassData["PRIEST"] = {
    -- DISCIPLINE (Spec ID: 256)
    [256] = {
        name = "Discipline",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 450, -- Grace: increased healing and damage on Atonement targets
        armorType = 1, -- Cloth
        role = "HEALER",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true,
        allowedWeaponTypes = priestWeapons,
        weights = {
            ["Leveling"]     = { PRIMARY = 4.00, HASTE = 1.05, MASTERY = 0.66, CRIT = 0.45, VERS = 0.39, STAMINA = 2.00, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.60, HASTE = 1.05, CRIT = 0.76, MASTERY = 0.76, VERS = 0.39, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.60, HASTE = 1.05, MASTERY = 0.80, CRIT = 0.95, VERS = 0.65, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.60, MASTERY = 0.79, HASTE = 1.05, CRIT = 0.92, VERS = 0.65, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 250256 },                                         -- Heart of Wind
                ["A"] = { 249343, 249808, 264507, 250144, 249346 },         -- Gaze of the Alnseer, Litany of Lightblind Wrath, Crucible of Erratic Energies, Emberwing Feather, Vaelgor's Final Stare
                ["B"] = { 249341, 193718, 249809, 250253 },                 -- Volatile Void Suffuser, Emerald Coach's Whistle, Locus-Walker's Ribbon, Whisper of the Duskwraith
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249343, 250256, 249808, 249346 },                 -- Gaze of the Alnseer, Heart of Wind, Litany of Lightblind Wrath, Vaelgor's Final Stare
                ["A"] = { 264507, 249341, 249809 },                         -- Crucible of Erratic Energies, Volatile Void Suffuser, Locus-Walker's Ribbon
                ["B"] = { 250144, 193718, 249811 },                         -- Emberwing Feather, Emerald Coach's Whistle, Light of the Cosmic Crescendo
                ["C"] = {},
                ["D"] = {},
            },
        }
    },

    -- HOLY (Spec ID: 257)
    [257] = {
        name = "Holy",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 580, -- Echo of Light: HoT on healed targets
        armorType = 1, -- Cloth
        role = "HEALER",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true,
        allowedWeaponTypes = priestWeapons,
        weights = {
            ["Leveling"]     = { PRIMARY = 4.00, HASTE = 1.05, MASTERY = 0.60, VERS = 0.58, CRIT = 0.57, STAMINA = 2.00, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.60, HASTE = 1.05, CRIT = 0.90, MASTERY = 0.79, VERS = 0.48, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.60, HASTE = 0.95, MASTERY = 0.74, VERS = 0.65, CRIT = 1.05, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.60, MASTERY = 0.83, CRIT = 1.05, HASTE = 0.85, VERS = 0.65, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 250256, 249808 },                                 -- Heart of Wind, Litany of Lightblind Wrath
                ["A"] = { 264507, 193718, 249343, 249809 },                 -- Crucible of Erratic Energies, Emerald Coach's Whistle, Gaze of the Alnseer, Locus-Walker's Ribbon
                ["B"] = { 250144, 250253, 249341, 250246 },                 -- Emberwing Feather, Whisper of the Duskwraith, Volatile Void Suffuser, Refueling Orb
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249808 },                                         -- Litany of Lightblind Wrath
                ["A"] = { 264507, 249343, 249809, 250256, 193718 },         -- Crucible of Erratic Energies, Gaze of the Alnseer, Locus-Walker's Ribbon, Heart of Wind, Emerald Coach's Whistle
                ["B"] = { 249346, 249811, 249341, 250144, 251792, 250253 }, -- Vaelgor's Final Stare, Light of the Cosmic Crescendo, Volatile Void Suffuser, Emberwing Feather, Glorious Crusader's Keepsake, Whisper of the Duskwraith
                ["C"] = {},
                ["D"] = {},
            },
        }
    },

    -- SHADOW (Spec ID: 258)
    [258] = {
        name = "Shadow",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 1090, -- Shadow Weaving: increased Shadow damage
        armorType = 1, -- Cloth
        role = "CASTER_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true,
        allowedWeaponTypes = priestWeapons,
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, MASTERY = 0.79, CRIT = 0.26, VERS = 0.26, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.98, CRIT = 0.58, VERS = 0.26, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.98, CRIT = 0.82, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 1.02, HASTE = 1.05, CRIT = 0.82, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 249343, 249346 },                                 -- Gaze of the Alnseer, Vaelgor's Final Stare
                ["A"] = { 250144, 250256, 264507, 250223 },                 -- Emberwing Feather, Heart of Wind, Crucible of Erratic Energies, Soulcatcher's Charm
                ["B"] = { 249809, 250258, 251792 },                         -- Locus-Walker's Ribbon, Vessel of Tortured Souls, Glorious Crusader's Keepsake
                ["C"] = { 248583, 250257, 249810 },                         -- Drum of Renewed Bonds, Eye of the Drowning Void, Shadow of the Empyrean Requiem
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249343, 249346 },                                 -- Gaze of the Alnseer, Vaelgor's Final Stare
                ["A"] = { 250144, 250256, 264507, 249809, 250223 },         -- Emberwing Feather, Heart of Wind, Crucible of Erratic Energies, Locus-Walker's Ribbon, Soulcatcher's Charm
                ["B"] = { 250258 },                                         -- Vessel of Tortured Souls
                ["C"] = { 249810, 251792 },                                 -- Shadow of the Empyrean Requiem, Glorious Crusader's Keepsake
                ["D"] = {},
            },
        }
    },

    -- INITIAL (Spec ID: 1452)
    [1452] = {
        name = "Initial",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 800,
        armorType = 1,
        role = "LEVELING",
        canUseOffhand = true,
        allowedWeaponTypes = priestWeapons,
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Priest Module Loaded.")
