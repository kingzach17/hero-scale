local _, Addon = ...
local API = Addon.API

local CHEVRON_PATH = "Interface\\AddOns\\HeroScale\\assets\\chevron"
Addon.CHEVRON_PATH = CHEVRON_PATH

-- ============================================================
-- Helpers (used only at load time to pre-compute palettes)
-- ============================================================
local function HexToRGB01(hex)
    return tonumber(hex:sub(1, 2), 16) / 255,
           tonumber(hex:sub(3, 4), 16) / 255,
           tonumber(hex:sub(5, 6), 16) / 255
end

local function HexToRGB255(hex)
    return tonumber(hex:sub(1, 2), 16),
           tonumber(hex:sub(3, 4), 16),
           tonumber(hex:sub(5, 6), 16)
end

local function MuteHex(hex)
    local r, g, b = HexToRGB255(hex)
    r = math.floor(r * 0.6 + 128 * 0.4)
    g = math.floor(g * 0.6 + 128 * 0.4)
    b = math.floor(b * 0.6 + 128 * 0.4)
    return string.format("%02x%02x%02x", r, g, b)
end

-- ============================================================
-- Pre-computed Palette Builder
-- ============================================================
local TEX_FMT = "|T" .. CHEVRON_PATH .. ":0:0:0:0:64:64:0:64:0:64:%d:%d:%d|t"

local function BuildPalette(green, blue, yellow, red, offspec)
    local p = {}

    -- Base hex colors
    p.GREEN  = green
    p.BLUE   = blue
    p.YELLOW = yellow
    p.RED    = red
    p.GRAY   = "888888"

    -- Muted (off-spec) variants
    p.GREEN_MUTED  = MuteHex(green)
    p.BLUE_MUTED   = MuteHex(blue)
    p.YELLOW_MUTED = MuteHex(yellow)
    p.RED_MUTED    = MuteHex(red)
    p.GRAY_MUTED   = "aaaaaa"

    -- Chevron overlay RGB (0-1 range for SetVertexColor)
    p.CHEVRON_GREEN_R,  p.CHEVRON_GREEN_G,  p.CHEVRON_GREEN_B  = HexToRGB01(green)
    p.CHEVRON_BLUE_R,   p.CHEVRON_BLUE_G,   p.CHEVRON_BLUE_B   = HexToRGB01(blue)
    p.CHEVRON_YELLOW_R, p.CHEVRON_YELLOW_G, p.CHEVRON_YELLOW_B = HexToRGB01(yellow)
    p.CHEVRON_GREEN_MUTED_R, p.CHEVRON_GREEN_MUTED_G, p.CHEVRON_GREEN_MUTED_B = HexToRGB01(p.GREEN_MUTED)

    -- Off-spec overlay chevron color (distinct from muted green for tooltips)
    p.OFFSPEC = offspec
    p.CHEVRON_OFFSPEC_R, p.CHEVRON_OFFSPEC_G, p.CHEVRON_OFFSPEC_B = HexToRGB01(offspec)

    -- Inline chevron textures for tooltip lines
    local gr, gg, gb = HexToRGB255(green)
    local br, bg, bb = HexToRGB255(blue)
    local yr, yg, yb = HexToRGB255(yellow)
    local mgr, mgg, mgb = HexToRGB255(p.GREEN_MUTED)
    local mbr, mbg, mbb = HexToRGB255(p.BLUE_MUTED)
    local myr, myg, myb = HexToRGB255(p.YELLOW_MUTED)

    p.TEX_GREEN        = string.format(TEX_FMT, gr, gg, gb)
    p.TEX_GREEN_MUTED  = string.format(TEX_FMT, mgr, mgg, mgb)
    p.TEX_BLUE         = string.format(TEX_FMT, br, bg, bb)
    p.TEX_BLUE_MUTED   = string.format(TEX_FMT, mbr, mbg, mbb)
    p.TEX_YELLOW       = string.format(TEX_FMT, yr, yg, yb)
    p.TEX_YELLOW_MUTED = string.format(TEX_FMT, myr, myg, myb)

    return p
end

-- ============================================================
-- Palette Definitions (all derived values computed once here)
-- ============================================================
local PALETTES = {
    default        = BuildPalette("6ef785", "28c2ff", "fff34f", "d1495b", "2ee8c8"),
    protanopia     = BuildPalette("a9aaa0", "6a6cf0", "f9f976", "969456", "6ac8b8"),
    deuteranopia   = BuildPalette("a197a7", "6156ec", "fafb80", "9ea855", "60c0b0"),
    tritanopia     = BuildPalette("74b6bb", "2fe4e2", "fe969c", "ca5352", "9ed0a0"),
    achromatopsia  = BuildPalette("ffffff", "aaaaaa", "cccccc", "555555", "777777"),
}

local CVAR_TO_PALETTE = {
    [0] = "default",
    [1] = "protanopia",     [2] = "protanopia",
    [3] = "deuteranopia",   [4] = "deuteranopia",
    [5] = "tritanopia",     [6] = "tritanopia",
    [7] = "achromatopsia",  [8] = "achromatopsia",
}

-- ============================================================
-- Active Color Table (referenced by Overlay.lua and Core.lua)
-- ============================================================
local C = {}
Addon.Colors = C

-- Initialize with default palette
for k, v in pairs(PALETTES.default) do
    C[k] = v
end

-- ============================================================
-- Colorblind Palette Application (auto-detected via WoW CVars)
-- ============================================================
local activePaletteKey = nil

function Addon:ApplyColorblindPalette()
    local paletteKey = "default"
    local mode = API:GetCVar("colorblindMode")
    if mode == "1" then
        local sim = tonumber(API:GetCVar("colorblindsimulator")) or 0
        paletteKey = CVAR_TO_PALETTE[sim] or "default"
    end

    if paletteKey == activePaletteKey then return end
    activePaletteKey = paletteKey

    local p = PALETTES[paletteKey]
    for k, v in pairs(p) do
        C[k] = v
    end
end
