# Hero Scale -- Gear Score and Item Comparison Addon for WoW

**Instant, accurate gear decisions for every class, every spec, every piece of content in World of Warcraft.**

Hero Scale is a gear scoring and item comparison addon for Retail WoW that tells you exactly what to equip and what to skip. It calculates a gear score for every item you encounter using spec-specific stat weights with real diminishing returns math, then shows upgrade or downgrade results right in the item tooltip -- no spreadsheets, no guesswork, no alt-tabbing to a website. Hover over any item and instantly know whether it is an upgrade, a sidegrade, or worth keeping for an off-spec based on your current stats.

---

## Features

- Supports **all 13 classes and all specs** -- Death Knight, Demon Hunter, Druid, Evoker, Hunter, Mage, Monk, Paladin, Priest, Rogue, Shaman, Warlock, and Warrior -- with hero talent-specific stat weights
- Five weight profiles per spec: **Leveling, Solo/Delves, Mythic+, Raid, and PVP**
- Real **diminishing returns** calculations using your live combat ratings
- Tier set **bonus protection** so you never accidentally break your 4-piece
- Upgrade **track awareness** (Adventurer through Myth) with max-potential scoring
- **Catalyst integration** with charge tracking and conversion priority
- Chevron overlays on items in bags, loot windows, group rolls, Great Vault, and quest rewards
- **Off-spec** evaluation with gear snapshots -- no need to switch specs to check
- Full **colorblind mode** support with five distinct palettes
- Works with **Baganator** and **Bagnon** bag addons out of the box
- **Zero configuration required** -- install it and go

---

## How Gear Scoring Works

### Stat Weight Scoring with Diminishing Returns

Every item is scored by multiplying each stat by its spec-appropriate weight. Secondary stats (Crit, Haste, Mastery, Versatility) are further adjusted by a bracket-based diminishing returns model that mirrors WoW's actual DR system. Your top two weighted secondaries receive relaxed DR brackets, reflecting the reality that stacking your best stats is expected and optimal.

The scoring covers everything on an item:

- **Primary stat** (Strength, Agility, or Intellect)
- **Secondary stats** with live DR adjustments
- **Stamina, Leech, Speed, Avoidance**
- **Weapon DPS** with role-appropriate multipliers
- **Empty sockets** valued at their stat-equivalent contribution

### Fair Item Comparison via Enchant/Gem Stripping

Equipped items are scored with enchants and gems stripped out, so the comparison reflects base item power only. This prevents your enchanted ring from looking artificially better than an unenchanted drop that is actually a raw upgrade.

### Accurate Diminishing Returns Model

The diminishing returns engine reads your actual rating-to-percentage conversion at your current level, meaning it stays accurate across patches, expansions, and level scaling without needing manual updates. Progressive penalty brackets apply as your secondary stat percentages climb:

| Rating Range | Penalty |
|---|---|
| 0 -- 30% | None |
| 30 -- 39% | 10% reduced value |
| 39 -- 47% | 20% reduced value |
| 47 -- 54% | 30% reduced value |
| 54 -- 66% | 40% reduced value |
| 66 -- 126% | 50% reduced value |
| 126%+ | Hard cap |

Your top two weighted stats get relaxed treatment (no penalty until 39%), because good gearing naturally concentrates your best stats.

---

## Tooltip Enhancement

Hovering over any item adds a **Hero Scale** section to its tooltip showing item level comparison results and upgrade percentages. You see exactly how the item compares to what you have equipped, broken down by slot when relevant.

### Upgrade and Downgrade Indicators

| Indicator | Meaning |
|---|---|
| **+X.X% upgrade** (green) | Direct score improvement over your equipped item |
| **-X.X% downgrade** (red) | Score loss compared to equipped |
| **Sidegrade** (gray) | Statistically equivalent |
| **Hero Track (upgradeable)** (yellow) | Lower score now, but can be upgraded past your current gear |
| **Set Upgrade (2/4 set, Hero Track)** (blue) | Tier piece that moves you toward your set bonus |
| **Set +N ilvl** (green) | Higher item level tier piece replacement |
| **Set Protected** (red) | Your equipped set piece is preserved to maintain your bonus |
| **Hero Track (catalyst)** (yellow) | Non-set item convertible to a tier piece via the Catalyst |
| **S-Tier (from B)** | Trinket tier movement based on curated tier lists |
| **Empty Slot** (green) | Nothing equipped in that slot -- any item is an upgrade |

For dual-slot equipment (rings, trinkets, one-handed weapons), the tooltip shows per-slot comparisons so you can see which slot benefits most.

Close-call comparisons (under 2% difference) and trinket tier evaluations are marked with *"(sim to verify)"* so you know when to double-check with a simulation tool.

### Off-Spec Results

Below your active spec results, off-spec upgrades appear in muted colors. Downgrades for off-specs are filtered out to keep the tooltip clean -- you only see items worth keeping for your other specs.

---

## Upgrade Indicator Overlays

Small chevron icons appear on item buttons throughout the UI so you can spot gear upgrades at a glance without hovering over every item.

| Chevron Color | Meaning |
|---|---|
| **Green** | Score upgrade for your active spec |
| **Blue** | Tier set piece needed for set bonus |
| **Yellow** | Higher upgrade track potential or catalyst conversion |
| **Teal** | Upgrade for one of your off-specs |

Chevrons appear on items in:

- **Bags** (default UI, combined bags, Baganator, and Bagnon)
- **Loot windows** when looting mobs and chests
- **Group loot roll frames** (Need/Greed/Transmog popups)
- **Great Vault** weekly reward selection
- **Quest reward frames** for both choice and guaranteed rewards

In bags, a smart filtering system limits chevrons to the best candidates per equipment slot group, preventing clutter when your bags are full of potential upgrades.

---

## Tier Set Bonus Protection

Hero Scale understands the WoW tier set system deeply and protects your set bonuses so you never accidentally break a 4-piece.

- **Set piece counting**: Tracks how many of the five tier slots (Helm, Shoulders, Chest, Gloves, Legs) you have filled with set items
- **Bonus transition scoring**: Gaining a 4-piece bonus adds +15% to an item's comparison score; gaining 2-piece adds +8%. Losing bonuses applies equivalent penalties. These modifiers are baked directly into the upgrade percentage so you see the true value of each swap.
- **Set protection**: Non-set items on the same or lower upgrade track will show as downgrades in tier slots, even if their raw stats are slightly higher. Your set bonus is too valuable to break by accident.
- **Set-to-set upgrades**: When a higher item level or higher track set piece drops, the addon recognizes it as a clean upgrade that preserves your bonus.

---

## Upgrade Track and Item Level Awareness

WoW's item upgrade system spans five tracks, each with a different maximum item level:

| Track | Max Item Level |
|---|---|
| Adventurer | 237 |
| Veteran | 250 |
| Champion | 263 |
| Hero | 276 |
| Myth | 289 |

Hero Scale does not just compare items at their current power level. When a candidate item is on a higher upgrade track than your equipped piece, the addon estimates its fully-upgraded score and compares that against what you are wearing. If the upgraded version would surpass your current gear, it flags the item as a **track upgrade** with a yellow indicator -- even if the item is currently weaker.

Lower-track items receive score penalties (2% for one tier below, 5% for two or more tiers below) to reflect their limited upgrade ceiling.

---

## Catalyst System

The addon tracks your Catalyst charges and identifies items that could be converted into tier set pieces.

- Detects catalyst-eligible items (non-set items in tier armor slots)
- Shows charge count directly in the tooltip: *"Hero Track (catalyst) - 2 charges"*
- Priority recommendations based on track tier and set bonus progress -- so you know which item to convert first

---

## Trinket Tier Evaluation

Trinkets are notoriously difficult to evaluate from stats alone. Hero Scale uses curated **S/A/B/C/D tier lists** for raid/mythic+ for each spec, showing tier movement when comparing trinkets (e.g., *"S-Tier (from B)"*). This helps you identify best in slot trinkets without leaving the game.

When a trinket is not in the tier list, the addon falls back to stat-based scoring. All trinket tier comparisons include a *"(sim to verify)"* note, because trinket performance is inherently context-dependent.

---

## Multi-Spec and Off-Spec Support

### Gear Snapshots

Hero Scale captures a snapshot of your equipped gear each time you change specs or swap equipment. These snapshots include item links, secondary stat breakdowns, and combat ratings. They persist across sessions, so your off-spec data stays current even if you don't switch specs often.

### Per-Spec Weight Profiles

Each spec saves its own content type selection independently. Your Havoc Demon Hunter can use Raid weights while your Vengeance spec uses Mythic+ weights -- the addon remembers both.

### Cross-Primary Scoring

When evaluating items for an off-spec that uses a different primary stat, the addon translates values appropriately so you get meaningful comparisons across roles.

---

## Hero Talent Awareness

Hero Scale auto-detects your active hero talent tree and applies the matching stat weights. Different hero talents within the same spec can shift secondary stat priorities significantly, and the addon accounts for this.

Characters below level 72 who have not yet unlocked hero talents use a "None" fallback weight profile that provides solid general-purpose scoring during the leveling process.

---

## Stat Weight Profiles by Content Type

Five stat weight profiles are available for each spec and hero talent combination, so your gear optimizer adjusts to the content you play:

| Profile | Best For |
|---|---|
| **Leveling** | Leveling and fresh endgame. Heavily favors primary stat and stamina to prefer higher item level. |
| **Solo/Delves** | Solo world content and Delves. Balanced endgame weights. |
| **Mythic+** | Dungeon keystones. Tuned for sustained AoE and dungeon pacing. |
| **Raid** | Raid encounters. Tuned for single-target and priority damage or healing. |
| **PVP** | Battlegrounds and Arena. Strongly favors Versatility. |

Switch profiles from the **Stat Weights** subpage in the addon's settings panel. Your selection is saved per-spec and applies immediately.

---

## Auto-Equip (Optional)

An optional auto-equip feature can be enabled in the settings panel. When turned on, the addon will automatically equip strict score upgrades from your bags after looting. It respects combat lockdown, uses cooldowns to avoid rapid swaps, and only equips items that are clear stat upgrades -- never track-only or set-only improvements. Disabled by default.

---

## Colorblind Accessibility

Hero Scale automatically detects your WoW colorblind settings and adjusts all colors -- tooltip text, chevron overlays, and muted off-spec variants -- to one of five optimized palettes:

| Setting | Palette |
|---|---|
| Default | Standard green / blue / yellow / red |
| Protanopia / Protanomaly | Adjusted for red-green color vision deficiency |
| Deuteranopia / Deuteranomaly | Adjusted for green color vision deficiency |
| Tritanopia / Tritanomaly | Adjusted for blue-yellow color vision deficiency |
| Achromatopsia / Achromatomaly | High-contrast grayscale |

If you change your colorblind settings mid-session, the addon updates immediately. All palette data is pre-computed at load time, so there is no performance cost.

---

## Settings Panel

Access Hero Scale's settings through **Interface > AddOns > Hero Scale**.

### Main Page
- **Auto-Equip Upgrades** toggle
- **Visual legend** showing all chevron colors and their meanings
- **Tooltip color reference** and track/catalyst information

### Stat Weights Subpage
- Your detected **spec and hero talent**
- **Weight profile selector** (Leveling / Solo/Delves / Mythic+ / Raid / PVP)
- **Base stat priority** ordering with raw weights
- **Live secondary stat breakdown**: base weight, effective weight after DR, current rating, percentage, and DR multiplier with color-coded severity
- **Effective priority** after diminishing returns (may differ from base if DR has shifted the ordering)
- Spec metadata: primary stat, role, armor type, equipped set pieces, weapon DPS weight

---

## Third-Party Bag Addon Support

Hero Scale integrates with popular bag replacement addons:

- **Baganator**: Uses Baganator's official plugin API for native chevron display and search/filter integration
- **Bagnon**: Hooks into Bagnon's item update system for seamless chevron overlays

Both integrations are optional, load-order safe, and require no configuration. If the bag addon is installed, Hero Scale detects it automatically.

---

## Performance

Hero Scale is designed to be lightweight:

- **Four-tier caching system** (scores, stripped links, DR multipliers, track data) minimizes redundant calculations
- Caches are invalidated precisely on spec and equipment changes using for zero garbage collection overhead
- All colorblind palette data is pre-computed once at load time
- Smart throttling (for bag scans) coalesces rapid events
- Only your class's data is loaded -- other class bloat
- All WoW API calls are centralized through a single wrapper layer for minimal overhead

---

## Installation

1. Download from CurseForge and extract to your `World of Warcraft/_retail_/Interface/AddOns/` folder
2. The folder should be named `HeroScale`
3. Log in or `/reload` -- that is it

No setup, no configuration, no importing stat weights from external sites. Hero Scale detects your class, spec, hero talents, and colorblind settings automatically and starts scoring gear immediately.

---

## Compatibility

- **WoW Version**: Patch 12.0.1 (Midnight), The War Within Season 3
- **Classes**: All 13 classes and all specializations
- **Bag Addons**: Baganator, Bagnon (optional, auto-detected)
- **Dependencies**: None
- **Saved Variables**: Per-character
