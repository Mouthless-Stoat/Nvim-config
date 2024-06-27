local colors = require("config.theme.colors")

return {
    LazyNormal = {bg = colors.black1},
    LazyButton = {bg = colors.black0},
    LazyButtonActive = {fg = colors.blue, bg = colors.black0},
    LazySpecial = {fg = colors.blue},

    LazyH1 = {fg = colors.black0, bg = colors.blue},
    LazyH2 = {fg = colors.blue, bold = true},

    LazyReasonCmd = { fg = colors.yellow },
    LazyReasonEvent = { fg = colors.cyan },
    LazyReasonFt = { fg = colors.blue },
    LazyReasonKeys = { fg = colors.purple },
    LazyReasonPlugin = { fg = colors.red },
    LazyReasonStart = { fg = colors.green },
}

