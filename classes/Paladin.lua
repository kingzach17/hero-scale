local _, playerClass = UnitClass("player")
if playerClass ~= "PALADIN" then return end

local _, Addon = ...

-- Ensure the table exists in the master object
Addon.ClassData["PALADIN"] = {
    -- HOLY (Spec ID: 65)
    [65] = {
        name = "Holy",
        primary = "ITEM_MOD_INTELLECT_SHORT",
        masteryFactor = 952, -- Lightbringer: increased healing based on proximity
        armorType = 4, -- Plate
        role = "HEALER",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        canUseOffhand = true, -- shield
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
            ["Leveling"]     = { PRIMARY = 4.00, HASTE = 1.05, CRIT = 0.48, MASTERY = 0.47, VERS = 0.42, STAMINA = 2.00, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.60, HASTE = 1.05, CRIT = 0.76, MASTERY = 0.62, VERS = 0.37, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.60, HASTE = 1.05, CRIT = 0.48, MASTERY = 0.47, VERS = 0.42, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.60, HASTE = 1.05, MASTERY = 0.77, CRIT = 0.73, VERS = 0.30, STAMINA = 0.40, LEECH = 0.12, SPEED = 0.05, AVOIDANCE = 0.10, WEAPON_DPS = 1.5, SOCKET_VALUE = 65 },
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
                ["S"] = { 242393, 242395 },                                     -- Loom'ithar's Living Silk, Astral Antenna
                ["A"] = { 190958, 242392, 219312, 242400 },                     -- So'leah's Secret Technique, Diamantine Voidcore, Empowering Crystal of Anub'ikkaj, Nexus-King's Command
                ["B"] = { 219314, 219308, 242497, 185845 },                     -- Ara-Kara Sacbrood, Signet of the Priory, Azhiccaran Parapodia, First Class Healing Distributor
                ["C"] = { 242494, 242402 },                                     -- Lily of the Eternal Weave, Araz's Ritual Forge
                ["D"] = { 219317, 238386, 242867 },                             -- Harvester's Edict, Void-Touched Fragment, Automatic Footbomb Dispenser
            },
            ["Raid"] = {
                ["S"] = { 242392, 242400, 242393 },                             -- Diamantine Voidcore, Nexus-King's Command, Loom'ithar's Living Silk
                ["A"] = { 242395, 190958, 219312 },                             -- Astral Antenna, So'leah's Secret Technique, Empowering Crystal of Anub'ikkaj
                ["B"] = { 219314, 219308, 242497, 242494, 242402 },             -- Ara-Kara Sacbrood, Signet of the Priory, Azhiccaran Parapodia, Lily of the Eternal Weave, Araz's Ritual Forge
                ["C"] = { 185845, 246940 },                                     -- First Class Healing Distributor, Manaforged Aethercell
                ["D"] = { 219317, 238386, 242867 },                             -- Harvester's Edict, Void-Touched Fragment, Automatic Footbomb Dispenser
            },
        }
    },

    -- PROTECTION (Spec ID: 66)
    [66] = {
        name = "Protection",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 800, -- Divine Bulwark: increased block chance and attack power
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
            ["Leveling"]     = { PRIMARY = 3.00, HASTE = 1.05, MASTERY = 0.50, VERS = 0.45, CRIT = 0.30, STAMINA = 2.50, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.0, SOCKET_VALUE = 70 },
            ["Solo/Delves"]  = { PRIMARY = 1.20, HASTE = 1.05, CRIT = 0.92, MASTERY = 0.66, VERS = 0.35, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.0, SOCKET_VALUE = 70 },
            ["Mythic+"]      = { PRIMARY = 1.20, HASTE = 1.05, MASTERY = 0.50, VERS = 0.45, CRIT = 0.30, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.0, SOCKET_VALUE = 70 },
            ["Raid"]         = { PRIMARY = 1.20, HASTE = 1.05, CRIT = 1.00, MASTERY = 0.60, VERS = 0.30, STAMINA = 1.00, LEECH = 0.15, SPEED = 0.06, AVOIDANCE = 0.12, WEAPON_DPS = 3.0, SOCKET_VALUE = 70 },
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
                ["S"] = { 242401, 232541 },                                     -- Brand of Ceaseless Ire, Improvised Seaforium Pacemaker
                ["A"] = { 242395, 219309, 219314, 232543 },                     -- Astral Antenna, Tome of Light's Devotion, Ara-Kara Sacbrood, Ringing Ritual Mud
                ["B"] = { 242404, 190958, 219308, 246344 },                     -- All-Devouring Nucleus, So'leah's Secret Technique, Signet of the Priory, Cursed Stone Idol
                ["C"] = { 242402, 242391, 219311 },                             -- Araz's Ritual Forge, Soulbinder's Embrace, Void Pactstone
                ["D"] = { 242867, 238386, 246944 },                             -- Automatic Footbomb Dispenser, Void-Touched Fragment, Mind-Fracturing Odium
            },
            ["Raid"] = {
                ["S"] = { 242401, 232541, 219309, 232543, 190652 },             -- Brand of Ceaseless Ire, Improvised Seaforium Pacemaker, Tome of Light's Devotion, Ringing Ritual Mud, Ticking Sack of Terror
                ["A"] = { 242402, 242395, 242403, 219308, 219314, 242399, 242396 }, -- Araz's Ritual Forge, Astral Antenna, Perfidious Projector, Signet of the Priory, Ara-Kara Sacbrood, Screams of a Forgotten Sky, Unyielding Netherprism
                ["B"] = { 242404, 219316, 242495, 246344, 185846 },             -- All-Devouring Nucleus, Ceaseless Swarmgland, Incorporeal Warpclaw, Cursed Stone Idol, Miniscule Mailemental in an Envelope
                ["C"] = { 185836, 190958, 238386, 242867, 246944, 238390, 240213 }, -- Codex of the First Technique, So'leah's Secret Technique, Void-Touched Fragment, Automatic Footbomb Dispenser, Mind-Fracturing Odium, Soulbreaker's Sigil, Veiling Mana Shroud
                ["D"] = { 246825 },                                             -- Chaotic Nethergate
            },
        }
    },

    -- RETRIBUTION (Spec ID: 70)
    [70] = {
        name = "Retribution",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 1180, -- Hand of Light: extra holy damage per point
        armorType = 4, -- Plate
        role = "MELEE_DPS",
        preferredEmbellishments = {},
        setBonusValues = { twoPiece = 500, fourPiece = 1500 },
        targetRatios = nil,
        allowedWeaponTypes = {
            [1]  = true, -- Two-Handed Axes
            [5]  = true, -- Two-Handed Maces
            [8]  = true, -- Two-Handed Swords
            [6]  = true, -- Polearms
        },
        weights = {
            ["Leveling"]     = { PRIMARY = 5.00, HASTE = 1.05, MASTERY = 0.81, CRIT = 0.61, VERS = 0.23, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 7.0, SOCKET_VALUE = 65 },
            ["Solo/Delves"]  = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 1.03, HASTE = 1.00, VERS = 0.31, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 7.0, SOCKET_VALUE = 65 },
            ["Mythic+"]      = { PRIMARY = 1.50, HASTE = 1.05, MASTERY = 0.81, CRIT = 0.61, VERS = 0.23, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 7.0, SOCKET_VALUE = 65 },
            ["Raid"]         = { PRIMARY = 1.50, MASTERY = 1.05, CRIT = 1.03, HASTE = 0.83, VERS = 0.21, STAMINA = 0.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 7.0, SOCKET_VALUE = 65 },
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
                ["S"] = { 242395, 232541 },                                     -- Astral Antenna, Improvised Seaforium Pacemaker
                ["A"] = { 242402, 219308, 219314, 246344 },                     -- Araz's Ritual Forge, Signet of the Priory, Ara-Kara Sacbrood, Cursed Stone Idol
                ["B"] = { 242399, 242394, 190958, 219311 },                     -- Screams of a Forgotten Sky, Eradicating Arcanocore, So'leah's Secret Technique, Void Pactstone
                ["C"] = { 242495, 242396 },                                     -- Incorporeal Warpclaw, Unyielding Netherprism
                ["D"] = { 242403, 238386, 242867 },                             -- Perfidious Projector, Void-Touched Fragment, Automatic Footbomb Dispenser
            },
            ["Raid"] = {
                ["S"] = { 242402, 242395 },                                     -- Araz's Ritual Forge, Astral Antenna
                ["A"] = { 232541, 242399, 219308, 242394 },                     -- Improvised Seaforium Pacemaker, Screams of a Forgotten Sky, Signet of the Priory, Eradicating Arcanocore
                ["B"] = { 219314, 246344, 190958, 242396 },                     -- Ara-Kara Sacbrood, Cursed Stone Idol, So'leah's Secret Technique, Unyielding Netherprism
                ["C"] = { 190652, 242403, 242495 },                             -- Ticking Sack of Terror, Perfidious Projector, Incorporeal Warpclaw
                ["D"] = { 238386, 242867, 238390 },                             -- Void-Touched Fragment, Automatic Footbomb Dispenser, Soulbreaker's Sigil
            },
        }
    },

    -- INITIAL (Spec ID: 1451)
    [1451] = {
        name = "Initial",
        primary = "ITEM_MOD_STRENGTH_SHORT",
        masteryFactor = 800,
        armorType = 4, -- Plate
        role = "LEVELING",
        canUseOffhand = true,
        allowedWeaponTypes = {
            [0]  = true, -- One-Handed Axes
            [1]  = true, -- Two-Handed Axes
            [4]  = true, -- One-Handed Maces
            [5]  = true, -- Two-Handed Maces
            [6]  = true, -- Polearms
            [7]  = true, -- One-Handed Swords
            [8]  = true, -- Two-Handed Swords
        },
        weights = {
            ["Leveling"] = { PRIMARY = 5.00, CRIT = 0.90, HASTE = 0.90, MASTERY = 0.90, VERS = 0.90, STAMINA = 2.00, LEECH = 0.08, SPEED = 0.04, AVOIDANCE = 0.10, WEAPON_DPS = 5.0, SOCKET_VALUE = 65 },
        },
    },
}

print("|cff00ccffHero Scale:|r Paladin Module Loaded.")
