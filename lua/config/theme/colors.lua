local colors = {
    green = "#8bcd5b",

    yellow = "#efbd5d",

    red = "#f65866",

    blue = "#41a7fc",

    cyan = "#34bfd0",

    purple = "#c75ae8",

    orange = "#fa9534",

    magenta = "#ff0084",

    white = "#93a4c3",

    bg0 = "#101010",
    bg1 = "#1a1a1a",
    bg2 = "#232323",
    bg3 = "#2d2d2d",

    pure_white = "#ffffff",

    gray = "#455574",
}

local function hex_to_rgb(hex)
    hex = hex:gsub("#", "")
    return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

local function rgb_to_hex(r, g, b)
    return string.format("#%02x%02x%02x", r, g, b)
end

function string.blend(self, color, percentage)
    local rA, gA, bA = hex_to_rgb(self)
    local rB, gB, bB = hex_to_rgb(color)

    local r = rA + (rB - rA) * percentage
    local g = gA + (gB - gA) * percentage
    local b = bA + (bB - bA) * percentage

    return rgb_to_hex(math.floor(r), math.floor(g), math.floor(b))
end

function string.blendbg(self, percentage)
    return self:blend(colors.bg0, percentage)
end

return colors
