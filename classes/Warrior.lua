local _, playerClass = UnitClass("player")
if playerClass ~= "WARRIOR" then return end

local _, Addon = ...

-- Ensure the table exists in the master object
Addon.ClassData["WARRIOR"] = {
    -- ARMS (Spec ID: 71)
    [71] = {
        name = "Arms",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 909, -- Deep Wounds: 1.1% damage to bleeding targets per point
        armorType = 4, -- Plate
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [15] = true, -- Daggers
            [13] = true, -- Fist Weapons
            [1]  = true, -- Two-Handed Axes
            [5]  = true, -- Two-Handed Maces
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
            [10] = true, -- Staves
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, CRIT = 0.65, MASTERY = 0.62, VERS = 0.25, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.5, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 0.90, MASTERY = 0.56, VERS = 0.28, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.5, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 0.65, MASTERY = 0.62, VERS = 0.25, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 0.84, MASTERY = 0.56, VERS = 0.36, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 242399, 242395, 246344 },              -- Screams of a Forgotten Sky, Astral Antenna, Cursed Stone Idol
                ["A"] = { 242394, 219314, 232541, 190958 },      -- Eradicating Arcanocore, Ara-Kara Sacbrood, Improvised Seaforium Pacemaker, So'leah's Secret Technique
                ["B"] = { 242396, 190652, 219308 },               -- Unyielding Netherprism, Ticking Sack of Terror, Signet of the Priory
                ["C"] = { 242402, 219312 },                       -- Araz's Ritual Forge, Empowering Crystal of Anub'ikkaj
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 242399, 242395, 242394 },              -- Screams of a Forgotten Sky, Astral Antenna, Eradicating Arcanocore
                ["A"] = { 246344, 219314, 190652, 190958 },       -- Cursed Stone Idol, Ara-Kara Sacbrood, Ticking Sack of Terror, So'leah's Secret Technique
                ["B"] = { 232541, 242396, 219308 },               -- Improvised Seaforium Pacemaker, Unyielding Netherprism, Signet of the Priory
                ["C"] = { 242402, 219312 },                       -- Araz's Ritual Forge, Empowering Crystal of Anub'ikkaj
                ["D"] = {},
            },
        }
    },

    -- FURY (Spec ID: 72)
    [72] = {
        name = "Fury",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 714, -- Unshackled Fury: 1.4% damage while Enraged per point
        armorType = 4, -- Plate
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [15] = true, -- Daggers
            [13] = true, -- Fist Weapons
            [1]  = true, -- Two-Handed Axes
            [5]  = true, -- Two-Handed Maces
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
            [10] = true, -- Staves
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, MASTERY = 0.84, CRIT = 0.37, VERS = 0.21, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 7.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.92, CRIT = 0.43, VERS = 0.38, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 7.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.84, CRIT = 0.37, VERS = 0.21, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 7.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 1.05, VERS = 0.48, CRIT = 0.41, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 7.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 242395, 246344, 242399 },              -- Astral Antenna, Cursed Stone Idol, Screams of a Forgotten Sky
                ["A"] = { 242394, 219314, 232541, 242403 },      -- Eradicating Arcanocore, Ara-Kara Sacbrood, Improvised Seaforium Pacemaker, Perfidious Projector
                ["B"] = { 190958, 190652, 242396 },               -- So'leah's Secret Technique, Ticking Sack of Terror, Unyielding Netherprism
                ["C"] = { 219308, 242402 },                       -- Signet of the Priory, Araz's Ritual Forge
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 242394, 242395, 242399 },              -- Eradicating Arcanocore, Astral Antenna, Screams of a Forgotten Sky
                ["A"] = { 246344, 219314, 242403, 190652 },       -- Cursed Stone Idol, Ara-Kara Sacbrood, Perfidious Projector, Ticking Sack of Terror
                ["B"] = { 232541, 190958, 242396 },               -- Improvised Seaforium Pacemaker, So'leah's Secret Technique, Unyielding Netherprism
                ["C"] = { 219308, 242402 },                       -- Signet of the Priory, Araz's Ritual Forge
                ["D"] = {},
            },
        }
    },

    -- PROTECTION (Spec ID: 73)
    [73] = {
        name = "Protection",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 600, -- Critical Block: 0.5% block + 1.5% crit block + 1% AP per point
        armorType = 4, -- Plate
        role = "TANK",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = "SHIELD",
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 3.00, HASTE = 1.05, MASTERY = 0.55, VERS = 0.34, CRIT = 0.31, STAMINA = 2.50, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.0, SOCKET_VALUE = 70 },
            ["Solo/Delves"]  = { PRIMARY = 1.20, HASTE = 1.05, CRIT = 0.70, VERS = 0.51, MASTERY = 0.41, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.0, SOCKET_VALUE = 70 },
            ["Mythic+"]      = { PRIMARY = 1.20, HASTE = 1.05, MASTERY = 0.55, VERS = 0.34, CRIT = 0.31, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.0, SOCKET_VALUE = 70 },
            ["Raid"]         = { PRIMARY = 1.20, HASTE = 1.05, CRIT = 0.77, VERS = 0.47, MASTERY = 0.36, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.0, SOCKET_VALUE = 70 },
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
                ["S"] = { 232541, 232543, 219309, 242401, 190652 }, -- Improvised Seaforium Pacemaker, Ringing Ritual Mud, Tome of Light's Devotion, Brand of Ceaseless Ire, Ticking Sack of Terror
                ["A"] = { 242402, 242395, 242403, 219308, 219314, 242399, 242396 }, -- Araz's Ritual Forge, Astral Antenna, Perfidious Projector, Signet of the Priory, Ara-Kara Sacbrood, Screams of a Forgotten Sky, Unyielding Netherprism
                ["B"] = { 242404, 219316, 242495, 246344, 185836 }, -- All-Devouring Nucleus, Ceaseless Swarmgland, Incorporeal Warpclaw, Cursed Stone Idol, Codex of the First Technique
                ["C"] = { 190958, 238386, 246945 },               -- So'leah's Secret Technique, Void-Touched Fragment, Incorporeal Essence-Gorger
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 242401, 242391 },                      -- Brand of Ceaseless Ire, Soulbinder's Embrace
                ["A"] = { 242402, 242395, 242403, 242399, 242396, 219309 }, -- Araz's Ritual Forge, Astral Antenna, Perfidious Projector, Screams of a Forgotten Sky, Unyielding Netherprism, Tome of Light's Devotion
                ["B"] = { 242404, 242394, 232541, 219314, 190652 }, -- All-Devouring Nucleus, Eradicating Arcanocore, Improvised Seaforium Pacemaker, Ara-Kara Sacbrood, Ticking Sack of Terror
                ["C"] = { 190958, 219308, 238386 },               -- So'leah's Secret Technique, Signet of the Priory, Void-Touched Fragment
                ["D"] = {},
            },
        }
    },

    -- INITIAL (Spec ID: 1446)
    [1446] = {
        name = "Initial",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 800,
        armorType = 4,
        role = "LEVELING",
        canUseOffhand = "SHIELD",
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [1]  = true, -- Two-Handed Axes
            [4]  = true, -- One-Handed Maces
            [5]  = true, -- Two-Handed Maces
            [6]  = true, -- Polearms
            [7]  = true, -- One-Handed Swords
            [8]  = true, -- Two-Handed Swords
            [10] = true, -- Staves
            [13] = true, -- Fist Weapons
            [15] = true, -- Daggers
        },
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Warrior Module Loaded.")
