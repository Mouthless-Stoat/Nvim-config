local colors = require("config.theme.colors")
return {
    TelescopePromptNormal = { bg = colors.bg3 },
    TelescopeResultsNormal = { bg = colors.bg2 },
    TelescopePreviewNormal = { bg = colors.bg1 },

    TelescopeSelection = { fg = colors.blue, bg = colors.bg3 },
    TelescopeSelectionCaret = { fg = colors.green, bg = colors.bg2 },
    TelescopeMatching = { fg = colors.red, bold = true },

    TelescopePromptBorder = { fg = colors.bg3, bg = colors.bg3 },
    TelescopeResultsBorder = { fg = colors.bg2, bg = colors.bg2 },
    TelescopePreviewBorder = { fg = colors.bg1, bg = colors.bg1 },

    TelescopePromptTitle = { fg = colors.bg1, bg = colors.blue },
    TelescopeResultsTitle = { fg = colors.bg1, bg = colors.yellow },
    TelescopePreviewTitle = { fg = colors.bg1, bg = colors.red },

    TelescopePromptCounter = { fg = colors.purple },
    TelescopePromptPrefix = { fg = colors.purple },
}
