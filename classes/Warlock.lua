local _, playerClass = UnitClass("player")
if playerClass ~= "WARLOCK" then return end

local _, Addon = ...

-- Ensure the table exists in the master object
Addon.ClassData["WARLOCK"] = {
    -- AFFLICTION (Spec ID: 265)
    [265] = {
        name = "Affliction",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 400, -- Potent Afflictions
        armorType = 1, -- Cloth
        role = "CASTER_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true,
        allowedWeaponTypes = {
            [15] = true, -- Daggers
            [7]  = true, -- One-Handed Swords
            [10] = true, -- Staves
            [19] = true, -- Wands
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, MASTERY = 0.67, CRIT = 0.52, VERS = 0.25, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 0.84, MASTERY = 0.80, VERS = 0.26, STAMINA = 0.00, LEECH = 0.10, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.83, CRIT = 1.04, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 1.04, MASTERY = 0.83, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 250144 },                                          -- Emberwing Feather
                ["A"] = { 250256, 249343, 264507, 250223 },                  -- Heart of Wind, Gaze of the Alnseer, Crucible of Erratic Energies, Soulcatcher's Charm
                ["B"] = { 249346, 250258, 249809, 249810, 251792 },          -- Vaelgor's Final Stare, Vessel of Tortured Souls, Locus-Walker's Ribbon, Shadow of the Empyrean Requiem, Glorious Crusader's Keepsake
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 250144 },                                          -- Emberwing Feather
                ["A"] = { 249343, 250256, 250223, 264507 },                  -- Gaze of the Alnseer, Heart of Wind, Soulcatcher's Charm, Crucible of Erratic Energies
                ["B"] = { 249346, 249810, 249809 },                          -- Vaelgor's Final Stare, Shadow of the Empyrean Requiem, Locus-Walker's Ribbon
                ["C"] = { 251792, 250258, 248583, 249340 },                  -- Glorious Crusader's Keepsake, Vessel of Tortured Souls, Drum of Renewed Bonds, Wraps of Cosmic Madness
                ["D"] = {},
            },
        }
    },

    -- DEMONOLOGY (Spec ID: 266)
    [266] = {
        name = "Demonology",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 690, -- Master Demonologist
        armorType = 1, -- Cloth
        role = "CASTER_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true,
        allowedWeaponTypes = {
            [15] = true, -- Daggers
            [7]  = true, -- One-Handed Swords
            [10] = true, -- Staves
            [19] = true, -- Wands
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, CRIT = 0.66, MASTERY = 0.63, VERS = 0.22, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 0.83, MASTERY = 0.67, VERS = 0.30, STAMINA = 0.00, LEECH = 0.10, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 0.95, CRIT = 1.05, MASTERY = 0.77, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, CRIT = 1.05, HASTE = 0.96, MASTERY = 0.78, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 250144 },                                          -- Emberwing Feather
                ["A"] = { 250256, 249343, 264507 },                          -- Heart of Wind, Gaze of the Alnseer, Crucible of Erratic Energies
                ["B"] = { 249809, 249346, 250223 },                          -- Locus-Walker's Ribbon, Vaelgor's Final Stare, Soulcatcher's Charm
                ["C"] = { 251792, 248583, 250258 },                          -- Glorious Crusader's Keepsake, Drum of Renewed Bonds, Vessel of Tortured Souls
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 250144 },                                          -- Emberwing Feather
                ["A"] = { 249343, 250256, 264507, 249809 },                  -- Gaze of the Alnseer, Heart of Wind, Crucible of Erratic Energies, Locus-Walker's Ribbon
                ["B"] = { 249346 },                                          -- Vaelgor's Final Stare
                ["C"] = { 250223, 248583, 251792, 249810 },                  -- Soulcatcher's Charm, Drum of Renewed Bonds, Glorious Crusader's Keepsake, Shadow of the Empyrean Requiem
                ["D"] = {},
            },
        }
    },

    -- DESTRUCTION (Spec ID: 267)
    [267] = {
        name = "Destruction",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 1000, -- Chaotic Energies
        armorType = 1, -- Cloth
        role = "CASTER_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true,
        allowedWeaponTypes = {
            [15] = true, -- Daggers
            [7]  = true, -- One-Handed Swords
            [10] = true, -- Staves
            [19] = true, -- Wands
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, CRIT = 0.69, MASTERY = 0.59, VERS = 0.21, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 0.83, MASTERY = 0.74, VERS = 0.25, STAMINA = 0.00, LEECH = 0.10, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 1.01, MASTERY = 0.85, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 1.04, CRIT = 1.05, MASTERY = 0.88, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 249343 },                                          -- Gaze of the Alnseer
                ["A"] = { 250144, 250256, 249346, 264507, 250223 },          -- Emberwing Feather, Heart of Wind, Vaelgor's Final Stare, Crucible of Erratic Energies, Soulcatcher's Charm
                ["B"] = { 249809, 250258, 249810, 251792 },                  -- Locus-Walker's Ribbon, Vessel of Tortured Souls, Shadow of the Empyrean Requiem, Glorious Crusader's Keepsake
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249343 },                                          -- Gaze of the Alnseer
                ["A"] = { 249346, 250144, 250256, 249809, 264507 },          -- Vaelgor's Final Stare, Emberwing Feather, Heart of Wind, Locus-Walker's Ribbon, Crucible of Erratic Energies
                ["B"] = { 250223, 249810 },                                  -- Soulcatcher's Charm, Shadow of the Empyrean Requiem
                ["C"] = { 251792, 248583 },                                  -- Glorious Crusader's Keepsake, Drum of Renewed Bonds
                ["D"] = {},
            },
        }
    },

    -- INITIAL (Spec ID: 1454)
    [1454] = {
        name = "Initial",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 800,
        armorType = 1, -- Cloth
        role = "LEVELING",
        canUseOffhand = true,
        allowedWeaponTypes = {
            [7]  = true, -- One-Handed Swords
            [10] = true, -- Staves
            [15] = true, -- Daggers
            [19] = true, -- Wands
        },
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Warlock Module Loaded.")
