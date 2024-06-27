local colors = require("config.theme.colors")

-- base group
return {
    Comment = { fg = colors.gray, italic = true },
    String = { fg = colors.green },
    Number = { fg = colors.orange },
    Float = { link = "Number" },
    Boolean = { fg = colors.orange },
    Character = { fg = colors.orange },

    Identifier = { fg = colors.red },
    Constant = { fg = colors.yellow },
    Member = { fg = colors.cyan },
    Builtin = { fg = colors.purple },

    Function = { fg = colors.blue },
    Statement = { fg = colors.purple },
    Keyword = { fg = colors.purple },

    PreProc = { fg = colors.purple },
    Type = { fg = colors.orange },

    Operator = { fg = colors.cyan },
    Special = { fg = colors.cyan },
    Delimiter = { fg = colors.gray },

    -- treesitter
    ["@variable"] = { link = "Identifier" },
    ["@variable.member"] = { link = "Member" },
    ["@variable.builtin"] = { link = "Builtin" },

    ["@string.regex"] = { fg = colors.orange },
    ["@string.escape"] = { fg = colors.red },
    ["@type.builtin"] = { link = "Type" },

    -- Lsp semantics token
    ["@lsp.type.property"] = { link = "Member" },

    ["@lsp.type.struct"] = { link = "Constant" },
    ["@lsp.type.enum"] = { link = "Constant" },
}
