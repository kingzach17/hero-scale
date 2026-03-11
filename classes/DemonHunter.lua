local _, playerClass = UnitClass("player")
if playerClass ~= "DEMONHUNTER" then return end

local _, Addon = ...

-- Ensure the table exists in the master object
Addon.ClassData["DEMONHUNTER"] = {
    -- HAVOC (Spec ID: 577)
    [577] = {
        name = "Havoc",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 428,
        armorType = 2, -- Leather
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil, -- Optional, skip when unavailable
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [7]  = true, -- One-Handed Swords
            [9]  = true, -- Warglaives
            [13] = true, -- Fist Weapons
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, CRIT = 1.05, MASTERY = 0.88, HASTE = 0.47, VERS = 0.05, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 0.00 },
            ["Solo/Delves"]  = { PRIMARY = 2.00, CRIT = 1.05, MASTERY = 0.81, HASTE = 0.47, VERS = 0.22, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 2.00, CRIT = 1.05, MASTERY = 0.88, HASTE = 0.47, VERS = 0.05, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 2.00, CRIT = 1.05, MASTERY = 0.84, HASTE = 0.36, VERS = 0.15, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 246344, 242395 },                                     -- Cursed Stone Idol, Astral Antenna
                ["A"] = { 219314, 242397, 242396, 190958, 219312, 232541 },     -- Ara-Kara Sacbrood, Sigil of the Cosmic Hunt, Unyielding Netherprism, So'leah's Secret Technique, Empowering Crystal of Anub'ikkaj, Improvised Seaforium Pacemaker
                ["B"] = { 242495, 242402, 219308, 242494 },                     -- Incorporeal Warpclaw, Araz's Ritual Forge, Signet of the Priory, Lily of the Eternal Weave
                ["C"] = { 242867, 219317, 238390 },                             -- Automatic Footbomb Dispenser, Harvester's Edict, Soulbreaker's Sigil
                ["D"] = { 242399, 242403 },                                     -- Screams of a Forgotten Sky, Perfidious Projector
            },
            ["Raid"] = {
                ["S"] = { 242395 },                                             -- Astral Antenna
                ["A"] = { 242402, 242397, 242399, 190652 },                     -- Araz's Ritual Forge, Sigil of the Cosmic Hunt, Screams of a Forgotten Sky, Ticking Sack of Terror
                ["B"] = { 242495, 232541, 219314, 219312, 190958, 242396, 219308, 242494 }, -- Incorporeal Warpclaw, Improvised Seaforium Pacemaker, Ara-Kara Sacbrood, Empowering Crystal of Anub'ikkaj, So'leah's Secret Technique, Unyielding Netherprism, Signet of the Priory, Lily of the Eternal Weave
                ["C"] = { 246344, 242403, 238390 },                             -- Cursed Stone Idol, Perfidious Projector, Soulbreaker's Sigil
                ["D"] = { 238386, 242867, 219317 },                             -- Void-Touched Fragment, Automatic Footbomb Dispenser, Harvester's Edict
            },
        }
    },

    -- VENGEANCE (Spec ID: 581)
    [581] = {
        name = "Vengeance",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 410,
        armorType = 2, -- Leather
        role = "TANK",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [7]  = true, -- One-Handed Swords
            [9]  = true, -- Warglaives
            [13] = true, -- Fist Weapons
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 3.00, HASTE = 1.05, VERS = 0.52, MASTERY = 0.42, CRIT = 0.38, STAMINA = 2.50, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Solo/Delves"]  = { PRIMARY = 3.00, HASTE = 1.05, CRIT = 1.01, MASTERY = 0.54, VERS = 0.40, STAMINA = 2.50, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Mythic+"]      = { PRIMARY = 3.00, HASTE = 1.05, VERS = 0.52, MASTERY = 0.42, CRIT = 0.38, STAMINA = 2.50, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Raid"]         = { PRIMARY = 3.00, CRIT = 1.05, HASTE = 0.96, MASTERY = 0.48, VERS = 0.39, STAMINA = 2.50, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
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
                ["S"] = { 190958, 242401, 242402 },                             -- So'leah's Secret Technique, Brand of Ceaseless Ire, Araz's Ritual Forge
                ["A"] = { 219309, 219314, 242393, 232541, 232543 },             -- Tome of Light's Devotion, Ara-Kara Sacbrood, Loom'ithar's Living Silk, Improvised Seaforium Pacemaker, Ringing Ritual Mud
                ["B"] = { 219308, 242391, 242396, 242395, 242397 },             -- Signet of the Priory, Soulbinder's Embrace, Unyielding Netherprism, Astral Antenna, Sigil of the Cosmic Hunt
                ["C"] = { 246344, 242403, 190652, 242494 },                     -- Cursed Stone Idol, Perfidious Projector, Ticking Sack of Terror, Lily of the Eternal Weave
                ["D"] = { 219312, 242495, 246944 },                             -- Empowering Crystal of Anub'ikkaj, Incorporeal Warpclaw, Mind-Fracturing Odium
            },
            ["Raid"] = {
                ["S"] = { 219309, 242401, 242402 },                             -- Tome of Light's Devotion, Brand of Ceaseless Ire, Araz's Ritual Forge
                ["A"] = { 190958, 219314, 232541, 232543 },                     -- So'leah's Secret Technique, Ara-Kara Sacbrood, Improvised Seaforium Pacemaker, Ringing Ritual Mud
                ["B"] = { 219308, 242391, 242396, 242395, 242397 },             -- Signet of the Priory, Soulbinder's Embrace, Unyielding Netherprism, Astral Antenna, Sigil of the Cosmic Hunt
                ["C"] = { 246344, 242393, 242403, 190652 },                     -- Cursed Stone Idol, Loom'ithar's Living Silk, Perfidious Projector, Ticking Sack of Terror
                ["D"] = { 219312, 242495, 238390, 219317 },                     -- Empowering Crystal of Anub'ikkaj, Incorporeal Warpclaw, Soulbreaker's Sigil, Harvester's Edict
            },
        }
    },

    -- DEVOURER (Spec ID: 1480)
    [1480] = {
        name = "Devourer",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 400,
        armorType = 2, -- Leather
        role = "CASTER_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [7]  = true, -- One-Handed Swords
            [9]  = true, -- Warglaives
            [13] = true, -- Fist Weapons
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, MASTERY = 1.01, CRIT = 0.34, VERS = 0.18, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 2.00, MASTERY = 1.05, HASTE = 0.92, CRIT = 0.60, VERS = 0.20, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 2.00, HASTE = 1.05, MASTERY = 1.01, CRIT = 0.34, VERS = 0.18, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 2.00, MASTERY = 1.05, HASTE = 0.80, CRIT = 0.57, VERS = 0.14, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 242494, 242392 },                                     -- Lily of the Eternal Weave, Diamantine Voidcore
                ["A"] = { 242395, 242497, 219314, 190958 },                     -- Astral Antenna, Azhiccaran Parapodia, Ara-Kara Sacbrood, So'leah's Secret Technique
                ["B"] = { 242402, 219312, 219308, 242399 },                     -- Araz's Ritual Forge, Empowering Crystal of Anub'ikkaj, Signet of the Priory, Screams of a Forgotten Sky
                ["C"] = { 219317, 242398 },                                     -- Harvester's Edict, Naazindhri's Mystic Lash
                ["D"] = { 242867, 238386 },                                     -- Automatic Footbomb Dispenser, Void-Touched Fragment
            },
            ["Raid"] = {
                ["S"] = { 242494, 242392 },                                     -- Lily of the Eternal Weave, Diamantine Voidcore
                ["A"] = { 242395, 242402, 242497, 219314 },                     -- Astral Antenna, Araz's Ritual Forge, Azhiccaran Parapodia, Ara-Kara Sacbrood
                ["B"] = { 190958, 219312, 219308, 242399 },                     -- So'leah's Secret Technique, Empowering Crystal of Anub'ikkaj, Signet of the Priory, Screams of a Forgotten Sky
                ["C"] = { 242398, 219317 },                                     -- Naazindhri's Mystic Lash, Harvester's Edict
                ["D"] = { 242867, 238386 },                                     -- Automatic Footbomb Dispenser, Void-Touched Fragment
            },
        }
    },

    -- INITIAL (Spec ID: 1456)
    [1456] = {
        name = "Initial",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 800,
        armorType = 2, -- Leather
        role = "LEVELING",
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [7]  = true, -- One-Handed Swords
            [9]  = true, -- Warglaives
            [13] = true, -- Fist Weapons
        },
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Demon Hunter Module Loaded.")
