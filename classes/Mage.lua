local _, playerClass = UnitClass("player")
if playerClass ~= "MAGE" then return end

local _, Addon = ...

-- Ensure the table exists in the master object
Addon.ClassData["MAGE"] = {
    -- ARCANE (Spec ID: 62)
    [62] = {
        name = "Arcane",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 758, -- Savant: 1.32% mana regen & max mana per point
        armorType = 1, -- Cloth
        role = "CASTER_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true,
        allowedWeaponTypes = {
            [7]  = true, -- One-Handed Swords
            [15] = true, -- Daggers
            [10] = true, -- Staves
            [19] = true, -- Wands
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, MASTERY = 0.89, VERS = 0.46, CRIT = 0.45, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.81, VERS = 0.52, CRIT = 0.48, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 0.95, MASTERY = 1.05, VERS = 0.65, CRIT = 0.96, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 0.93, MASTERY = 1.05, VERS = 0.65, CRIT = 0.91, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 249346, 249343 },                                  -- Vaelgor's Final Stare, Gaze of the Alnseer
                ["A"] = { 250144, 250256, 264507 },                          -- Emberwing Feather, Heart of Wind, Crucible of Erratic Energies
                ["B"] = { 250223, 250258, 249809, 251792, 250257 },          -- Soulcatcher's Charm, Vessel of Tortured Souls, Locus-Walker's Ribbon, Glorious Crusader's Keepsake, Eye of the Drowning Void
                ["C"] = {},
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249346, 249343 },                                  -- Vaelgor's Final Stare, Gaze of the Alnseer
                ["A"] = { 250144, 250256, 264507 },                          -- Emberwing Feather, Heart of Wind, Crucible of Erratic Energies
                ["B"] = { 250223, 249809, 250258, 251792 },                  -- Soulcatcher's Charm, Locus-Walker's Ribbon, Vessel of Tortured Souls, Glorious Crusader's Keepsake
                ["C"] = { 249810 },                                          -- Shadow of the Empyrean Requiem
                ["D"] = {},
            },
        }
    },

    -- FIRE (Spec ID: 63)
    [63] = {
        name = "Fire",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 1786, -- Ignite: 0.56% additional DoT damage per point
        armorType = 1, -- Cloth
        role = "CASTER_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true,
        allowedWeaponTypes = {
            [7]  = true, -- One-Handed Swords
            [15] = true, -- Daggers
            [10] = true, -- Staves
            [19] = true, -- Wands
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, MASTERY = 0.80, VERS = 0.25, CRIT = 0.23, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.63, CRIT = 0.44, VERS = 0.38, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.92, VERS = 0.65, CRIT = 0.66, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.94, VERS = 0.65, CRIT = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["A"] = { 250256, 249343, 249346 },                          -- Heart of Wind, Gaze of the Alnseer, Vaelgor's Final Stare
                ["B"] = { 250223, 249809, 264507, 251792, 250258 },          -- Soulcatcher's Charm, Locus-Walker's Ribbon, Crucible of Erratic Energies, Glorious Crusader's Keepsake, Vessel of Tortured Souls
                ["C"] = { 250257 },                                          -- Eye of the Drowning Void
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 250144 },                                          -- Emberwing Feather
                ["A"] = { 249343, 249346, 250256, 249809 },                  -- Gaze of the Alnseer, Vaelgor's Final Stare, Heart of Wind, Locus-Walker's Ribbon
                ["B"] = { 250223 },                                          -- Soulcatcher's Charm
                ["C"] = { 251792, 249810, 264507, 250258 },                  -- Glorious Crusader's Keepsake, Shadow of the Empyrean Requiem, Crucible of Erratic Energies, Vessel of Tortured Souls
                ["D"] = {},
            },
        }
    },

    -- FROST (Spec ID: 64)
    [64] = {
        name = "Frost",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 800, -- Icicles: increased Icicle damage per point
        armorType = 1, -- Cloth
        role = "CASTER_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true,
        allowedWeaponTypes = {
            [7]  = true, -- One-Handed Swords
            [15] = true, -- Daggers
            [10] = true, -- Staves
            [19] = true, -- Wands
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, MASTERY = 1.05, HASTE = 1.04, CRIT = 0.74, VERS = 0.36, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.93, CRIT = 0.67, VERS = 0.45, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, MASTERY = 0.99, HASTE = 0.89, CRIT = 1.05, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 0.99, HASTE = 0.87, CRIT = 1.05, VERS = 0.65, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 249343, 249346 },                                  -- Gaze of the Alnseer, Vaelgor's Final Stare
                ["A"] = { 264507, 250144, 250256 },                          -- Crucible of Erratic Energies, Emberwing Feather, Heart of Wind
                ["B"] = { 250223, 249809, 251792, 248583, 250258 },          -- Soulcatcher's Charm, Locus-Walker's Ribbon, Glorious Crusader's Keepsake, Drum of Renewed Bonds, Vessel of Tortured Souls
                ["C"] = { 250257, 50259 },                                   -- Eye of the Drowning Void, Nevermelting Ice Crystal
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 249343, 249346 },                                  -- Gaze of the Alnseer, Vaelgor's Final Stare
                ["A"] = { 264507, 250144, 249809 },                          -- Crucible of Erratic Energies, Emberwing Feather, Locus-Walker's Ribbon
                ["B"] = { 250256, 250223, 251792, 248583 },                  -- Heart of Wind, Soulcatcher's Charm, Glorious Crusader's Keepsake, Drum of Renewed Bonds
                ["C"] = { 250258 },                                          -- Vessel of Tortured Souls
                ["D"] = {},
            },
        }
    },

    -- INITIAL (Spec ID: 1449)
    [1449] = {
        name = "Initial",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 800,
        armorType = 1,
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

print("|cff00ccffHero Scale:|r Mage Module Loaded.")
