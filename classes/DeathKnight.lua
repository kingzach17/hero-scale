local _, playerClass = UnitClass("player")
if playerClass ~= "DEATHKNIGHT" then return end

local _, Addon = ...

-- Ensure the table exists in the master object
Addon.ClassData["DEATHKNIGHT"] = {
    -- BLOOD (Spec ID: 250)
    [250] = {
        name = "Blood",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 227, -- Blood Shield: 2% absorption from Death Strike + 1% AP per point
        armorType = 4, -- Plate
        role = "TANK",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [1]  = true, -- Two-Handed Axes
            [5]  = true, -- Two-Handed Maces
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 3.00, HASTE = 1.05, VERS = 1.03, MASTERY = 0.89, CRIT = 0.65, STAMINA = 2.50, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Solo/Delves"]  = { PRIMARY = 1.20, CRIT = 1.05, MASTERY = 1.04, HASTE = 1.00, VERS = 0.76, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Mythic+"]      = { PRIMARY = 1.20, HASTE = 1.05, VERS = 1.03, MASTERY = 0.89, CRIT = 0.65, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
            ["Raid"]         = { PRIMARY = 1.20, CRIT = 1.05, HASTE = 0.93, MASTERY = 0.74, VERS = 0.65, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.5, SOCKET_VALUE = 70 },
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
                ["S"] = { 242396, 219309 },                     -- Unyielding Netherprism, Tome of Light's Devotion
                ["A"] = { 242394, 242401, 190958, 219314, 246344 }, -- Eradicating Arcanocore, Brand of Ceaseless Ire, So'leah's Secret Technique, Ara-Kara Sacbrood, Cursed Stone Idol
                ["B"] = { 242395, 242403, 242399, 219311, 232541, 190652, 242495, 246945, 238390 }, -- Astral Antenna, Perfidious Projector, Screams of a Forgotten Sky, Void Pactstone, Improvised Seaforium Pacemaker, Ticking Sack of Terror, Incorporeal Warpclaw, Incorporeal Essence-Gorger, Soulbreaker's Sigil
                ["C"] = { 242402, 238386 },                     -- Araz's Ritual Forge, Void-Touched Fragment
                ["D"] = { 246944 },                             -- Mind-Fracturing Odium
            },
            ["Raid"] = {
                ["S"] = { 242396, 242401 },                     -- Unyielding Netherprism, Brand of Ceaseless Ire
                ["A"] = { 242394, 219309, 242391, 190958, 219314 }, -- Eradicating Arcanocore, Tome of Light's Devotion, Soulbinder's Embrace, So'leah's Secret Technique, Ara-Kara Sacbrood
                ["B"] = { 242395, 242403, 242399, 232541, 190652 }, -- Astral Antenna, Perfidious Projector, Screams of a Forgotten Sky, Improvised Seaforium Pacemaker, Ticking Sack of Terror
                ["C"] = { 242402, 238386 },                     -- Araz's Ritual Forge, Void-Touched Fragment
                ["D"] = { 246944 },                             -- Mind-Fracturing Odium
            },
        }
    },

    -- FROST (Spec ID: 251)
    [251] = {
        name = "Frost",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 500, -- Frozen Heart: 2% Frost damage per point
        armorType = 4, -- Plate
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [1]  = true, -- Two-Handed Axes
            [5]  = true, -- Two-Handed Maces
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, MASTERY = 1.05, CRIT = 1.00, HASTE = 0.85, VERS = 0.75, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.99, HASTE = 0.69, VERS = 0.28, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 1.00, HASTE = 0.85, VERS = 0.75, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.95, HASTE = 0.85, VERS = 0.75, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 6.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 242395, 246344, 242402, 242396 },     -- Astral Antenna, Cursed Stone Idol, Araz's Ritual Forge, Unyielding Netherprism
                ["A"] = { 232541, 242399, 242394, 219308, 219314, 190958 }, -- Improvised Seaforium Pacemaker, Screams of a Forgotten Sky, Eradicating Arcanocore, Signet of the Priory, Ara-Kara Sacbrood, So'leah's Secret Technique
                ["B"] = { 219311, 190652, 242495 },              -- Void Pactstone, Ticking Sack of Terror, Incorporeal Warpclaw
                ["C"] = { 242403, 238386, 238390, 246945 },      -- Perfidious Projector, Void-Touched Fragment, Soulbreaker's Sigil, Incorporeal Essence-Gorger
                ["D"] = { 246944 },                             -- Mind-Fracturing Odium
            },
            ["Raid"] = {
                ["S"] = { 242395, 242402, 242396 },              -- Astral Antenna, Araz's Ritual Forge, Unyielding Netherprism
                ["A"] = { 246344, 232541, 242399, 242394, 219308, 219314, 190958 }, -- Cursed Stone Idol, Improvised Seaforium Pacemaker, Screams of a Forgotten Sky, Eradicating Arcanocore, Signet of the Priory, Ara-Kara Sacbrood, So'leah's Secret Technique
                ["B"] = { 219311, 190652, 242495 },              -- Void Pactstone, Ticking Sack of Terror, Incorporeal Warpclaw
                ["C"] = { 242403, 238386, 238390, 246945 },      -- Perfidious Projector, Void-Touched Fragment, Soulbreaker's Sigil, Incorporeal Essence-Gorger
                ["D"] = { 246944 },                             -- Mind-Fracturing Odium
            },
        }
    },

    -- UNHOLY (Spec ID: 252)
    [252] = {
        name = "Unholy",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 555, -- Dreadblade: 1.8% minion/shadow + 0.2% crit per point
        armorType = 4, -- Plate
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [1]  = true, -- Two-Handed Axes
            [5]  = true, -- Two-Handed Maces
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, MASTERY = 1.05, CRIT = 0.95, HASTE = 0.85, VERS = 0.78, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.84, HASTE = 0.70, VERS = 0.24, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.95, HASTE = 0.85, VERS = 0.78, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 0.95, HASTE = 0.85, VERS = 0.78, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 246344 },                             -- Cursed Stone Idol
                ["A"] = { 242402, 242395, 219308, 232541, 219314 }, -- Araz's Ritual Forge, Astral Antenna, Signet of the Priory, Improvised Seaforium Pacemaker, Ara-Kara Sacbrood
                ["B"] = { 242399, 242396, 219312, 242495 },      -- Screams of a Forgotten Sky, Unyielding Netherprism, Empowering Crystal of Anub'ikkaj, Incorporeal Warpclaw
                ["C"] = { 190958, 238386 },                      -- So'leah's Secret Technique, Void-Touched Fragment
                ["D"] = {},
            },
            ["Raid"] = {
                ["S"] = { 246344, 242402 },                     -- Cursed Stone Idol, Araz's Ritual Forge
                ["A"] = { 242395, 219308, 232541, 242396 },     -- Astral Antenna, Signet of the Priory, Improvised Seaforium Pacemaker, Unyielding Netherprism
                ["B"] = { 242399, 219314, 219312 },              -- Screams of a Forgotten Sky, Ara-Kara Sacbrood, Empowering Crystal of Anub'ikkaj
                ["C"] = { 190958, 238386 },                      -- So'leah's Secret Technique, Void-Touched Fragment
                ["D"] = {},
            },
        }
    },

    -- INITIAL (Spec ID: 1455)
    [1455] = {
        name = "Initial",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 800,
        armorType = 4, -- Plate
        role = "LEVELING",
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [4]  = true, -- One-Handed Maces
            [7]  = true, -- One-Handed Swords
            [1]  = true, -- Two-Handed Axes
            [5]  = true, -- Two-Handed Maces
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
        },
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Death Knight Module Loaded.")
