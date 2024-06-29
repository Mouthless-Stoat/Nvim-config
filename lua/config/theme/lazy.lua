local colors = require("config.theme.colors")

return {
    LazyNormal = { bg = colors.bg1 },
    LazyButton = { bg = colors.bg0 },
    LazyButtonActive = { fg = colors.blue, bg = colors.bg0 },
    LazySpecial = { fg = colors.blue },

    LazyH1 = { fg = colors.bg0, bg = colors.blue },
    LazyH2 = { fg = colors.blue, bold = true },

    LazyReasonCmd = { fg = colors.yellow },
    LazyReasonEvent = { fg = colors.cyan },
    LazyReasonFt = { fg = colors.blue },
    LazyReasonKeys = { fg = colors.purple },
    LazyReasonPlugin = { fg = colors.red },
    LazyReasonStart = { fg = colors.green },
}
