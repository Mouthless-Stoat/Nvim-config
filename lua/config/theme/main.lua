local utils = require("helper.utils")
local colors = require("config.theme.colors")

-- load all other color

local extra = { "syntax", "lazy", "telescope", "indent", "delimit", "hop", "fidget", "markdown" }
for _, m in ipairs(extra) do
    utils.setHls(require("config.theme." .. m))
end

-- now load the default nvim color
utils.setHls({
    Normal = { fg = colors.white, bg = colors.bg0 },

    -- Cursor color
    NCursor = { bg = colors.blue },
    ICursor = { bg = colors.green },
    VCursor = { bg = colors.purple },
    CCursor = { bg = colors.yellow },
    RCursor = { bg = colors.red },

    ErrorMsg = { fg = colors.red },
    MoreMsg = { fg = colors.blue },
    WarningMsg = { fg = colors.yellow },
    Question = { fg = colors.green },
    QuickFixLine = { fg = colors.purple },

    IncSearch = { fg = colors.yellow, bg = colors.yellow:blendbg(0.6) },
    Substitute = {
        fg = colors.purple:blend(colors.pure_white, 0.6),
        bg = colors.purple:blendbg(0.4),
    },
    Yank = { reverse = true },

    Visual = { fg = colors.bg0, bg = colors.purple },
    EndOfBuffer = { fg = colors.bg0 },

    LineNr = { fg = colors.gray, bg = colors.bg0 },
    CursorLineNr = { fg = colors.blue, bg = colors.bg0 },

    ModeMsg = { fg = colors.green },

    FloatBorder = { fg = colors.blue, bg = colors.bg1 },
    FloatTitle = { fg = colors.green, bg = colors.bg1 },

    NormalFloat = { fg = colors.white, bg = colors.bg1 },

    Directory = { fg = colors.blue },

    DiffAdd = { fg = colors.green, bg = colors.bg0, bold = true, italic = true },
    DiffChange = { fg = colors.yellow, bg = colors.bg0, bold = true, italic = true },
    DiffDelete = { fg = colors.red, bg = colors.bg0, bold = true, italic = true },
    DiffText = { fg = colors.blue, bg = colors.bg0, bold = true, italic = true },

    WinSeparator = { fg = colors.blue, bg = colors.bg1 },

    MatchParen = { fg = colors.bg0, bg = colors.purple },

    MsgArea = { fg = colors.yellow, bg = colors.bg0 },

    SpellBad = { fg = colors.red },
    SpellCap = { fg = colors.blue },
    SpellLocal = { fg = colors.yellow },
    SpellRare = { fg = colors.green },

    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = colors.yellow },
    DiagnosticInfo = { fg = colors.blue },
    DiagnosticHint = { fg = colors.purple },
    DiagnosticOk = { fg = colors.green },

    DiagnosticUnderlineError = { fg = colors.red, underline = true },
    DiagnosticUnderlineWarn = { fg = colors.yellow, underline = true },
    DiagnosticUnderlineInfo = { fg = colors.blue, underline = true },
    DiagnosticUnderlineHint = { fg = colors.purple, underline = true },
    DiagnosticUnderlineOk = { fg = colors.green, underline = true },

    Changed = { fg = colors.yellow, bold = true },
    Added = { fg = colors.green, bold = true },
    Removed = { fg = colors.red, bold = true },

    DiagnosticDeprecated = {},
})

utils.setHls({
    Green = { fg = colors.green, bold = true },
    Yellow = { fg = colors.yellow, bold = true },
    Orange = { fg = colors.orange, bold = true },
    Red = { fg = colors.red, bold = true },
    Blue = { fg = colors.blue, bold = true },
    Cyan = { fg = colors.cyan, bold = true },
    Purple = { fg = colors.purple, bold = true },
})

vim.o.guicursor = "n-o:block-NCursor,i:ver20-ICursor,v-ve:block-VCursor,c-ci-cr:ver25-CCursor,r:hor15-RCursor"

vim.g.terminal_color_0 = colors.bg
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.blue
vim.g.terminal_color_5 = colors.purple
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = colors.fg
vim.g.terminal_color_8 = colors.grey
vim.g.terminal_color_9 = colors.red
vim.g.terminal_color_10 = colors.green
vim.g.terminal_color_11 = colors.yellow
vim.g.terminal_color_12 = colors.blue
vim.g.terminal_color_13 = colors.purple
vim.g.terminal_color_14 = colors.cyan
vim.g.terminal_color_15 = colors.fg
