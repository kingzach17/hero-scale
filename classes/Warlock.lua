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
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.67, CRIT = 0.52, VERS = 0.25, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 1.01, MASTERY = 0.97, VERS = 0.29, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 242497 }, -- Azhiccaran Parapodia (AoE scaling)
                ["A"] = { 242395, 242402 }, -- Astral Antenna, Araz's Ritual Forge
                ["B"] = { 242392 }, -- Diamantine Voidcore
                ["C"] = { 219308 }, -- Signet of the Priory
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 242395 }, -- Astral Antenna (ST BiS Passive)
                ["A"] = { 242402, 242497 }, -- Araz's Ritual Forge, Azhiccaran Parapodia
                ["B"] = { 242392 }, -- Diamantine Voidcore
                ["C"] = { 219308 }, -- Signet of the Priory
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
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 0.66, MASTERY = 0.63, VERS = 0.22, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, CRIT = 1.05, HASTE = 0.99, MASTERY = 0.96, VERS = 0.31, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 242497 }, -- Azhiccaran Parapodia (AoE scaling)
                ["A"] = { 242395, 242402 }, -- Astral Antenna, Araz's Ritual Forge
                ["B"] = { 242392 }, -- Diamantine Voidcore
                ["C"] = { 219308 }, -- Signet of the Priory
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 242395 }, -- Astral Antenna (ST BiS Passive)
                ["A"] = { 242497, 242402 }, -- Azhiccaran Parapodia, Araz's Ritual Forge
                ["B"] = { 242392 }, -- Diamantine Voidcore
                ["C"] = { 219308 }, -- Signet of the Priory
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
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 0.69, MASTERY = 0.59, VERS = 0.21, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 0.94, MASTERY = 0.90, VERS = 0.26, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 242497 }, -- Azhiccaran Parapodia (AoE scaling)
                ["A"] = { 242395 }, -- Astral Antenna
                ["B"] = { 242392, 242400 }, -- Diamantine Voidcore, Nexus-King's Command
                ["C"] = { 219308 }, -- Signet of the Priory
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 242497, 242395 }, -- Azhiccaran Parapodia, Astral Antenna (dual passive BiS)
                ["A"] = { 242400 }, -- Nexus-King's Command (burst encounters)
                ["B"] = { 242392 }, -- Diamantine Voidcore
                ["C"] = { 219308 }, -- Signet of the Priory
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
