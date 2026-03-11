local addonName, Addon = ...
_G["HeroScale"] = Addon

Addon.ClassData = {}
Addon.ActiveWeights = nil
Addon.ActiveSpecData = nil
Addon.ScoreCache = {}
Addon.StrippedLinkCache = {}
Addon.DRCache = {}
Addon.SpecSnapshots = {}
Addon.ActiveContentType = "Leveling"
Addon.ActiveSpecName = nil
Addon.ActiveRole = nil
Addon.ContentTypes = { "Leveling", "Solo/Delves", "Mythic+", "Raid" }
