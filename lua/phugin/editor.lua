return {
    {
        -- editor theme
        "navarasu/onedark.nvim",
        priority = 1000,
        config = function()
            require("onedark").setup {
                style = "deep"
            }
            require("onedark").load()

            local colors = require("onedark.colors")

            -- color for indent
            vim.cmd([[highlight indent1 guifg=]] .. colors.red)
            vim.cmd([[highlight indent2 guifg=]] .. colors.yellow)
            vim.cmd([[highlight indent3 guifg=]] .. colors.green)
            vim.cmd([[highlight indent4 guifg=]] .. colors.cyan)
            vim.cmd([[highlight indent5 guifg=]] .. colors.blue)
            vim.cmd([[highlight indent6 guifg=]] .. colors.purple)

            vim.cmd([[highlight contextIndent1 guifg=]] .. colors.red .. [[ gui=inverse]])
            vim.cmd([[highlight contextIndent2 guifg=]] .. colors.yellow .. [[ gui=inverse]])
            vim.cmd([[highlight contextIndent3 guifg=]] .. colors.green .. [[ gui=inverse]])
            vim.cmd([[highlight contextIndent4 guifg=]] .. colors.cyan .. [[ gui=inverse]])
            vim.cmd([[highlight contextIndent5 guifg=]] .. colors.blue .. [[ gui=inverse]])
            vim.cmd([[highlight contextIndent6 guifg=]] .. colors.purple .. [[ gui=inverse]])

            -- color for bracket

            vim.cmd([[highlight bracket1 guifg=]] .. colors.red .. [[ gui=undercurl]])
            vim.cmd([[highlight bracket2 guifg=]] .. colors.yellow .. [[ gui=undercurl]])
            vim.cmd([[highlight bracket3 guifg=]] .. colors.green .. [[ gui=undercurl]])
            vim.cmd([[highlight bracket4 guifg=]] .. colors.cyan .. [[ gui=undercurl]])
            vim.cmd([[highlight bracket5 guifg=]] .. colors.blue .. [[ gui=undercurl]])
            vim.cmd([[highlight bracket6 guifg=]] .. colors.purple .. [[ gui=undercurl]])
        end,
    },

    -- the status line
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            local c = require('onedark.colors')
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
                gray = c.grey
            }

            local customOneDark = {
                inactive = {
                    a = { fg = colors.gray, bg = colors.fg, gui = 'bold' },
                    b = { fg = colors.gray, bg = colors.fg },
                    c = { fg = colors.gray, bg = cfg.lualine.transparent and c.none or c.bg1 },
                },
                normal = {
                    a = { fg = colors.bg, bg = colors.blue, gui = 'bold' },
                    b = { fg = colors.fg, bg = c.bg3 },
                    c = { fg = colors.fg, bg = cfg.lualine.transparent and c.none or c.bg1 },
                },
                visual = { a = { fg = colors.bg, bg = colors.purple, gui = 'bold' } },
                replace = { a = { fg = colors.bg, bg = colors.red, gui = 'bold' } },
                insert = { a = { fg = colors.bg, bg = colors.green, gui = 'bold' } },
                command = { a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' } },
                terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = 'bold' } },
            }



            require("lualine").setup({
                options = {
                    component_separators = { left = '|', right = '|' },
                    section_separators = { left = '', right = '' },
                    theme = customOneDark
                },
                sections = {
                    lualine_a = { {
                        "mode",
                        icon_enable = true,
                        fmt = function()
                            local vimMode = vim.api.nvim_get_mode().mode
                            return vimMode == "n" and "󰜗" or vimMode == "i" and "" or vimMode == "v" and "󰒉" or
                                vimMode == "c" and "" or ""
                        end
                    }, {
                        "mode",
                        icon_enable = true,
                    } }
                }
            })
        end,
    },

    -- Add indentation guides
    {
        'lukas-reineke/indent-blankline.nvim',
        opts = {
            char = '|',
            char_blankline = ".",
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

    {
        "hiphish/rainbow-delimiters.nvim",
        config = function()
            local rainbow_delimiters = require 'rainbow-delimiters'

            vim.g.rainbow_delimiters = {
                highlight = {
                    'bracket1',
                    'bracket2',
                    'bracket3',
                    'bracket4',
                    'bracket5',
                    'bracket6',
                },
            }
        end
    }
}
