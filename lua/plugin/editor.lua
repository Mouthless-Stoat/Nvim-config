local utils = require("utils")
return {
    {
        -- editor theme
        "navarasu/onedark.nvim",
        priority = 1000,
        config = function()
            require("onedark").setup({
                style = "darker",
                lualine = {
                    transparent = false,
                },
                highlights = {
                    ["@lsp.type.variable"] = { fg = "$red" },
                    ["@variable"] = { fg = "$red" },
                    ["@lsp.mod.readonly"] = { fg = "$yellow", fmt = "bold" },
                    ["@operator"] = { fg = "$cyan" },
                },
            })
            require("onedark").load()

            local colors = require("onedark.colors")

            -- cursor color
            vim.api.nvim_set_hl(0, "nCursor", { bg = colors.blue, fg = colors.bg })
            vim.api.nvim_set_hl(0, "iCursor", { bg = colors.green, fg = colors.bg })
            vim.api.nvim_set_hl(0, "vCursor", { bg = colors.purple, fg = colors.bg })
            vim.api.nvim_set_hl(0, "cCursor", { bg = colors.yellow, fg = colors.bg })
            vim.api.nvim_set_hl(0, "rCursor", { bg = colors.red, fg = colors.bg })

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

            vim.api.nvim_set_hl(0, "dashHeader1", { fg = colors.blue })
            vim.api.nvim_set_hl(0, "dashHeader2", { fg = colors.blue })
            vim.api.nvim_set_hl(0, "dashHeader3", { fg = colors.blue })
            vim.api.nvim_set_hl(0, "dashHeader4", { fg = colors.green })
            vim.api.nvim_set_hl(0, "dashHeader5", { fg = colors.green })
            vim.api.nvim_set_hl(0, "dashHeader6", { fg = colors.green })
            vim.api.nvim_set_hl(0, "dashHeader7", { fg = colors.purple })

            vim.api.nvim_set_hl(0, "dashButtons", { fg = colors.blue })
            vim.api.nvim_set_hl(0, "dashShortcut", { fg = colors.yellow, bold = true })
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
            local c = require("onedark.colors")
            local cfg = vim.g.onedark_config
            local colors = {
                bg = c.bg0,
                fg = c.fg,
                red = c.red,
                green = c.green,
                yellow = c.yellow,
                blue = c.blue,
                purple = c.purple,
                cyan = c.cyan,
                gray = c.grey,
            }

            local customOneDark = {
                inactive = {
                    a = { fg = colors.gray, bg = colors.fg, gui = "bold" },
                    b = { fg = colors.gray, bg = colors.fg },
                    c = { fg = colors.gray, bg = cfg.lualine.transparent and c.none or c.bg1 },
                },
                normal = {
                    a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
                    b = { fg = colors.fg, bg = c.bg3 },
                    c = { fg = colors.fg, bg = cfg.lualine.transparent and c.none or c.bg1 },
                },
                visual = { a = { fg = colors.bg, bg = colors.purple, gui = "bold" } },
                replace = { a = { fg = colors.bg, bg = colors.red, gui = "bold" } },
                insert = { a = { fg = colors.bg, bg = colors.green, gui = "bold" } },
                command = { a = { fg = colors.bg, bg = colors.yellow, gui = "bold" } },
                terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = "bold" } },
            }

            require("lualine").setup({
                options = {
                    component_separators = { left = "|", right = "|" },
                    section_separators = { left = "", right = "" },
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
                                    or vim.api.nvim_get_mode().mode and ""
                                    or ""
                            end,
                        },
                        {
                            "mode",
                            icon_enable = true,
                        },
                    },
                    lualine_b = {
                        "branch",
                        "diff",
                    },
                    lualine_c = {
                        { "filetype", colored = true, icon_only = true, icon = { align = "right" } },
                        {
                            "filename",
                            color = function()
                                return utils.isNormal() and { fg = colors.blue }
                                    or utils.isInsert() and { fg = colors.green }
                                    or utils.isVisual() and { fg = colors.purple }
                                    or utils.isCommand() and { fg = colors.yellow }
                                    or utils.isReplace() and { fg = colors.red }
                                    or vim.api.nvim_get_mode().mode and { fg = colors.cyan }
                                    or { fg = colors.fg }
                            end,
                        },
                    },
                    lualine_x = { "diagnostics", "filesize" },
                },
            })
        end,
    },

    -- Add indentation guides
    {
        "lukas-reineke/indent-blankline.nvim",
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
    },

    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        opts = function()
            local dashboard = require("alpha.themes.dashboard")
            local logo = {
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

            dashboard.section.header.val = logo
            dashboard.section.buttons.val = {
                dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
                dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
                dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
                dashboard.button("q", " " .. " Quit", ":qa<CR>"),
            }
            for _, button in ipairs(dashboard.section.buttons.val) do
                button.opts.hl = "dashButtons"
                button.opts.hl_shortcut = "dashShortcut"
            end
            local headerHl = {
                line = {
                    { { "dashHeaderGreen", 0, -1 } },
                    { { "dashHeaderGreen", 0, -1 } },
                    { { "dashHeaderBlue", 0, 3 }, { "dashHeaderGreen", 3, -1 } },
                    { { "dashHeaderBlue", 0, 4 }, { "dashHeaderGreen", 4, 22 }, { "dashHeader1", 22, -1 } },
                    { { "dashHeaderBlue", 0, 5 }, { "dashHeaderGreen", 5, 22 }, { "dashHeader2", 22, -1 } },
                    { { "dashHeaderBlue", 0, 6 }, { "dashHeaderGreen", 6, 22 }, { "dashHeader3", 22, -1 } },
                    { { "dashHeaderBlue", 0, 6 }, { "dashHeaderGreen", 6, 22 }, { "dashHeader4", 22, -1 } },
                    { { "dashHeaderBlue", 0, 6 }, { "dashHeaderGreen", 6, 22 }, { "dashHeader5", 22, -1 } },
                    { { "dashHeaderBlue", 0, 6 }, { "dashHeaderGreen", 6, 22 }, { "dashHeader6", 22, -1 } },
                    { { "dashHeaderBlue", 0, 6 }, { "dashHeaderGreen", 6, 22 }, { "dashHeader7", 22, -1 } },
                    { { "dashHeaderBlue", 0, 6 }, { "dashHeaderGreen", 6, 22 } },
                    { { "dashHeaderBlue", 0, 6 }, { "dashHeaderGreen", 6, 22 } },
                    { { "dashHeaderBlue", 0, 6 }, { "dashHeaderGreen", 6, 22 } },
                },
                letter = {
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
            }
            dashboard.section.header.opts.hl = headerHl.letter
            dashboard.section.buttons.opts.hl = "dashButtons"
            dashboard.section.footer.opts.hl = "dashFooter"
            dashboard.opts.layout[1].val = 8
            return dashboard
        end,
        config = function(_, dashboard)
            -- close Lazy and re-open when the dashboard is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "dashReady",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            require("alpha").setup(dashboard.opts)
            local quote = {
                "No Brain No Sad",
                "Now I am become Death, the destroyer of worlds. - Oppenheimer",
                "Doing your Mom",
                "Fucking your Dad",
                "Do one thing, do it well - unix",
                "No Code no bugs",
            }
            dashboard.section.footer.val = quote[math.random(#quote)]
            pcall(vim.cmd.dashRedraw)
        end,
    },
}
