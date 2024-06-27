local colors = require("config.theme.colors")
return {
    TelescopePromptNormal = { bg = colors.black3 },
    TelescopeResultsNormal = { bg = colors.black2 },
    TelescopePreviewNormal = { bg = colors.black1 },

    TelescopeSelection = { fg = colors.blue, bg = colors.black3 },
    TelescopeSelectionCaret = { fg = colors.green, bg = colors.black2 },
    TelescopeMatching = { fg = colors.red, bold = true },

    TelescopePromptBorder = { fg = colors.black3, bg = colors.black3 },
    TelescopeResultsBorder = { fg = colors.black2, bg = colors.black2 },
    TelescopePreviewBorder = { fg = colors.black1, bg = colors.black1 },

    TelescopePromptTitle = { fg = colors.black1, bg = colors.blue },
    TelescopeResultsTitle = { fg = colors.black1, bg = colors.yellow },
    TelescopePreviewTitle = { fg = colors.black1, bg = colors.red },

    TelescopePromptCounter = { fg = colors.purple },
    TelescopePromptPrefix = { fg = colors.purple }
}
