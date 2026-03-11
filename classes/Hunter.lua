local _, playerClass = UnitClass("player")
if playerClass ~= "HUNTER" then return end

local _, Addon = ...

-- Ensure the table exists in the master object
Addon.ClassData["HUNTER"] = {
    -- BEAST MASTERY (Spec ID: 253)
    [253] = {
        name = "Beast Mastery",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 526, -- Master of Beasts
        armorType = 3, -- Mail
        role = "RANGED_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [7]  = true, -- One-Handed Swords
            [1]  = true, -- Two-Handed Axes
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
            [10] = true, -- Staves
            [2]  = true, -- Bows
            [3]  = true, -- Guns
            [18] = true, -- Crossbows
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, CRIT = 1.05, MASTERY = 0.80, HASTE = 0.70, VERS = 0.32, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 0.98, MASTERY = 0.54, VERS = 0.35, STAMINA = 0.00, LEECH = 0.10, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, CRIT = 1.05, MASTERY = 0.80, HASTE = 0.70, VERS = 0.32, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 0.97, VERS = 0.47, MASTERY = 0.42, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 232541, 242395 },                    -- Improvised Seaforium Pacemaker, Astral Antenna
                ["A"] = { 219314, 219308, 219312 },             -- Ara-Kara Sacbrood, Signet of the Priory, Empowering Crystal of Anub'ikkaj
                ["B"] = { 242402, 190958 },                     -- Araz's Ritual Forge, So'leah's Secret Technique
                ["C"] = { 219317 },                             -- Harvester's Edict
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 232541, 242395 },                    -- Improvised Seaforium Pacemaker, Astral Antenna
                ["A"] = { 219314, 242402, 219308, 219312 },    -- Ara-Kara Sacbrood, Araz's Ritual Forge, Signet of the Priory, Empowering Crystal of Anub'ikkaj
                ["B"] = { 190958, 219317 },                    -- So'leah's Secret Technique, Harvester's Edict
                ["C"] = {},
                ["D"] = {},
            },
        }
    },

    -- MARKSMANSHIP (Spec ID: 254)
    [254] = {
        name = "Marksmanship",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 714, -- Sniper Training
        armorType = 3, -- Mail
        role = "RANGED_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [7]  = true, -- One-Handed Swords
            [1]  = true, -- Two-Handed Axes
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
            [10] = true, -- Staves
            [2]  = true, -- Bows
            [3]  = true, -- Guns
            [18] = true, -- Crossbows
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, MASTERY = 1.05, CRIT = 0.97, HASTE = 0.69, VERS = 0.24, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, CRIT = 1.05, MASTERY = 0.60, HASTE = 0.59, VERS = 0.25, STAMINA = 0.00, LEECH = 0.10, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.97, HASTE = 0.69, VERS = 0.24, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, CRIT = 1.05, MASTERY = 0.53, HASTE = 0.49, VERS = 0.23, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 242395, 242396 },                    -- Astral Antenna, Unyielding Netherprism
                ["A"] = { 219308, 242494, 219312, 232541 },    -- Signet of the Priory, Lily of the Eternal Weave, Empowering Crystal of Anub'ikkaj, Improvised Seaforium Pacemaker
                ["B"] = { 242402, 242397, 242399 },             -- Araz's Ritual Forge, Sigil of the Cosmic Hunt, Screams of a Forgotten Sky
                ["C"] = { 219314, 219317 },                     -- Ara-Kara Sacbrood, Harvester's Edict
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 242395, 242396 },                    -- Astral Antenna, Unyielding Netherprism
                ["A"] = { 242402, 242397, 242399, 219308 },    -- Araz's Ritual Forge, Sigil of the Cosmic Hunt, Screams of a Forgotten Sky, Signet of the Priory
                ["B"] = { 242494, 219312, 232541 },             -- Lily of the Eternal Weave, Empowering Crystal of Anub'ikkaj, Improvised Seaforium Pacemaker
                ["C"] = { 219314, 219317 },                     -- Ara-Kara Sacbrood, Harvester's Edict
                ["D"] = {},
            },
        }
    },

    -- SURVIVAL (Spec ID: 255)
    [255] = {
        name = "Survival",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 588, -- Spirit Bond
        armorType = 3, -- Mail
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [7]  = true, -- One-Handed Swords
            [1]  = true, -- Two-Handed Axes
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
            [10] = true, -- Staves
            [2]  = true, -- Bows
            [3]  = true, -- Guns
            [18] = true, -- Crossbows
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, MASTERY = 1.05, CRIT = 0.60, HASTE = 0.58, VERS = 0.17, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.98, HASTE = 0.79, VERS = 0.27, STAMINA = 0.00, LEECH = 0.10, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.60, HASTE = 0.58, VERS = 0.17, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.99, HASTE = 0.71, VERS = 0.24, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 246344, 232541, 242395, 242402 },    -- Cursed Stone Idol, Improvised Seaforium Pacemaker, Astral Antenna, Araz's Ritual Forge
                ["A"] = { 242494, 219308, 242396 },             -- Lily of the Eternal Weave, Signet of the Priory, Unyielding Netherprism
                ["B"] = { 219312, 219314 },                     -- Empowering Crystal of Anub'ikkaj, Ara-Kara Sacbrood
                ["C"] = { 219317 },                             -- Harvester's Edict
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 232541, 242395, 242402, 246344 },    -- Improvised Seaforium Pacemaker, Astral Antenna, Araz's Ritual Forge, Cursed Stone Idol
                ["A"] = { 242494, 219308, 242396 },             -- Lily of the Eternal Weave, Signet of the Priory, Unyielding Netherprism
                ["B"] = { 219312, 219314 },                     -- Empowering Crystal of Anub'ikkaj, Ara-Kara Sacbrood
                ["C"] = { 219317 },                             -- Harvester's Edict
                ["D"] = {},
            },
        }
    },

    -- INITIAL (Spec ID: 1448)
    [1448] = {
        name = "Initial",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 800,
        armorType = 3,
        role = "LEVELING",
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [1]  = true, -- Two-Handed Axes
            [2]  = true, -- Bows
            [3]  = true, -- Guns
            [6]  = true, -- Polearms
            [7]  = true, -- One-Handed Swords
            [8]  = true, -- Two-Handed Swords
            [10] = true, -- Staves
            [18] = true, -- Crossbows
        },
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Hunter Module Loaded.")
