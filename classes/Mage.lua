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
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.89, VERS = 0.46, CRIT = 0.45, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.73, VERS = 0.63, CRIT = 0.44, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 242395, 242497, 242392 },             -- Astral Antenna, Azhiccaran Parapodia, Diamantine Voidcore
                ["A"] = { 219308, 219314, 242494, 190958, 219312, 242398, 242402 }, -- Signet of the Priory, Ara-Kara Sacbrood, Lily of the Eternal Weave, So'leah's Secret Technique, Empowering Crystal of Anub'ikkaj, Naazindhri's Mystic Lash, Araz's Ritual Forge
                ["B"] = { 232545, 242399, 246945, 185846 },     -- Gigazap's Zap-Cap, Screams of a Forgotten Sky, Incorporeal Essence-Gorger, Miniscule Mailemental in an Envelope
                ["C"] = { 219317, 238390 },                     -- Harvester's Edict, Soulbreaker's Sigil
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 242395, 242497, 242392 },             -- Astral Antenna, Azhiccaran Parapodia, Diamantine Voidcore
                ["A"] = { 219308, 219314, 242494, 190958, 219312, 242398, 242402 }, -- Signet of the Priory, Ara-Kara Sacbrood, Lily of the Eternal Weave, So'leah's Secret Technique, Empowering Crystal of Anub'ikkaj, Naazindhri's Mystic Lash, Araz's Ritual Forge
                ["B"] = { 232545, 242399, 246945, 185846 },     -- Gigazap's Zap-Cap, Screams of a Forgotten Sky, Incorporeal Essence-Gorger, Miniscule Mailemental in an Envelope
                ["C"] = { 219317, 238390 },                     -- Harvester's Edict, Soulbreaker's Sigil
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
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.80, VERS = 0.25, CRIT = 0.23, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.56, VERS = 0.41, CRIT = 0.41, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 219308, 242402, 242395, 242392 },    -- Signet of the Priory, Araz's Ritual Forge, Astral Antenna, Diamantine Voidcore
                ["A"] = { 242497, 219314, 242494, 190958, 219312 }, -- Azhiccaran Parapodia, Ara-Kara Sacbrood, Lily of the Eternal Weave, So'leah's Secret Technique, Empowering Crystal of Anub'ikkaj
                ["B"] = { 242398, 232545, 242399, 246945, 185846 }, -- Naazindhri's Mystic Lash, Gigazap's Zap-Cap, Screams of a Forgotten Sky, Incorporeal Essence-Gorger, Miniscule Mailemental in an Envelope
                ["C"] = { 219317, 238390 },                     -- Harvester's Edict, Soulbreaker's Sigil
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 242392, 242399, 242402 },             -- Diamantine Voidcore, Screams of a Forgotten Sky, Araz's Ritual Forge
                ["A"] = { 242497, 219308, 242395, 219314, 242494, 190958, 219312, 242398 }, -- Azhiccaran Parapodia, Signet of the Priory, Astral Antenna, Ara-Kara Sacbrood, Lily of the Eternal Weave, So'leah's Secret Technique, Empowering Crystal of Anub'ikkaj, Naazindhri's Mystic Lash
                ["B"] = { 232545, 246945, 185846, 219317, 238390 }, -- Gigazap's Zap-Cap, Incorporeal Essence-Gorger, Miniscule Mailemental in an Envelope, Harvester's Edict, Soulbreaker's Sigil
                ["C"] = {},
                ["D"] = { 242403 },                             -- Perfidious Projector
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
            ["Mythic+"]      = { PRIMARY = 1.50, MASTERY = 1.05, HASTE = 1.04, CRIT = 0.74, VERS = 0.36, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 1.05, HASTE = 1.00, CRIT = 0.78, VERS = 0.55, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["A"] = { 242392, 242395, 242398, 242402, 242494, 242497, 219314 }, -- Diamantine Voidcore, Astral Antenna, Naazindhri's Mystic Lash, Araz's Ritual Forge, Lily of the Eternal Weave, Azhiccaran Parapodia, Ara-Kara Sacbrood
                ["B"] = { 185846, 219312, 219308, 190958, 246945, 238390 }, -- Miniscule Mailemental in an Envelope, Empowering Crystal of Anub'ikkaj, Signet of the Priory, So'leah's Secret Technique, Incorporeal Essence-Gorger, Soulbreaker's Sigil
                ["C"] = { 219317, 232545 },                     -- Harvester's Edict, Gigazap's Zap-Cap
                ["D"] = { 242403 },                             -- Perfidious Projector
            },
            ["Raid"] = {
                ["S"] = {},
                ["A"] = { 242392, 242395, 242398, 242402, 242399, 242494, 242497, 219314 }, -- Diamantine Voidcore, Astral Antenna, Naazindhri's Mystic Lash, Araz's Ritual Forge, Screams of a Forgotten Sky, Lily of the Eternal Weave, Azhiccaran Parapodia, Ara-Kara Sacbrood
                ["B"] = { 185846, 219312, 219308, 190958, 246945, 238390 }, -- Miniscule Mailemental in an Envelope, Empowering Crystal of Anub'ikkaj, Signet of the Priory, So'leah's Secret Technique, Incorporeal Essence-Gorger, Soulbreaker's Sigil
                ["C"] = { 219317, 232545 },                     -- Harvester's Edict, Gigazap's Zap-Cap
                ["D"] = { 242403 },                             -- Perfidious Projector
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
