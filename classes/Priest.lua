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
            ["Mythic+"]      = { PRIMARY = 1.60, HASTE = 1.05, MASTERY = 0.66, CRIT = 0.45, VERS = 0.39, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.60, MASTERY = 1.05, HASTE = 1.04, CRIT = 0.96, VERS = 0.37, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 242494, 242497, 242393 },             -- Lily of the Eternal Weave, Azhiccaran Parapodia, Loom'ithar's Living Silk
                ["A"] = { 242392, 242395, 190958 },              -- Diamantine Voidcore, Astral Antenna, So'leah's Secret Technique
                ["B"] = { 219312, 219314, 242402 },              -- Empowering Crystal of Anub'ikkaj, Ara-Kara Sacbrood, Araz's Ritual Forge
                ["C"] = { 219308, 242400, 238386 },              -- Signet of the Priory, Nexus-King's Command, Void-Touched Fragment
                ["D"] = { 246940 },                             -- Manaforged Aethercell
            },
            ["Raid"] = {
                ["S"] = { 242392, 242395, 242393 },              -- Diamantine Voidcore, Astral Antenna, Loom'ithar's Living Silk
                ["A"] = { 242494, 242497, 190958, 242402 },      -- Lily of the Eternal Weave, Azhiccaran Parapodia, So'leah's Secret Technique, Araz's Ritual Forge
                ["B"] = { 219312, 219314 },                     -- Empowering Crystal of Anub'ikkaj, Ara-Kara Sacbrood
                ["C"] = { 219308, 242400, 238386 },              -- Signet of the Priory, Nexus-King's Command, Void-Touched Fragment
                ["D"] = { 246940 },                             -- Manaforged Aethercell
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
            ["Mythic+"]      = { PRIMARY = 1.60, HASTE = 1.05, MASTERY = 0.60, VERS = 0.58, CRIT = 0.57, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.60, MASTERY = 1.05, CRIT = 0.99, HASTE = 0.70, VERS = 0.32, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 242395, 190958, 242392, 242393, 219312 }, -- Astral Antenna, So'leah's Secret Technique, Diamantine Voidcore, Loom'ithar's Living Silk, Empowering Crystal of Anub'ikkaj
                ["A"] = { 242400, 219308, 219314, 242494 },      -- Nexus-King's Command, Signet of the Priory, Ara-Kara Sacbrood, Lily of the Eternal Weave
                ["B"] = { 242402 },                             -- Araz's Ritual Forge
                ["C"] = { 238386, 246940 },                     -- Void-Touched Fragment, Manaforged Aethercell
                ["D"] = { 242497 },                             -- Azhiccaran Parapodia
            },
            ["Raid"] = {
                ["S"] = { 242395, 190958, 242392, 242393, 219312 }, -- Astral Antenna, So'leah's Secret Technique, Diamantine Voidcore, Loom'ithar's Living Silk, Empowering Crystal of Anub'ikkaj
                ["A"] = { 242400, 219308, 219314, 242494 },      -- Nexus-King's Command, Signet of the Priory, Ara-Kara Sacbrood, Lily of the Eternal Weave
                ["B"] = { 242402 },                             -- Araz's Ritual Forge
                ["C"] = { 238386, 246940 },                     -- Void-Touched Fragment, Manaforged Aethercell
                ["D"] = { 242497 },                             -- Azhiccaran Parapodia
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
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.79, CRIT = 0.26, VERS = 0.26, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 1.05, HASTE = 0.87, CRIT = 0.61, VERS = 0.19, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 242402, 242395 },                     -- Araz's Ritual Forge, Astral Antenna
                ["A"] = { 242392, 219308, 242494, 242497, 219314, 219312 }, -- Diamantine Voidcore, Signet of the Priory, Lily of the Eternal Weave, Azhiccaran Parapodia, Ara-Kara Sacbrood, Empowering Crystal of Anub'ikkaj
                ["B"] = { 190958, 242398 },                     -- So'leah's Secret Technique, Naazindhri's Mystic Lash
                ["C"] = { 219317, 238390 },                     -- Harvester's Edict, Soulbreaker's Sigil
                ["D"] = { 242403 },                             -- Perfidious Projector
            },
            ["Raid"] = {
                ["S"] = { 242402, 242395 },                     -- Araz's Ritual Forge, Astral Antenna
                ["A"] = { 242392, 219308, 242494, 242497, 219312 }, -- Diamantine Voidcore, Signet of the Priory, Lily of the Eternal Weave, Azhiccaran Parapodia, Empowering Crystal of Anub'ikkaj
                ["B"] = { 190958, 219314, 242398 },              -- So'leah's Secret Technique, Ara-Kara Sacbrood, Naazindhri's Mystic Lash
                ["C"] = { 219317, 238390 },                     -- Harvester's Edict, Soulbreaker's Sigil
                ["D"] = { 242403 },                             -- Perfidious Projector
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
