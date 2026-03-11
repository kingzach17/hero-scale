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
            ["Mythic+"]      = { PRIMARY = 1.50, CRIT = 1.05, HASTE = 1.05, MASTERY = 0.66, VERS = 0.34, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 0.93, MASTERY = 0.63, VERS = 0.23, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 242402, 242395, 242392 },              -- Araz's Ritual Forge, Astral Antenna, Diamantine Voidcore
                ["A"] = { 242497, 219308, 242494, 190958, 242399, 219314, 242398, 232545, 219312 }, -- Azhiccaran Parapodia, Signet of the Priory, Lily of the Eternal Weave, So'leah's Secret Technique, Screams of a Forgotten Sky, Ara-Kara Sacbrood, Naazindhri's Mystic Lash, Gigazap's Zap-Cap, Empowering Crystal of Anub'ikkaj
                ["B"] = { 246945, 185846, 219317, 238390 },      -- Incorporeal Essence-Gorger, Miniscule Mailemental in an Envelope, Harvester's Edict, Soulbreaker's Sigil
                ["C"] = { 238386, 219313 },                      -- Void-Touched Fragment, Mereldar's Toll
                ["D"] = { 242403 },                              -- Perfidious Projector
            },
            ["Raid"] = {
                ["S"] = { 242402, 242395, 242392 },              -- Araz's Ritual Forge, Astral Antenna, Diamantine Voidcore
                ["A"] = { 242497, 219308, 242494, 190958, 242399, 219314, 242398, 232545, 219312 }, -- Azhiccaran Parapodia, Signet of the Priory, Lily of the Eternal Weave, So'leah's Secret Technique, Screams of a Forgotten Sky, Ara-Kara Sacbrood, Naazindhri's Mystic Lash, Gigazap's Zap-Cap, Empowering Crystal of Anub'ikkaj
                ["B"] = { 246945, 185846, 219317, 238390 },      -- Incorporeal Essence-Gorger, Miniscule Mailemental in an Envelope, Harvester's Edict, Soulbreaker's Sigil
                ["C"] = { 238386, 219313 },                      -- Void-Touched Fragment, Mereldar's Toll
                ["D"] = { 242403 },                              -- Perfidious Projector
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
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 0.84, MASTERY = 0.73, VERS = 0.21, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 0.90, MASTERY = 0.77, VERS = 0.26, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 242494, 242399, 242402, 242395, 242497, 242392 }, -- Lily of the Eternal Weave, Screams of a Forgotten Sky, Araz's Ritual Forge, Astral Antenna, Azhiccaran Parapodia, Diamantine Voidcore
                ["A"] = { 242398, 219313, 219308, 246945, 219312, 190958, 219314 }, -- Naazindhri's Mystic Lash, Mereldar's Toll, Signet of the Priory, Incorporeal Essence-Gorger, Empowering Crystal of Anub'ikkaj, So'leah's Secret Technique, Ara-Kara Sacbrood
                ["B"] = { 232545, 219317, 238386 },               -- Gigazap's Zap-Cap, Harvester's Edict, Void-Touched Fragment
                ["C"] = { 238390, 185846 },                       -- Soulbreaker's Sigil, Miniscule Mailemental in an Envelope
                ["D"] = { 242403 },                              -- Perfidious Projector
            },
            ["Raid"] = {
                ["S"] = { 242494, 242399, 242402, 242395, 242497, 242392 }, -- Lily of the Eternal Weave, Screams of a Forgotten Sky, Araz's Ritual Forge, Astral Antenna, Azhiccaran Parapodia, Diamantine Voidcore
                ["A"] = { 242398, 219313, 219308, 246945, 219312, 190958, 219314 }, -- Naazindhri's Mystic Lash, Mereldar's Toll, Signet of the Priory, Incorporeal Essence-Gorger, Empowering Crystal of Anub'ikkaj, So'leah's Secret Technique, Ara-Kara Sacbrood
                ["B"] = { 232545, 219317, 238386 },               -- Gigazap's Zap-Cap, Harvester's Edict, Void-Touched Fragment
                ["C"] = { 238390, 185846 },                       -- Soulbreaker's Sigil, Miniscule Mailemental in an Envelope
                ["D"] = { 242403 },                              -- Perfidious Projector
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
            ["Mythic+"]      = { PRIMARY = 1.60, HASTE = 1.05, CRIT = 0.73, MASTERY = 0.63, VERS = 0.56, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.60, MASTERY = 1.05, HASTE = 0.86, CRIT = 0.59, VERS = 0.25, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 242393, 242400 },                      -- Loom'ithar's Living Silk, Nexus-King's Command
                ["A"] = { 242395, 242392, 219312, 190958, 242494 }, -- Astral Antenna, Diamantine Voidcore, Empowering Crystal of Anub'ikkaj, So'leah's Secret Technique, Lily of the Eternal Weave
                ["B"] = {},
                ["C"] = { 238386, 246940 },                      -- Void-Touched Fragment, Manaforged Aethercell
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 242400 },                              -- Nexus-King's Command
                ["A"] = { 242395, 242392, 242393, 219312, 190958 }, -- Astral Antenna, Diamantine Voidcore, Loom'ithar's Living Silk, Empowering Crystal of Anub'ikkaj, So'leah's Secret Technique
                ["B"] = { 242494 },                              -- Lily of the Eternal Weave
                ["C"] = { 238386 },                              -- Void-Touched Fragment
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
