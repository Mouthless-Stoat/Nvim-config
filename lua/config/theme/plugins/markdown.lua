---@diagnostic disable: param-type-mismatch
local colors = require("config.theme.colors")

return {

    ["@markup.heading.1"] = { fg = colors.blue, bg = colors.blue:blendbg(0.7) },
    ["@markup.heading.2"] = { fg = colors.green, bg = colors.green:blendbg(0.7) },
    ["@markup.heading.3"] = { fg = colors.yellow, bg = colors.yellow:blendbg(0.7) },
    ["@markup.heading.4"] = { fg = colors.orange, bg = colors.orange:blendbg(0.7) },
    ["@markup.heading.5"] = { fg = colors.red, bg = colors.red:blendbg(0.7) },
    ["@markup.heading.6"] = { fg = colors.purple, bg = colors.purple:blendbg(0.7) },

    RenderMarkdownH1Bg = { link = "@markup.heading.1" },
    RenderMarkdownH2Bg = { link = "@markup.heading.2" },
    RenderMarkdownH3Bg = { link = "@markup.heading.3" },
    RenderMarkdownH4Bg = { link = "@markup.heading.4" },
    RenderMarkdownH5Bg = { link = "@markup.heading.5" },
    RenderMarkdownH6Bg = { link = "@markup.heading.6" },

    RenderMarkdownCode = { bg = colors.bg1 },
    RenderMarkDownCodeInline = { fg = colors.yellow, bg = colors.bg3 },

    RenderMarkdownBullet = { fg = colors.blue },

    RenderMarkdownQuote = { fg = colors.purple },

    RenderMarkdownLink = { fg = colors.blue },

    RenderMarkdownDash = { fg = colors.yellow },

    RenderMarkdownUnchecked = { fg = colors.red, bg = colors.red:blendbg(0.7) },
    RenderMarkdownChecked = { fg = colors.green, bg = colors.green:blendbg(0.7) },
    RenderMarkdownTodo = { fg = colors.yellow, bg = colors.yellow:blendbg(0.7) },

    -- syntax
    ["@markup.link"] = { fg = colors.blue, bold = true },
    ["@markup.quote"] = { fg = colors.gray },
    ["@markup.raw"] = { fg = colors.yellow, bg = colors.bg3 },
    markdownCodeDelimiter = { fg = colors.green },
}
