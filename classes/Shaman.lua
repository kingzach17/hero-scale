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
            ["Mythic+"]      = { PRIMARY = 1.50, MASTERY = 1.05, HASTE = 0.93, CRIT = 0.56, VERS = 0.30, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 1.05, HASTE = 0.90, CRIT = 0.53, VERS = 0.48, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 242402, 242392, 242497 },          -- Araz's Ritual Forge, Diamantine Voidcore, Azhiccaran Parapodia
                ["A"] = { 242395, 242494, 219308 },          -- Astral Antenna, Lily of the Eternal Weave, Signet of the Priory
                ["B"] = { 185818, 219312, 219314 },          -- So'leah's Secret Technique, Empowering Crystal of Anub'ikkaj, Ara-Kara Sacbrood
                ["C"] = { 210816, 219317, 232545 },          -- Algari Alchemist Stone, Harvester's Edict, Gigazap's Zap-Cap
                ["D"] = { 242398, 219313, 219310 },          -- Naazindhri's Mystic Lash, Mereldar's Toll, Bursting Lightshard
            },
            ["Raid"] = {
                ["S"] = { 242402, 242392, 242497 },          -- Araz's Ritual Forge, Diamantine Voidcore, Azhiccaran Parapodia
                ["A"] = { 242395, 242494, 219308 },          -- Astral Antenna, Lily of the Eternal Weave, Signet of the Priory
                ["B"] = { 185818, 219312, 219314 },          -- So'leah's Secret Technique, Empowering Crystal of Anub'ikkaj, Ara-Kara Sacbrood
                ["C"] = { 210816, 219317, 232545 },          -- Algari Alchemist Stone, Harvester's Edict, Gigazap's Zap-Cap
                ["D"] = { 242398, 219313, 219310 },          -- Naazindhri's Mystic Lash, Mereldar's Toll, Bursting Lightshard
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
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.87, CRIT = 0.27, VERS = 0.21, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 1.03, CRIT = 0.47, VERS = 0.29, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 242402, 232541, 242395 },                  -- Araz's Ritual Forge, Improvised Seaforium Pacemaker, Astral Antenna
                ["A"] = { 219308, 242494, 185818, 219314, 219312 },  -- Signet of the Priory, Lily of the Eternal Weave, So'leah's Secret Technique, Ara-Kara Sacbrood, Empowering Crystal of Anub'ikkaj
                ["B"] = { 242397, 242396, 210816, 246344, 246945, 242399 }, -- Sigil of the Cosmic Hunt, Unyielding Netherprism, Algari Alchemist Stone, Cursed Stone Idol, Incorporeal Essence-Gorger, Screams of a Forgotten Sky
                ["C"] = { 242495, 190652, 219317 },                  -- Incorporeal Warpclaw, Ticking Sack of Terror, Harvester's Edict
                ["D"] = { 238390, 238386 },                          -- Soulbreaker's Sigil, Void-Touched Fragment
            },
            ["Raid"] = {
                ["S"] = { 242402, 242395 },                          -- Araz's Ritual Forge, Astral Antenna
                ["A"] = { 232541, 219308, 242494, 185818, 219314, 219312 }, -- Improvised Seaforium Pacemaker, Signet of the Priory, Lily of the Eternal Weave, So'leah's Secret Technique, Ara-Kara Sacbrood, Empowering Crystal of Anub'ikkaj
                ["B"] = { 242397, 242396, 210816, 246344, 246945, 242399 }, -- Sigil of the Cosmic Hunt, Unyielding Netherprism, Algari Alchemist Stone, Cursed Stone Idol, Incorporeal Essence-Gorger, Screams of a Forgotten Sky
                ["C"] = { 242495, 190652, 219317 },                  -- Incorporeal Warpclaw, Ticking Sack of Terror, Harvester's Edict
                ["D"] = { 238390, 238386 },                          -- Soulbreaker's Sigil, Void-Touched Fragment
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
            ["Mythic+"]      = { PRIMARY = 1.60, HASTE = 1.05, CRIT = 0.81, MASTERY = 0.52, VERS = 0.51, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.60, HASTE = 1.05, CRIT = 0.98, VERS = 0.40, MASTERY = 0.39, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 242395, 185818 },                          -- Astral Antenna, So'leah's Secret Technique
                ["A"] = { 219314, 219308, 219312, 242392, 242393 },  -- Ara-Kara Sacbrood, Signet of the Priory, Empowering Crystal of Anub'ikkaj, Diamantine Voidcore, Loom'ithar's Living Silk
                ["B"] = { 242400, 246947, 185845, 232542, 242494, 210816, 242402 }, -- Nexus-King's Command, Twisted Mana Sprite, First Class Healing Distributor, Darkfuse Medichopper, Lily of the Eternal Weave, Algari Alchemist Stone, Araz's Ritual Forge
                ["C"] = { 246939, 246940 },                          -- Essence-Hunter's Eyeglass, Manaforged Aethercell
                ["D"] = { 178826, 246825 },                          -- Sunblood Amethyst, Chaotic Nethergate
            },
            ["Raid"] = {
                ["S"] = { 242395, 185818 },                          -- Astral Antenna, So'leah's Secret Technique
                ["A"] = { 219314, 219308, 219312, 242392, 242393 },  -- Ara-Kara Sacbrood, Signet of the Priory, Empowering Crystal of Anub'ikkaj, Diamantine Voidcore, Loom'ithar's Living Silk
                ["B"] = { 242400, 185845, 232542, 242494, 210816, 242402 }, -- Nexus-King's Command, First Class Healing Distributor, Darkfuse Medichopper, Lily of the Eternal Weave, Algari Alchemist Stone, Araz's Ritual Forge
                ["C"] = { 246939, 246940 },                          -- Essence-Hunter's Eyeglass, Manaforged Aethercell
                ["D"] = { 178826, 246825 },                          -- Sunblood Amethyst, Chaotic Nethergate
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
