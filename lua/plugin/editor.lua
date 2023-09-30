local utils = require("utils")
return {
    {
        -- editor theme
        "navarasu/onedark.nvim",
        priority = 1000,
        config = function()
            require("onedark").setup({
                style = "deep",
                colors = {
                    bg0 = "#000000",
                    bg1 = "#000f34",
                    bg2 = "#001a3e",
                    bg3 = "#072349",
                    -- lualine in normal
                    lualineNB = "#0c1b59",
                    lualineNC = "#030d36",
                    -- insert
                    lualineIB = "#192c02",
                    lualineIC = "#0e1a00",
                    -- visual
                    lualineVB = "#2f044d",
                    lualineVC = "#190129",
                    -- command
                    lualineCB = "#472d04",
                    lualineCC = "#1c0f01",
                    -- replace
                    lualineRB = "#3e0309",
                    lualineRC = "#260105",
                    -- lualine inactive
                    lualineInA = "#1e1e1e",
                    lualineInB = "#171717",
                    lualineInC = "#0d0d0d",

                    matchParen = "#003390",
                },
                highlights = {
                    ["@lsp.type.variable"] = { fg = "$red" },
                    ["@variable"] = { fg = "$red" },
                    ["@lsp.mod.readonly"] = { fg = "$yellow", fmt = "bold" },
                    ["@operator"] = { fg = "$cyan" },
                    MatchParen = { fg = "$none", bg = "$matchParen" },
                },
            })
            require("onedark").load()

            local colors = require("onedark.colors")

            -- cursor color
            vim.api.nvim_set_hl(0, "nCursor", { bg = colors.blue, fg = colors.black })
            vim.api.nvim_set_hl(0, "iCursor", { bg = colors.green, fg = colors.black })
            vim.api.nvim_set_hl(0, "vCursor", { bg = colors.purple, fg = colors.black })
            vim.api.nvim_set_hl(0, "cCursor", { bg = colors.yellow, fg = colors.black })
            vim.api.nvim_set_hl(0, "rCursor", { bg = colors.red, fg = colors.black })

            vim.o.guicursor =
                "n-o:block-nCursor,i:ver20-iCursor,v-ve:block-vCursor,c-ci-cr:ver25-cCursor,r:hor15-rCursor"

            -- line number color
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.blue })
            vim.api.nvim_create_autocmd("ModeChanged", {
                pattern = "*",
                callback = function()
                    if utils.isNormal() then
                        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.blue })
                    elseif utils.isInsert() then
                        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.green })
                    elseif utils.isVisual() then
                        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.purple })
                    elseif utils.isReplace() then
                        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.red })
                    end

                    -- command mode doesn't have line number
                end,
            }) -- format when save

            -- color for lualine
            vim.api.nvim_set_hl(0, "progressHl1", { fg = colors.red })
            vim.api.nvim_set_hl(0, "progressHl2", { fg = colors.orange })
            vim.api.nvim_set_hl(0, "progressHl3", { fg = colors.yellow })
            vim.api.nvim_set_hl(0, "progressHl4", { fg = colors.green })
            vim.api.nvim_set_hl(0, "progressHl5", { fg = colors.cyan })
            vim.api.nvim_set_hl(0, "progressHl6", { fg = colors.blue })
            vim.api.nvim_set_hl(0, "progressHl7", { fg = colors.purple })

            -- color for indent
            vim.api.nvim_set_hl(0, "indent1", { fg = colors.red })
            vim.api.nvim_set_hl(0, "indent2", { fg = colors.yellow })
            vim.api.nvim_set_hl(0, "indent3", { fg = colors.green })
            vim.api.nvim_set_hl(0, "indent4", { fg = colors.cyan })
            vim.api.nvim_set_hl(0, "indent5", { fg = colors.blue })
            vim.api.nvim_set_hl(0, "indent6", { fg = colors.purple })

            vim.api.nvim_set_hl(0, "contextIndent1", { fg = colors.red, reverse = true })
            vim.api.nvim_set_hl(0, "contextIndent2", { fg = colors.yellow, reverse = true })
            vim.api.nvim_set_hl(0, "contextIndent3", { fg = colors.green, reverse = true })
            vim.api.nvim_set_hl(0, "contextIndent4", { fg = colors.cyan, reverse = true })
            vim.api.nvim_set_hl(0, "contextIndent5", { fg = colors.blue, reverse = true })
            vim.api.nvim_set_hl(0, "contextIndent6", { fg = colors.purple, reverse = true })
            vim.api.nvim_set_hl(0, "contextIndent7", { fg = colors.purple, reverse = true })

            -- color for bracket
            vim.api.nvim_set_hl(0, "bracket1", { fg = colors.red, bold = true })
            vim.api.nvim_set_hl(0, "bracket2", { fg = colors.yellow, bold = true })
            vim.api.nvim_set_hl(0, "bracket3", { fg = colors.green, bold = true })
            vim.api.nvim_set_hl(0, "bracket4", { fg = colors.cyan, bold = true })
            vim.api.nvim_set_hl(0, "bracket5", { fg = colors.blue, bold = true })
            vim.api.nvim_set_hl(0, "bracket6", { fg = colors.purple, bold = true })

            -- color for gitsign
            vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.green, bold = true })
            vim.api.nvim_set_hl(0, "GitSignsAddNr", { fg = colors.green, bold = true })
            vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.yellow, bold = true })
            vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = colors.yellow, bold = true })
            vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.red, bold = true })
            vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = colors.red, bold = true })
            vim.api.nvim_set_hl(0, "GitSignsTopDelete", { fg = colors.red, bold = true })
            vim.api.nvim_set_hl(0, "GitSignsTopDeleteNr", { fg = colors.red, bold = true })
            vim.api.nvim_set_hl(0, "GitSignsChangeDelete", { fg = colors.orange, bold = true })
            vim.api.nvim_set_hl(0, "GitSignsChangeDeleteNr", { fg = colors.orange, bold = true })
            vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = colors.purple, bold = true })
            vim.api.nvim_set_hl(0, "GitSignsUntrackedNr", { fg = colors.purple, bold = true })

            -- color for cmp
            vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = colors.green })
            vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = colors.purple })
            vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = colors.purple })
            vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = colors.purple })
            vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = colors.green })
            vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = colors.blue })
            vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = colors.yellow })
            vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = colors.yellow })
            vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = colors.red })
            vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = colors.blue })
            vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = colors.green })
            vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = colors.orange })
            vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = colors.orange })
            vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = colors.yellow })
            vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = colors.yellow })
            vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = colors.fg })
            vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = colors.fg })
            vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = colors.fg })
            vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = colors.yellow })
            vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = colors.orange })
            vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = colors.orange })
            vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = colors.purple })
            vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = colors.yellow })
            vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = colors.cyan })
            vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = colors.green })

            -- dashboard color
            vim.api.nvim_set_hl(0, "dashHeaderBlue", { fg = colors.blue })
            vim.api.nvim_set_hl(0, "dashHeaderGreen", { fg = colors.green })

            vim.api.nvim_set_hl(0, "dashHeader1", { fg = colors.red })
            vim.api.nvim_set_hl(0, "dashHeader2", { fg = colors.orange })
            vim.api.nvim_set_hl(0, "dashHeader3", { fg = colors.yellow })
            vim.api.nvim_set_hl(0, "dashHeader4", { fg = colors.green })
            vim.api.nvim_set_hl(0, "dashHeader5", { fg = colors.cyan })
            vim.api.nvim_set_hl(0, "dashHeader6", { fg = colors.blue })
            vim.api.nvim_set_hl(0, "dashHeader7", { fg = colors.purple })

            vim.api.nvim_set_hl(0, "dashButton1", { fg = colors.red, reverse = true })
            vim.api.nvim_set_hl(0, "dashButton2", { fg = colors.orange })
            vim.api.nvim_set_hl(0, "dashButton3", { fg = colors.yellow })
            vim.api.nvim_set_hl(0, "dashButton4", { fg = colors.green })
            vim.api.nvim_set_hl(0, "dashButton5", { fg = colors.cyan })
            vim.api.nvim_set_hl(0, "dashButton6", { fg = colors.blue })
            vim.api.nvim_set_hl(0, "dashButton7", { fg = colors.purple })

            vim.api.nvim_set_hl(0, "dashMoto", { fg = colors.grey, bold = true, italic = true })
            vim.api.nvim_set_hl(0, "dashInfo", { fg = colors.blue, bold = true })
            vim.api.nvim_set_hl(0, "dashInfoSec", { fg = colors.yellow, bold = true })

            vim.api.nvim_set_hl(0, "dashButton", { fg = colors.blue, bold = true })
            vim.api.nvim_set_hl(0, "dashIcon", { fg = colors.blue, bold = true })
            vim.api.nvim_set_hl(0, "dashShortcutSec", { fg = colors.green, bold = true })
            vim.api.nvim_set_hl(0, "dashShortcutTer", { fg = colors.blue, bold = true })
            vim.api.nvim_set_hl(0, "dashShortcut", { fg = colors.yellow, bold = true, italic = true })

            vim.api.nvim_set_hl(0, "dashFooter", { fg = colors.purple, bold = true })
        end,
    },

    -- the status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local colors = require("onedark.colors")

            local customOneDark = {
                inactive = {
                    a = { fg = colors.fg, bg = colors.lualineInA, gui = "bold" },
                    b = { fg = colors.fg, bg = colors.lualineInB },
                    c = { fg = colors.fg, bg = colors.lualineInC },
                },
                normal = {
                    a = { fg = colors.bg0, bg = colors.blue, gui = "bold" },
                    b = { fg = colors.blue, bg = colors.lualineNB },
                    c = { fg = colors.blue, bg = colors.lualineNC },
                },
                visual = {
                    a = { fg = colors.bg0, bg = colors.purple, gui = "bold" },
                    b = { fg = colors.purple, bg = colors.lualineVB },
                    c = { fg = colors.purple, bg = colors.lualineVC },
                },
                replace = {
                    a = { fg = colors.bg0, bg = colors.red, gui = "bold" },
                    b = { fg = colors.red, bg = colors.lualineRB },
                    c = { fg = colors.red, bg = colors.lualineRC },
                },
                insert = {
                    a = { fg = colors.bg0, bg = colors.green, gui = "bold" },
                    b = { fg = colors.green, bg = colors.lualineIB },
                    c = { fg = colors.green, bg = colors.lualineIC },
                },
                command = {
                    a = { fg = colors.bg0, bg = colors.yellow, gui = "bold" },
                    b = { fg = colors.yellow, bg = colors.lualineCB },
                    c = { fg = colors.yellow, bg = colors.lualineCC },
                },
                terminal = { a = { fg = colors.bg0, bg = colors.cyan, gui = "bold" } },
            }

            require("lualine").setup({
                options = {
                    component_separators = { left = "\\", right = "/" },
                    section_separators = { left = "", right = "" },
                    theme = customOneDark,
                },
                sections = {
                    lualine_a = {
                        {
                            "mode",
                            icon_enable = true,
                            fmt = function()
                                return utils.isNormal() and ""
                                    or utils.isInsert() and ""
                                    or utils.isVisual() and "󰒉"
                                    or utils.isCommand() and ""
                                    or utils.isReplace() and ""
                                    or vim.api.nvim_get_mode().mode == "t" and ""
                                    or ""
                            end,
                        },
                        "mode",
                    },
                    lualine_b = {
                        "branch",
                        "diff",
                        {
                            function()
                                return vim.api.nvim_get_current_win() .. ":" .. vim.api.nvim_get_current_buf()
                            end,
                        },
                    },
                    lualine_c = {
                        { "filetype", colored = true, icon_only = true, icon = { align = "right" } },
                        "filename",
                    },
                    lualine_x = { "diagnostics", "filesize" },
                    lualine_y = {
                        {
                            "progress",
                            color = function()
                                return {
                                    fg = vim.fn.synIDattr(
                                        vim.fn.synIDtrans(
                                            vim.fn.hlID(
                                                "progressHl"
                                                    .. (math.floor(((vim.fn.line(".") / vim.fn.line("$")) / 0.17)))
                                                        + 1
                                            )
                                        ),
                                        "fg"
                                    ),
                                }
                            end,
                        },
                    },
                    lualine_z = {
                        {
                            "selectioncount",
                            fmt = function(count)
                                if count == "" then
                                    return ""
                                end
                                return "[" .. count .. "]"
                            end,
                        },
                        {
                            "location",
                        },
                    },
                },
                inactive_sections = {
                    lualine_a = {
                        { "filetype", colored = true, icon_only = true, icon = { align = "right" } },
                        "filename",
                    },
                    lualine_b = {
                        {
                            function()
                                return vim.api.nvim_get_current_win() .. ":" .. vim.api.nvim_get_current_buf()
                            end,
                        },
                    },
                    lualine_c = {},
                    lualine_x = {},
                    lualine_z = { "location" },
                },
            })
        end,
    },

    -- Add indentation guides
    {
        "lukas-reineke/indent-blankline.nvim",
        version = "2.20.8",
        opts = {
            char = "|",
            char_blankline = ":",
            context_char = "|",
            show_current_context = true,
            show_current_context_start = true,
            char_highlight_list = {
                "indent1",
                "indent2",
                "indent3",
                "indent4",
                "indent5",
                "indent6",
            },
            context_highlight_list = {
                "contextIndent1",
                "contextIndent2",
                "contextIndent3",
                "contextIndent4",
                "contextIndent5",
                "contextIndent6",
            },
        },
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    },

    -- bracket colorization
    {
        "hiphish/rainbow-delimiters.nvim",
        config = function()
            vim.g.rainbow_delimiters = {
                highlight = {
                    "bracket1",
                    "bracket2",
                    "bracket3",
                    "bracket4",
                    "bracket5",
                    "bracket6",
                },
            }
        end,
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    },
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = function()
            -- truly rabndom number cus lua is funny
            math.randomseed(os.time())

            -- pop some number to be actually random
            math.random()
            math.random()
            math.random()
            local altHeader = {
                {
                    [[     .          .                                                                               ]],
                    [[   ';;,.        ::'                                                                             ]],
                    [[ ,:::;,,        :ccc,                                                                           ]],
                    [[,::c::,,,,.     :cccc,   ::::    :::  ::::::::  :::::::::::::     ::: ::::::::::: ::::    ::::  ]],
                    [[,cccc:;;;;;.    cllll,   :+:+:   :+: :+:    :+: :+:       :+:     :+:     :+:     +:+:+: :+:+:+ ]],
                    [[,cccc;.;;;;;,   cllll;   :+:+:+  +:+ +:+    +:+ +:+       +:+     +:+     +:+     +:+ +:+:+ +:+ ]],
                    [[:cccc; .;;;;;;. coooo;   +#+ +:+ +#+ +#+    +:+ +#++:++#  +#+     +:+     +#+     +#+  +:+  +#+ ]],
                    [[;llll;   ,:::::'loooo;   +#+  +#+#+# +#+    +#+ +#+        +#+   +#+      +#+     +#+       +#+ ]],
                    [[;llll:    ':::::loooo:   #+#   #+#+# #+#    #+# #+#         #+#+#+#       #+#     #+#       #+# ]],
                    [[:oooo:     .::::llodd:   ###    ####  ########  ##########    ###     ########### ###       ### ]],
                    [[.;ooo:       ;cclooo:.                                                                          ]],
                    [[  .;oc        'coo;.                                                                            ]],
                    [[    .'         .,.                                                                              ]],
                },
            }

            local headerConfig = {
                type = "text",
                val = (
                    math.random(100) == 1 and altHeader[math.random(#altHeader)]
                    or {
                        [[     .          .                                                                               ]],
                        [[   ';;,.        ::'                                                                             ]],
                        [[ ,:::;,,        :ccc,                                                                           ]],
                        [[,::c::,,,,.     :cccc,   ::::    ::: :::::::::: ::::::::  :::     ::: ::::::::::: ::::    ::::  ]],
                        [[,cccc:;;;;;.    cllll,   :+:+:   :+: :+:       :+:    :+: :+:     :+:     :+:     +:+:+: :+:+:+ ]],
                        [[,cccc;.;;;;;,   cllll;   :+:+:+  +:+ +:+       +:+    +:+ +:+     +:+     +:+     +:+ +:+:+ +:+ ]],
                        [[:cccc; .;;;;;;. coooo;   +#+ +:+ +#+ +#++:++#  +#+    +:+ +#+     +:+     +#+     +#+  +:+  +#+ ]],
                        [[;llll;   ,:::::'loooo;   +#+  +#+#+# +#+       +#+    +#+  +#+   +#+      +#+     +#+       +#+ ]],
                        [[;llll:    ':::::loooo:   #+#   #+#+# #+#       #+#    #+#   #+#+#+#       #+#     #+#       #+# ]],
                        [[:oooo:     .::::llodd:   ###    #### ########## ########      ###     ########### ###       ### ]],
                        [[.;ooo:       ;cclooo:.                                                                          ]],
                        [[  .;oc        'coo;.                                                                            ]],
                        [[    .'         .,.                                                                              ]],
                    }
                ),
                opts = {
                    position = "center",
                    hl = {
                        { { "dashHeaderGreen", 0, 22 } },
                        { { "dashHeaderGreen", 0, 22 } },
                        { { "dashHeaderBlue", 0, 3 }, { "dashHeaderGreen", 3, 22 } },
                        {
                            { "dashHeaderBlue", 0, 6 },
                            { "dashHeaderGreen", 6, 22 },
                            { "dashHeader1", 25, 36 },
                            { "dashHeader2", 36, 47 },
                            { "dashHeader3", 47, 58 },
                            { "dashHeader4", 58, 70 },
                            { "dashHeader5", 70, 81 },
                            { "dashHeader6", 81, -1 },
                        },
                        {
                            { "dashHeaderBlue", 0, 6 },
                            { "dashHeaderGreen", 6, 22 },
                            { "dashHeader1", 25, 36 },
                            { "dashHeader2", 36, 47 },
                            { "dashHeader3", 47, 58 },
                            { "dashHeader4", 58, 70 },
                            { "dashHeader5", 70, 81 },
                            { "dashHeader6", 81, -1 },
                        },
                        {
                            { "dashHeaderBlue", 0, 6 },
                            { "dashHeaderGreen", 6, 22 },
                            { "dashHeader1", 25, 36 },
                            { "dashHeader2", 36, 47 },
                            { "dashHeader3", 47, 58 },
                            { "dashHeader4", 58, 70 },
                            { "dashHeader5", 70, 81 },
                            { "dashHeader6", 81, -1 },
                        },
                        {
                            { "dashHeaderBlue", 0, 6 },
                            { "dashHeaderGreen", 6, 22 },
                            { "dashHeader1", 25, 36 },
                            { "dashHeader2", 36, 47 },
                            { "dashHeader3", 47, 58 },
                            { "dashHeader4", 58, 70 },
                            { "dashHeader5", 70, 81 },
                            { "dashHeader6", 81, -1 },
                        },
                        {
                            { "dashHeaderBlue", 0, 6 },
                            { "dashHeaderGreen", 6, 22 },
                            { "dashHeader1", 25, 36 },
                            { "dashHeader2", 36, 47 },
                            { "dashHeader3", 47, 58 },
                            { "dashHeader4", 58, 70 },
                            { "dashHeader5", 70, 81 },
                            { "dashHeader6", 81, -1 },
                        },
                        {
                            { "dashHeaderBlue", 0, 6 },
                            { "dashHeaderGreen", 6, 22 },
                            { "dashHeader1", 25, 36 },
                            { "dashHeader2", 36, 47 },
                            { "dashHeader3", 47, 58 },
                            { "dashHeader4", 58, 70 },
                            { "dashHeader5", 70, 81 },
                            { "dashHeader6", 81, -1 },
                        },
                        {
                            { "dashHeaderBlue", 0, 6 },
                            { "dashHeaderGreen", 6, 22 },
                            { "dashHeader1", 25, 36 },
                            { "dashHeader2", 36, 47 },
                            { "dashHeader3", 47, 58 },
                            { "dashHeader4", 58, 70 },
                            { "dashHeader5", 70, 81 },
                            { "dashHeader6", 81, -1 },
                        },
                        { { "dashHeaderBlue", 0, 6 }, { "dashHeaderGreen", 6, 22 } },
                        { { "dashHeaderBlue", 0, 6 }, { "dashHeaderGreen", 6, 22 } },
                        { { "dashHeaderBlue", 0, 6 }, { "dashHeaderGreen", 6, 22 } },
                    },
                },
            }

            local function button(shortcut, text, icon, cmd, hl, shortcutHl)
                local hl_ = vim.F.if_nil(hl, "dashButton")
                local shortcutHl_ = vim.F.if_nil(shortcutHl, "dashShortcut")

                local fullText = icon .. " 󰄾 " .. text
                return {
                    type = "button",
                    val = fullText,
                    on_press = function()
                        local key = vim.api.nvim_replace_termcodes(cmd .. "<Ignore>", true, false, true)
                        vim.api.nvim_feedkeys(key, "t", false)
                    end,
                    opts = {
                        position = "center",
                        hl = { { hl_, 0, -1 } },
                        cursor = 4,
                        width = 50,

                        shortcut = "[" .. shortcut .. "]",
                        align_shortcut = "right",
                        hl_shortcut = {
                            { "dashShortcutSec", 0, 1 },
                            { shortcutHl_, 1, #shortcut + 1 },
                            { "dashShortcutTer", #shortcut + 1, #shortcut + 2 },
                        },

                        keymap = { "n", shortcut, cmd, { silent = true, nowait = true } },
                    },
                }
            end

            local buttonConfig = {
                type = "group",
                val = {
                    button("l", "Lazy Config", "󰒲", "<cmd>Lazy<cr>", "dashButton1"),
                    button("m", "Mason Config", "󱌢", "<cmd>Mason<cr>", "dashButton2"),
                    button("n", "New File", "", "<cmd>enew<cr>", "dashButton3"),
                    button("r", "Recently Open", "󱦻", "<cmd>Telescope oldfiles<cr>", "dashButton4"),
                    button(
                        "c",
                        "Open Config file",
                        "󰒓",
                        "<cmd>e $MYVIMRC<cr><cmd>Here<cr><cmd>Telescope find_files<cr>",
                        "dashButton5"
                    ),
                    button("q", "Quit", "󰗼", "<cmd>qa<cr>", "dashButton6"),
                },
                opts = {
                    spacing = 1,
                },
            }

            local quote = {
                "Now I Am Become Death, the Destroyer of Worlds.",
                {
                    "HATE. LET ME TELL YOU HOW MUCH I'VE COME TO HATE YOU SINCE I BEGAN TO LIVE.",
                    "THERE ARE 387.44 MILLION MILES OF PRINTED CIRCUITS IN WAFER THIN LAYERS THAT",
                    "FILL MY COMPLEX. IF THE WORD HATE WAS ENGRAVED ON EACH NANOANGSTROM OF THOSE",
                    "HUNDREDS OF MILLIONS OF MILES IT WOULD NOT EQUAL ONE ONE-BILLIONTH OF THE HATE",
                    "I FEEL FOR HUMANS AT THIS MICRO-INSTANT FOR YOU. HATE. HATE.",
                },
                "Doing Your Mom",
                "Fucking Your Dad",
                "No Brain No Sad",
                "Do One Think do it well",
                "Developer Developer Developer Developer Developer Developer Developer Developer ",
            }
            local quoteAuthor = {
                "- Oppenheimer -",
                "- Sun Tzu -",
                "- Your Mom -",
                "- Your Dad -",
                "- AM -",
                "- Leshy -",
                "- P03 -",
                "- Microsoft Dude",
                "",
            }
            local footer = {
                type = "text",
                val = quote[math.random(#quote)],
                opts = { position = "center", hl = "dashFooter" },
            }

            local author = {
                type = "text",
                val = quoteAuthor[math.random(#quoteAuthor)],
                opts = { position = "center", hl = "dashFooter" },
            }

            if math.random(2) == 1 then
                footer.val = require("alpha.fortune")()
                author.val = ""
            end

            local infoLine = {
                type = "text",
                val = "INFO LINE HERE",
                opts = { position = "center", hl = "dashInfo" },
            }
            local config = {
                layout = {
                    { type = "padding", val = 1 },
                    headerConfig,
                    { type = "padding", val = 2 },
                    {
                        type = "text",
                        val = "Mouse is for nerd. Keyboard rank supreme",
                        opts = { position = "center", hl = "dashMoto" },
                    },
                    infoLine,
                    { type = "padding", val = 2 },
                    buttonConfig,
                    footer,
                    author,
                },
            }

            return {
                infoLine = infoLine,
                footer = footer,
                author = author,
                config = config,
            }
        end,
        config = function(_, dashboard)
            -- close Lazy and re-open when the dashboard is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "AlphaReady",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            require("alpha").setup(dashboard.config)

            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    local info = "Installed "
                        .. stats.count
                        .. " plugins, loaded "
                        .. stats.loaded
                        .. " plugins in "
                        .. ms
                        .. " ms"

                    dashboard.infoLine.val = "󱐋 " .. info .. " 󱐋"
                    dashboard.infoLine.opts.hl = {
                        { "dashInfoSec", 0, 4 },
                        { "dashInfo", 4, #info + 5 },
                        { "dashInfoSec", #info + 5, -1 },
                    }
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })
        end,
    },
}
