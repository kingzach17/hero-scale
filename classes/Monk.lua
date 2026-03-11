local _, playerClass = UnitClass("player")
if playerClass ~= "MONK" then return end

local _, Addon = ...

-- Ensure the table exists in the master object
Addon.ClassData["MONK"] = {
    -- WINDWALKER (Spec ID: 269)
    [269] = {
        name = "Windwalker",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 429, -- Combo Strikes: 2.33% damage for non-repeating abilities per point
        armorType = 2, -- Leather
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [13] = true, -- Fist Weapons
            [6]  = true, -- Polearms
            [10] = true, -- Staves
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, CRIT = 0.59, MASTERY = 0.56, VERS = 0.27, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.98, CRIT = 0.75, VERS = 0.63, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 1.05, CRIT = 0.59, MASTERY = 0.56, VERS = 0.27, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 1.04, CRIT = 0.79, VERS = 0.62, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 242402, 246945, 242396 },        -- Araz's Ritual Forge, Incorporeal Essence-Gorger, Unyielding Netherprism
                ["A"] = { 246344, 232541, 242397, 219308 }, -- Cursed Stone Idol, Improvised Seaforium Pacemaker, Sigil of the Cosmic Hunt, Signet of the Priory
                ["B"] = { 219312, 242495, 242494, 190652 }, -- Empowering Crystal of Anub'ikkaj, Incorporeal Warpclaw, Lily of the Eternal Weave, Ticking Sack of Terror
                ["C"] = { 219317, 238390 },                 -- Harvester's Edict, Soulbreaker's Sigil
                ["D"] = { 219314, 185818, 238386 },         -- Ara-Kara Sacbrood, So'leah's Secret Technique, Void-Touched Fragment
            },
            ["Raid"] = {
                ["S"] = { 242402, 242395, 246945, 242399, 242396 }, -- Araz's Ritual Forge, Astral Antenna, Incorporeal Essence-Gorger, Screams of a Forgotten Sky, Unyielding Netherprism
                ["A"] = { 246344, 232541, 242397, 219308 },          -- Cursed Stone Idol, Improvised Seaforium Pacemaker, Sigil of the Cosmic Hunt, Signet of the Priory
                ["B"] = { 219312, 242495, 242494, 190652 },          -- Empowering Crystal of Anub'ikkaj, Incorporeal Warpclaw, Lily of the Eternal Weave, Ticking Sack of Terror
                ["C"] = { 219317, 238390 },                          -- Harvester's Edict, Soulbreaker's Sigil
                ["D"] = { 219314, 185818, 238386 },                  -- Ara-Kara Sacbrood, So'leah's Secret Technique, Void-Touched Fragment
            },
        }
    },

    -- BREWMASTER (Spec ID: 268)
    [268] = {
        name = "Brewmaster",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 1082, -- Elusive Brawler: 0.924% dodge + 1% AP per point
        armorType = 2, -- Leather
        role = "TANK",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [13] = true, -- Fist Weapons
            [6]  = true, -- Polearms
            [10] = true, -- Staves
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 3.00, CRIT = 1.05, VERS = 0.94, MASTERY = 0.36, HASTE = 0.35, STAMINA = 2.50, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Solo/Delves"]  = { PRIMARY = 1.20, VERS = 1.05, CRIT = 0.93, MASTERY = 0.57, HASTE = 0.46, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Mythic+"]      = { PRIMARY = 1.20, CRIT = 1.05, VERS = 0.94, MASTERY = 0.36, HASTE = 0.35, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Raid"]         = { PRIMARY = 1.20, CRIT = 1.05, VERS = 1.05, MASTERY = 0.52, HASTE = 0.31, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
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
                ["S"] = { 242401, 219309 },                                          -- Brand of Ceaseless Ire, Tome of Light's Devotion
                ["A"] = { 246344, 232541, 242494, 219308, 232543 },                  -- Cursed Stone Idol, Improvised Seaforium Pacemaker, Lily of the Eternal Weave, Signet of the Priory, Ringing Ritual Mud
                ["B"] = { 219312, 242495, 190652, 219317, 240172 },                  -- Empowering Crystal of Anub'ikkaj, Incorporeal Warpclaw, Ticking Sack of Terror, Harvester's Edict, Depleted K'areshi Battery
                ["C"] = { 185836, 219316, 238390, 242867, 210816, 246824, 246941 },  -- Codex of the First Technique, Ceaseless Swarmgland, Soulbreaker's Sigil, Automatic Footbomb Dispenser, Algari Alchemist Stone, Shadowguard's Twisted Harvester, Symbiotic Ethergauze
                ["D"] = { 246944, 246945 },                                          -- Mind-Fracturing Odium, Incorporeal Essence-Gorger
            },
            ["Raid"] = {
                ["S"] = { 242401, 219309 },                                          -- Brand of Ceaseless Ire, Tome of Light's Devotion
                ["A"] = { 242396, 242403, 242397, 242395, 242391, 242402 },          -- Unyielding Netherprism, Perfidious Projector, Sigil of the Cosmic Hunt, Astral Antenna, Soulbinder's Embrace, Araz's Ritual Forge
                ["B"] = { 219312, 219317, 242399, 242404, 185818, 219314, 240213 },  -- Empowering Crystal of Anub'ikkaj, Harvester's Edict, Screams of a Forgotten Sky, All-Devouring Nucleus, So'leah's Secret Technique, Ara-Kara Sacbrood, Veiling Mana Shroud
                ["C"] = { 185836, 219316, 238390, 242867, 210816, 246824, 246941 },  -- Codex of the First Technique, Ceaseless Swarmgland, Soulbreaker's Sigil, Automatic Footbomb Dispenser, Algari Alchemist Stone, Shadowguard's Twisted Harvester, Symbiotic Ethergauze
                ["D"] = { 246944, 246945 },                                          -- Mind-Fracturing Odium, Incorporeal Essence-Gorger
            },
        }
    },

    -- MISTWEAVER (Spec ID: 270)
    [270] = {
        name = "Mistweaver",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 500, -- Gust of Mists: increased healing per point
        armorType = 2, -- Leather
        role = "HEALER",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [13] = true, -- Fist Weapons
            [6]  = true, -- Polearms
            [10] = true, -- Staves
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 4.00, HASTE = 1.05, CRIT = 0.53, VERS = 0.40, MASTERY = 0.26, STAMINA = 2.00, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.60, HASTE = 1.05, CRIT = 0.66, VERS = 0.49, MASTERY = 0.41, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.60, HASTE = 1.05, CRIT = 0.53, VERS = 0.40, MASTERY = 0.26, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.60, HASTE = 1.05, CRIT = 0.71, VERS = 0.39, MASTERY = 0.32, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 242393, 242392 },                  -- Loom'ithar's Living Silk, Diamantine Voidcore
                ["A"] = { 242395, 185818, 219312, 242497, 219314 }, -- Astral Antenna, So'leah's Secret Technique, Empowering Crystal of Anub'ikkaj, Azhiccaran Parapodia, Ara-Kara Sacbrood
                ["B"] = { 210816, 242400, 185845 },          -- Algari Alchemist Stone, Nexus-King's Command, First Class Healing Distributor
                ["C"] = { 219308, 246939, 242494 },          -- Signet of the Priory, Essence-Hunter's Eyeglass, Lily of the Eternal Weave
                ["D"] = { 232542, 246947, 242402 },          -- Darkfuse Medichopper, Twisted Mana Sprite, Araz's Ritual Forge
            },
            ["Raid"] = {
                ["S"] = { 242392, 242395 },                  -- Diamantine Voidcore, Astral Antenna
                ["A"] = { 185818, 219314, 242393, 219312 },  -- So'leah's Secret Technique, Ara-Kara Sacbrood, Loom'ithar's Living Silk, Empowering Crystal of Anub'ikkaj
                ["B"] = { 219308, 210816, 185845 },          -- Signet of the Priory, Algari Alchemist Stone, First Class Healing Distributor
                ["C"] = { 246939, 242400, 242402 },          -- Essence-Hunter's Eyeglass, Nexus-King's Command, Araz's Ritual Forge
                ["D"] = { 242494, 232542, 246940, 246947 },  -- Lily of the Eternal Weave, Darkfuse Medichopper, Manaforged Aethercell, Twisted Mana Sprite
            },
        }
    },

    -- INITIAL (Spec ID: 1450)
    [1450] = {
        name = "Initial",
        primary = "ITEM_MOD_AGILITY_SHORT",
        masteryFactor = 800,
        armorType = 2, -- Leather
        role = "LEVELING",
        canUseOffhand = true,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [13] = true, -- Fist Weapons
            [6]  = true, -- Polearms
            [10] = true, -- Staves
        },
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Monk Module Loaded.")
