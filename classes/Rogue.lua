local _, playerClass = UnitClass("player")
if playerClass ~= "ROGUE" then return end

local _, Addon = ...

-- Ensure the table exists in the master object
Addon.ClassData["ROGUE"] = {
    -- ASSASSINATION (Spec ID: 259)
    [259] = {
        name = "Assassination",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 588, -- Potent Assassin: 1.7% poison/bleed damage per point
        armorType = 2, -- Leather
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil, -- Optional, skip when unavailable
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [15] = true, -- Daggers
            [13] = true, -- Fist Weapons
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, MASTERY = 1.05, CRIT = 0.89, HASTE = 0.58, VERS = 0.31, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.97, HASTE = 0.61, VERS = 0.47, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.89, HASTE = 0.58, VERS = 0.31, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, CRIT = 1.05, MASTERY = 1.04, HASTE = 0.53, VERS = 0.49, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 242395, 242396, 242402 },             -- Astral Antenna, Unyielding Netherprism, Araz's Ritual Forge
                ["A"] = { 242494, 219314, 219312, 232541 },     -- Lily of the Eternal Weave, Ara-Kara Sacbrood, Empowering Crystal of Anub'ikkaj, Improvised Seaforium Pacemaker
                ["B"] = { 242397, 242495, 190652, 190958, 219308, 246344 }, -- Sigil of the Cosmic Hunt, Incorporeal Warpclaw, Ticking Sack of Terror, So'leah's Secret Technique, Signet of the Priory, Cursed Stone Idol
                ["C"] = { 242403, 246944, 246945, 219317 },     -- Perfidious Projector, Mind-Fracturing Odium, Incorporeal Essence-Gorger, Harvester's Edict
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 242395, 242396, 242402 },             -- Astral Antenna, Unyielding Netherprism, Araz's Ritual Forge
                ["A"] = { 242494, 219314, 219312, 232541 },     -- Lily of the Eternal Weave, Ara-Kara Sacbrood, Empowering Crystal of Anub'ikkaj, Improvised Seaforium Pacemaker
                ["B"] = { 242397, 242495, 190652, 190958, 219308, 246344 }, -- Sigil of the Cosmic Hunt, Incorporeal Warpclaw, Ticking Sack of Terror, So'leah's Secret Technique, Signet of the Priory, Cursed Stone Idol
                ["C"] = { 242403, 246944, 246945, 219317 },     -- Perfidious Projector, Mind-Fracturing Odium, Incorporeal Essence-Gorger, Harvester's Edict
                ["D"] = {},
            },
        }
    },

    -- OUTLAW (Spec ID: 260)
    [260] = {
        name = "Outlaw",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 500, -- Main Gauche: offhand attack proc chance
        armorType = 2, -- Leather
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
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, CRIT = 1.05, HASTE = 0.86, VERS = 0.53, MASTERY = 0.44, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, VERS = 1.05, HASTE = 0.99, CRIT = 0.98, MASTERY = 0.58, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, CRIT = 1.05, HASTE = 0.86, VERS = 0.53, MASTERY = 0.44, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, VERS = 1.05, CRIT = 0.88, HASTE = 0.88, MASTERY = 0.46, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 242395, 242397, 219314, 242495 },     -- Astral Antenna, Sigil of the Cosmic Hunt, Ara-Kara Sacbrood, Incorporeal Warpclaw
                ["A"] = { 232541, 246344, 219308, 242396 },     -- Improvised Seaforium Pacemaker, Cursed Stone Idol, Signet of the Priory, Unyielding Netherprism
                ["B"] = { 190958 },                             -- So'leah's Secret Technique
                ["C"] = { 219317 },                             -- Harvester's Edict
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 242395, 242397 },                     -- Astral Antenna, Sigil of the Cosmic Hunt
                ["A"] = { 219314, 242495, 232541, 242396, 219308 }, -- Ara-Kara Sacbrood, Incorporeal Warpclaw, Improvised Seaforium Pacemaker, Unyielding Netherprism, Signet of the Priory
                ["B"] = { 246344, 190958 },                     -- Cursed Stone Idol, So'leah's Secret Technique
                ["C"] = { 219317 },                             -- Harvester's Edict
                ["D"] = {},
            },
        }
    },

    -- SUBTLETY (Spec ID: 261)
    [261] = {
        name = "Subtlety",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 408, -- Executioner: 2.45% finisher damage per point
        armorType = 2, -- Leather
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
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, MASTERY = 1.05, CRIT = 0.67, HASTE = 0.36, VERS = 0.32, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, MASTERY = 1.05, VERS = 0.79, CRIT = 0.74, HASTE = 0.69, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.67, HASTE = 0.36, VERS = 0.32, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.99, VERS = 0.95, HASTE = 0.92, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 242399, 242396 },                     -- Screams of a Forgotten Sky, Unyielding Netherprism
                ["A"] = { 242403, 246344, 219314, 242494, 219312 }, -- Perfidious Projector, Cursed Stone Idol, Ara-Kara Sacbrood, Lily of the Eternal Weave, Empowering Crystal of Anub'ikkaj
                ["B"] = { 232541, 190958, 242402 },              -- Improvised Seaforium Pacemaker, So'leah's Secret Technique, Araz's Ritual Forge
                ["C"] = { 242395, 242397 },                      -- Astral Antenna, Sigil of the Cosmic Hunt
                ["D"] = { 190652 },                             -- Ticking Sack of Terror
            },
            ["Raid"] = {
                ["S"] = { 242399, 242396 },                     -- Screams of a Forgotten Sky, Unyielding Netherprism
                ["A"] = { 242397, 242395, 242402 },              -- Sigil of the Cosmic Hunt, Astral Antenna, Araz's Ritual Forge
                ["B"] = { 242403, 219314, 242494, 219312 },      -- Perfidious Projector, Ara-Kara Sacbrood, Lily of the Eternal Weave, Empowering Crystal of Anub'ikkaj
                ["C"] = { 232541, 190958 },                      -- Improvised Seaforium Pacemaker, So'leah's Secret Technique
                ["D"] = { 190652 },                             -- Ticking Sack of Terror
            },
        }
    },

    -- INITIAL (Spec ID: 1453)
    [1453] = {
        name = "Initial",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 800,
        armorType = 2,
        role = "LEVELING",
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [13] = true, -- Fist Weapons
            [15] = true, -- Daggers
        },
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Rogue Module Loaded.")
