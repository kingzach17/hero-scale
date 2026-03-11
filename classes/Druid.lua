local _, playerClass = UnitClass("player")
if playerClass ~= "DRUID" then return end

local _, Addon = ...

-- Druid weapon subclass IDs (shared across all specs)
local druidWeapons = {
    [4]  = true, -- One-Handed Maces
    [15] = true, -- Daggers
    [13] = true, -- Fist Weapons
    [6]  = true, -- Polearms
    [10] = true, -- Staves
}

-- Ensure the table exists in the master object
Addon.ClassData["DRUID"] = {
    -- BALANCE (Spec ID: 102)
    [102] = {
        name = "Balance",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 780, -- Astral Invocation: increased Arcane and Nature damage
        armorType = 2, -- Leather
        role = "CASTER_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true,
        allowedWeaponTypes = druidWeapons,
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, MASTERY = 0.96, CRIT = 0.35, VERS = 0.25, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, MASTERY = 1.05, HASTE = 0.98, CRIT = 0.32, VERS = 0.30, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.96, CRIT = 0.35, VERS = 0.25, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 1.05, HASTE = 0.60, CRIT = 0.41, VERS = 0.27, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 242395, 242402, 242497 },          -- Astral Antenna, Araz's Ritual Forge, Azhiccaran Parapodia
                ["A"] = { 242392, 219312, 219314, 242494 },  -- Diamantine Voidcore, Empowering Crystal of Anub'ikkaj, Ara-Kara Sacbrood, Lily of the Eternal Weave
                ["B"] = { 185818, 219308 },                  -- So'leah's Secret Technique, Signet of the Priory
                ["C"] = { 219317, 232545 },                  -- Harvester's Edict, Gigazap's Zap-Cap
                ["D"] = { 219313, 242398 },                  -- Mereldar's Toll, Naazindhri's Mystic Lash
            },
            ["Raid"] = {
                ["S"] = { 242395, 242402, 242497 },          -- Astral Antenna, Araz's Ritual Forge, Azhiccaran Parapodia
                ["A"] = { 242392, 219312, 219314, 242494 },  -- Diamantine Voidcore, Empowering Crystal of Anub'ikkaj, Ara-Kara Sacbrood, Lily of the Eternal Weave
                ["B"] = { 185818, 219308 },                  -- So'leah's Secret Technique, Signet of the Priory
                ["C"] = { 219317, 232545 },                  -- Harvester's Edict, Gigazap's Zap-Cap
                ["D"] = { 219313, 242398 },                  -- Mereldar's Toll, Naazindhri's Mystic Lash
            },
        }
    },

    -- FERAL (Spec ID: 103)
    [103] = {
        name = "Feral",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 1540, -- Razor Claws: increased bleed damage
        armorType = 2, -- Leather
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = druidWeapons,
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, MASTERY = 1.05, HASTE = 0.56, CRIT = 0.44, VERS = 0.18, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, MASTERY = 1.05, HASTE = 0.79, CRIT = 0.52, VERS = 0.36, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, MASTERY = 1.05, HASTE = 0.56, CRIT = 0.44, VERS = 0.18, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 1.05, HASTE = 0.75, CRIT = 0.58, VERS = 0.35, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 242396, 242402 },                          -- Unyielding Netherprism, Araz's Ritual Forge
                ["A"] = { 242395, 232541, 242397, 219308 },          -- Astral Antenna, Improvised Seaforium Pacemaker, Sigil of the Cosmic Hunt, Signet of the Priory
                ["B"] = { 219314, 185818, 219312, 242495 },          -- Ara-Kara Sacbrood, So'leah's Secret Technique, Empowering Crystal of Anub'ikkaj, Incorporeal Warpclaw
                ["C"] = { 190652, 219317, 242494 },                  -- Ticking Sack of Terror, Harvester's Edict, Lily of the Eternal Weave
                ["D"] = { 246945, 238390 },                          -- Incorporeal Essence-Gorger, Soulbreaker's Sigil
            },
            ["Raid"] = {
                ["S"] = { 242402 },                                  -- Araz's Ritual Forge
                ["A"] = { 242396, 242395, 232541, 242397, 219308 },  -- Unyielding Netherprism, Astral Antenna, Improvised Seaforium Pacemaker, Sigil of the Cosmic Hunt, Signet of the Priory
                ["B"] = { 219314, 185818, 219312, 242495 },          -- Ara-Kara Sacbrood, So'leah's Secret Technique, Empowering Crystal of Anub'ikkaj, Incorporeal Warpclaw
                ["C"] = { 190652, 219317, 242494 },                  -- Ticking Sack of Terror, Harvester's Edict, Lily of the Eternal Weave
                ["D"] = { 246945, 238390 },                          -- Incorporeal Essence-Gorger, Soulbreaker's Sigil
            },
        }
    },

    -- GUARDIAN (Spec ID: 104)
    [104] = {
        name = "Guardian",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 750, -- Nature's Guardian: increased armor and attack power
        armorType = 2, -- Leather
        role = "TANK",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = druidWeapons,
        weights = {
            ["Leveling"]     = { PRIMARY = 3.00, HASTE = 1.05, VERS = 0.67, MASTERY = 0.50, CRIT = 0.25, STAMINA = 2.50, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Solo/Delves"]  = { PRIMARY = 1.20, HASTE = 1.05, VERS = 0.72, MASTERY = 0.64, CRIT = 0.40, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Mythic+"]      = { PRIMARY = 1.20, HASTE = 1.05, VERS = 0.67, MASTERY = 0.50, CRIT = 0.25, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Raid"]         = { PRIMARY = 1.20, HASTE = 1.05, VERS = 0.75, MASTERY = 0.62, CRIT = 0.52, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
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
                ["S"] = { 232541, 232543, 219309, 190652 },                          -- Improvised Seaforium Pacemaker, Ringing Ritual Mud, Tome of Light's Devotion, Ticking Sack of Terror
                ["A"] = { 219308, 219314, 242401, 246344, 242495 },                  -- Signet of the Priory, Ara-Kara Sacbrood, Brand of Ceaseless Ire, Cursed Stone Idol, Incorporeal Warpclaw
                ["B"] = { 219316, 219317, 219312, 185846 },                         -- Ceaseless Swarmgland, Harvester's Edict, Empowering Crystal of Anub'ikkaj, Miniscule Mailemental in an Envelope
                ["C"] = { 242494, 185836, 185818, 238386, 242867, 246945, 246944, 246824, 238390, 246941, 240213 }, -- Lily of the Eternal Weave, Codex of the First Technique, So'leah's Secret Technique, Void-Touched Fragment, Automatic Footbomb Dispenser, Incorporeal Essence-Gorger, Mind-Fracturing Odium, Shadowguard's Twisted Harvester, Soulbreaker's Sigil, Symbiotic Ethergauze, Veiling Mana Shroud
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 242401, 219309 },                                          -- Brand of Ceaseless Ire, Tome of Light's Devotion
                ["A"] = { 242402, 242395, 242403, 242399, 242397, 242396 },          -- Araz's Ritual Forge, Astral Antenna, Perfidious Projector, Screams of a Forgotten Sky, Sigil of the Cosmic Hunt, Unyielding Netherprism
                ["B"] = { 242404, 219316, 219317, 219312, 242495, 246344, 185846 },  -- All-Devouring Nucleus, Ceaseless Swarmgland, Harvester's Edict, Empowering Crystal of Anub'ikkaj, Incorporeal Warpclaw, Cursed Stone Idol, Miniscule Mailemental in an Envelope
                ["C"] = { 242494, 185836, 185818, 238386, 242867, 246945, 246944, 246824, 238390, 246941, 240213 },
                ["D"] = {},
            },
        }
    },

    -- RESTORATION (Spec ID: 105)
    [105] = {
        name = "Restoration",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 652, -- Harmony: increased healing on targets with HoTs
        armorType = 2, -- Leather
        role = "HEALER",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true,
        allowedWeaponTypes = druidWeapons,
        weights = {
            ["Leveling"]     = { PRIMARY = 4.00, HASTE = 1.05, MASTERY = 0.85, VERS = 0.33, CRIT = 0.21, STAMINA = 2.00, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.60, HASTE = 1.05, MASTERY = 0.80, VERS = 0.41, CRIT = 0.24, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.60, HASTE = 1.05, MASTERY = 0.85, VERS = 0.33, CRIT = 0.21, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.60, HASTE = 1.05, MASTERY = 0.87, VERS = 0.28, CRIT = 0.17, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 242393, 242392 },                          -- Loom'ithar's Living Silk, Diamantine Voidcore
                ["A"] = { 242400, 185818, 219314, 242395, 219312 },  -- Nexus-King's Command, So'leah's Secret Technique, Ara-Kara Sacbrood, Astral Antenna, Empowering Crystal of Anub'ikkaj
                ["B"] = { 210816, 219308, 185845 },                  -- Algari Alchemist Stone, Signet of the Priory, First Class Healing Distributor
                ["C"] = { 246939, 246940, 242494 },                  -- Essence-Hunter's Eyeglass, Manaforged Aethercell, Lily of the Eternal Weave
                ["D"] = { 232542, 246947, 242402 },                  -- Darkfuse Medichopper, Twisted Mana Sprite, Araz's Ritual Forge
            },
            ["Raid"] = {
                ["S"] = { 242392, 242393, 242400 },                  -- Diamantine Voidcore, Loom'ithar's Living Silk, Nexus-King's Command
                ["A"] = { 185818, 219314, 219312, 242395 },          -- So'leah's Secret Technique, Ara-Kara Sacbrood, Empowering Crystal of Anub'ikkaj, Astral Antenna
                ["B"] = { 210816, 219308, 185845 },                  -- Algari Alchemist Stone, Signet of the Priory, First Class Healing Distributor
                ["C"] = { 246939, 246940, 242402 },                  -- Essence-Hunter's Eyeglass, Manaforged Aethercell, Araz's Ritual Forge
                ["D"] = { 242494, 232542, 246947, 178826 },          -- Lily of the Eternal Weave, Darkfuse Medichopper, Twisted Mana Sprite, Sunblood Amethyst
            },
        }
    },

    -- INITIAL (Spec ID: 1447)
    [1447] = {
        name = "Initial",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 800,
        armorType = 2, -- Leather
        role = "LEVELING",
        canUseOffhand = true,
        allowedWeaponTypes = {
            [4]  = true, -- One-Handed Maces
            [6]  = true, -- Polearms
            [10] = true, -- Staves
            [13] = true, -- Fist Weapons
            [15] = true, -- Daggers
        },
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Druid Module Loaded.")
