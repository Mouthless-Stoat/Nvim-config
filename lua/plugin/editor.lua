local mode = require("helper.mode")
local utils = require("helper.utils")
return {
    {
        -- editor theme
        "navarasu/onedark.nvim",
        priority = 1000,
        config = function()
            require("onedark").setup({
                style = "deep",
                colors = {
                    bg0 = "#141414",
                    bg1 = "#131621",
                    bg2 = "#0f192f",
                    bg3 = "#031b3d",

                    brown = "#85441c",
                    pink = "#de52c0",
                    darkPink = "#8c1974",
                    darkerPink = "#3b0c31",

                    -- extra dark color
                    darkBlue = "#0c1b59",
                    darkerBlue = "#030d36",
                    darkGreen = "#192c02",
                    darkerGreen = "#0e1a00",
                    darkPurple = "#2f044d",
                    darkerPurple = "#190129",
                    darkYellow = "#472d04",
                    darkerYellow = "#1c0f01",
                    darkRed = "#3e0309",
                    darkerRed = "#260105",

                    -- lualine inactive
                    lualineInA = "#1e1e1e",
                    lualineInB = "#171717",
                    lualineInC = "#0d0d0d",

                    matchParen = "#003390",
                },
                highlights = {
                    ["@lsp.type.variable"] = { fg = "$red" }, -- variable
                    ["@variable"] = { fg = "$red" },
                    ["@lsp.mod.readonly"] = { fg = "$yellow", fmt = "bold" },
                    ["@operator"] = { fg = "$cyan" },
                    ["@parameter"] = { fg = "$red", fmt = "italic" }, -- param
                    ["@type.qualifier.rust"] = { fg = "$purple", fmt = "italic" }, -- rust shit
                    ["@lsp.type.namespace"] = { fg = "$orange", fmt = "italic" },
                    ["@lsp.type.variable.rust"] = { fg = "$yellow" },
                    ["@lsp.mod.mutable.rust"] = { fg = "$red" },
                    -- uiua stuff
                    ["@lsp.type.string.uiua"] = { fg = "$cyan", fmt = "underline" },
                    ["@lsp.type.noadic_function.uiua"] = { fg = "$red" },
                    ["@lsp.type.monadic_function.uiua"] = { fg = "$green" },
                    ["@lsp.type.dyadic_function.uiua"] = { fg = "$blue" },
                    ["@lsp.type.monadic_modifier.uiua"] = { fg = "$yellow" },
                    ["@lsp.type.dyadic_modifier.uiua"] = { fg = "$purple" },
                    MatchParen = { fg = "$none", bg = "$matchParen" },
                    winhl = { fg = "$orange", bg = "$yellow" },
                    ColorColumn = { fg = "$red", bg = "$darkRed" },

                    -- cursor color
                    ["nCursor"] = { bg = "$blue", fg = "$black" },
                    ["iCursor"] = { bg = "$green", fg = "$black" },
                    ["vCursor"] = { bg = "$purple", fg = "$black" },
                    ["cCursor"] = { bg = "$yellow", fg = "$black" },
                    ["rCursor"] = { bg = "$red", fg = "$black" },

                    -- sticky note color
                    ["notepadNormal"] = { fg = "$bg0", bg = "$yellow" },
                    ["notepadBorder"] = { fg = "$orange" },
                    ["notepadTitle"] = { fg = "$orange" },

                    ["WinSeparator"] = { fg = "$blue", fmt = "bold" }, -- win sep color

                    -- lualine progress color
                    ["progressHl1"] = { fg = "$red" },
                    ["progressHl2"] = { fg = "$orange" },
                    ["progressHl3"] = { fg = "$yellow" },
                    ["progressHl4"] = { fg = "$green" },
                    ["progressHl5"] = { fg = "$cyan" },
                    ["progressHl6"] = { fg = "$blue" },
                    ["progressHl7"] = { fg = "$purple" },

                    -- indent color
                    ["indent1"] = { fg = "$red" },
                    ["indent2"] = { fg = "$yellow" },
                    ["indent3"] = { fg = "$green" },
                    ["indent4"] = { fg = "$cyan" },
                    ["indent5"] = { fg = "$blue" },
                    ["indent6"] = { fg = "$purple" },

                    -- context color
                    ["contextIndent1"] = { fg = "$red", fmt = "reverse" },
                    ["contextIndent2"] = { fg = "$yellow", fmt = "reverse" },
                    ["contextIndent3"] = { fg = "$green", fmt = "reverse" },
                    ["contextIndent4"] = { fg = "$cyan", fmt = "reverse" },
                    ["contextIndent5"] = { fg = "$blue", fmt = "reverse" },
                    ["contextIndent6"] = { fg = "$purple", fmt = "reverse" },
                    ["contextIndent7"] = { fg = "$purple", fmt = "reverse" },

                    --bracket color
                    ["bracket1"] = { fg = "$red", fmt = "bold" },
                    ["bracket2"] = { fg = "$yellow", fmt = "bold" },
                    ["bracket3"] = { fg = "$green", fmt = "bold" },
                    ["bracket4"] = { fg = "$cyan", fmt = "bold" },
                    ["bracket5"] = { fg = "$blue", fmt = "bold" },
                    ["bracket6"] = { fg = "$purple", fmt = "bold" },

                    -- gitsign gutter color
                    ["GitSignsAdd"] = { fg = "$green", fmt = "bold" },
                    ["GitSignsAddNr"] = { fg = "$green", fmt = "bold" },
                    ["GitSignsChange"] = { fg = "$yellow", fmt = "bold" },
                    ["GitSignsChangeNr"] = { fg = "$yellow", fmt = "bold" },
                    ["GitSignsDelete"] = { fg = "$red", fmt = "bold" },
                    ["GitSignsDeleteNr"] = { fg = "$red", fmt = "bold" },
                    ["GitSignsTopDelete"] = { fg = "$red", fmt = "bold" },
                    ["GitSignsTopDeleteNr"] = { fg = "$red", fmt = "bold" },
                    ["GitSignsChangeDelete"] = { fg = "$orange", fmt = "bold" },
                    ["GitSignsChangeDeleteNr"] = { fg = "$orange", fmt = "bold" },
                    ["GitSignsUntracked"] = { fg = "$purple", fmt = "bold" },
                    ["GitSignsUntrackedNr"] = { fg = "$purple", fmt = "bold" },

                    -- auto complete menu color
                    ["CmpItemKindText"] = { fg = "$green" },
                    ["CmpItemKindMethod"] = { fg = "$purple" },
                    ["CmpItemKindFunction"] = { fg = "$purple" },
                    ["CmpItemKindConstructor"] = { fg = "$purple" },
                    ["CmpItemKindField"] = { fg = "$green" },
                    ["CmpItemKindVariable"] = { fg = "$blue" },
                    ["CmpItemKindClass"] = { fg = "$yellow" },
                    ["CmpItemKindInterface"] = { fg = "$yellow" },
                    ["CmpItemKindModule"] = { fg = "$red" },
                    ["CmpItemKindProperty"] = { fg = "$blue" },
                    ["CmpItemKindUnit"] = { fg = "$green" },
                    ["CmpItemKindValue"] = { fg = "$orange" },
                    ["CmpItemKindEnum"] = { fg = "$orange" },
                    ["CmpItemKindKeyword"] = { fg = "$yellow" },
                    ["CmpItemKindSnippet"] = { fg = "$yellow" },
                    ["CmpItemKindColor"] = { fg = "$fg" },
                    ["CmpItemKindFile"] = { fg = "$fg" },
                    ["CmpItemKindReference"] = { fg = "$fg" },
                    ["CmpItemKindFolder"] = { fg = "$yellow" },
                    ["CmpItemKindEnumMember"] = { fg = "$orange" },
                    ["CmpItemKindConstant"] = { fg = "$orange" },
                    ["CmpItemKindStruct"] = { fg = "$purple" },
                    ["CmpItemKindEvent"] = { fg = "$yellow" },
                    ["CmpItemKindOperator"] = { fg = "$cyan" },
                    ["CmpItemKindTypeParameter"] = { fg = "$green" },

                    -- dash board header color
                    ["dashHeaderBlue"] = { fg = "$blue", fmt = "bold,italic" },
                    ["dashHeaderGreen"] = { fg = "$green", fmt = "bold,italic" },
                    ["dashHeader1"] = { fg = "$red", fmt = "bold,italic" },
                    ["dashHeader2"] = { fg = "$orange", fmt = "bold,italic" },
                    ["dashHeader3"] = { fg = "$yellow", fmt = "bold,italic" },
                    ["dashHeader4"] = { fg = "$green", fmt = "bold,italic" },
                    ["dashHeader5"] = { fg = "$cyan", fmt = "bold,italic" },
                    ["dashHeader6"] = { fg = "$blue", fmt = "bold,italic" },
                    ["dashHeader7"] = { fg = "$purple", fmt = "bold,italic" },

                    -- dash board button color
                    ["dashButton1"] = { fg = "$red", fmt = "bold" },
                    ["dashButton2"] = { fg = "$orange", fmt = "bold" },
                    ["dashButton3"] = { fg = "$yellow", fmt = "bold" },
                    ["dashButton4"] = { fg = "$green", fmt = "bold" },
                    ["dashButton5"] = { fg = "$cyan", fmt = "bold" },
                    ["dashButton6"] = { fg = "$blue", fmt = "bold" },

                    -- other dash color
                    ["dashMoto"] = { fg = "$grey", fmt = "bold,italic" },
                    ["dashInfo"] = { fg = "$blue", fmt = "bold" },
                    ["dashInfoSec"] = { fg = "$yellow", fmt = "bold" },
                    ["dashButton"] = { fg = "$blue", fmt = "bold" },
                    ["dashIcon"] = { fg = "$blue", fmt = "bold" },
                    ["dashShortcutSec"] = { fg = "$green", fmt = "bold" },
                    ["dashShortcutTer"] = { fg = "$blue", fmt = "bold" },
                    ["dashShortcut"] = { fg = "$yellow", fmt = "bold,italic" },
                    ["dashFooter"] = { fg = "$purple", fmt = "bold" },

                    -- telescope color
                    ["TelescopeSelection"] = { fg = "$blue", bg = "$bg3" },

                    ["TelescopePromptTitle"] = { fg = "$purple", fmt = "inverse" },
                    ["TelescopePromptBorder"] = { fg = "$bg3", bg = "$bg3" },
                    ["TelescopePromptNormal"] = { fg = "$blue", bg = "$bg3" },

                    ["TelescopeResultsTitle"] = { fg = "$yellow", fmt = "inverse" },
                    ["TelescopeResultsBorder"] = { fg = "$bg2", bg = "$bg2" },
                    ["TelescopeResultsNormal"] = { fg = "$fg", bg = "$bg2" },

                    ["TelescopePreviewTitle"] = { fg = "$green", fmt = "inverse" },
                    ["TelescopePreviewBorder"] = { fg = "$bg1", bg = "$bg1" },
                    ["TelescopePreviewNormal"] = { fg = "$fg", bg = "$bg1" },
                },
                diagnostics = {
                    darker = false,
                },
            })
            require("onedark").load()

            local colors = require("onedark.colors")

            vim.o.guicursor =
                "n-o:block-nCursor,i:ver20-iCursor,v-ve:block-vCursor,c-ci-cr:ver25-cCursor,r:hor15-rCursor"

            -- line number color
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.blue })
            vim.api.nvim_create_autocmd("ModeChanged", {
                pattern = "*",
                callback = function()
                    if mode.isNormal() then
                        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.blue })
                        vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.blue, bold = true })
                    elseif mode.isInsert() then
                        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.green })
                        vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.green, bold = true })
                    elseif mode.isVisual() then
                        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.purple })
                        vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.purple, bold = true })
                    elseif mode.isReplace() then
                        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.red })
                        vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.red, bold = true })
                    end
                end,
            }) -- format when save
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
                    b = { fg = colors.blue, bg = colors.darkBlue },
                    c = { fg = colors.blue, bg = colors.darkerBlue },
                },
                visual = {
                    a = { fg = colors.bg0, bg = colors.purple, gui = "bold" },
                    b = { fg = colors.purple, bg = colors.darkPurple },
                    c = { fg = colors.purple, bg = colors.darkerPurple },
                },
                replace = {
                    a = { fg = colors.bg0, bg = colors.red, gui = "bold" },
                    b = { fg = colors.red, bg = colors.darkRed },
                    c = { fg = colors.red, bg = colors.darkerRed },
                },
                insert = {
                    a = { fg = colors.bg0, bg = colors.green, gui = "bold" },
                    b = { fg = colors.green, bg = colors.darkGreen },
                    c = { fg = colors.green, bg = colors.darkerGreen },
                },
                command = {
                    a = { fg = colors.bg0, bg = colors.yellow, gui = "bold" },
                    b = { fg = colors.yellow, bg = colors.darkYellow },
                    c = { fg = colors.yellow, bg = colors.darkerYellow },
                },
                terminal = { a = { fg = colors.bg0, bg = colors.cyan, gui = "bold" } },
            }

            local hideWidth = 110
            local function hide(width)
                width = width or hideWidth
                return function(str)
                    return vim.api.nvim_win_get_width(0) <= width and "" or str
                end
            end

            local function isCramp()
                return vim.api.nvim_win_get_width(0) <= hideWidth
            end

            local function editorIsCramp(width)
                width = width or hideWidth
                return vim.api.nvim_list_uis()[1].width <= width
            end

            local function winNum()
                return vim.api.nvim_win_get_width(0) <= 90 and vim.fn.winnr() .. " / " .. vim.api.nvim_get_current_buf()
                    or "W: " .. vim.fn.winnr() .. " / B: " .. vim.api.nvim_get_current_buf()
            end

            local function winSize()
                return (vim.api.nvim_win_get_width(0) <= 90)
                        and (vim.api.nvim_win_get_height(0) .. " x " .. vim.api.nvim_win_get_width(0))
                    or ("H: " .. vim.api.nvim_win_get_height(0) .. " x W: " .. vim.api.nvim_win_get_width(0))
            end

            local function modeIcon()
                return mode.isNormal() and ""
                    or mode.isInsert() and ""
                    or mode.isVisual() and "󰒉"
                    or mode.isCommand() and ""
                    or mode.isReplace() and ""
                    or vim.api.nvim_get_mode().mode == "t" and ""
                    or ""
            end

            local function countLoc()
                return "LOC: " .. vim.fn.line("$")
            end

            local function lineLength()
                return "LEN: " .. #vim.fn.getline("."):gsub("^%s*(.-)%s*$", "%1") .. "/" .. #vim.fn.getline(".")
            end

            local function nvimVer()
                local version = vim.version()
                return "NVIM v" .. version.major .. "." .. version.minor .. "." .. version.patch
            end

            local function bufferCount()
                return "Buffers: " .. #vim.fn.getbufinfo({ buflisted = true })
            end

            local function cwd()
                local shortern = {
                    { path = "C:\\Users\\nphuy\\OneDrive\\Desktop\\Code", short = "<Code>" },
                    { path = "C:\\Users\\nphuy\\OneDrive\\Desktop", short = "Desktop" },
                    { path = "C:\\Users\\nphuy\\AppData\\Local\\nvim", short = "Neovim Config" },
                    { path = "C:\\Users\\nphuy", short = "HOME" },
                }
                local path = vim.fn.getcwd()
                for _, p in ipairs(shortern) do
                    path = path:gsub(p.path, p.short)
                end
                return "Cwd: " .. (#path >= 40 and "..." or "") .. path:sub(-80)
            end

            local function altFile()
                local file = vim.fn.expand("#:t")
                return "Alt: " .. (file == "" and "[No name]" or file)
            end

            local fancyFileName = {
                { "filetype", colored = true, icon_only = true, icon = { align = "right" } },
                "filename",
            }

            require("lualine").setup({
                options = {
                    component_separators = { left = "\\", right = "/" },
                    section_separators = { left = "", right = "" },
                    theme = customOneDark,
                    globalstatus = true,
                },
                sections = {
                    lualine_a = { modeIcon, "mode" },
                    lualine_b = {
                        {
                            "branch",
                            fmt = function(branch)
                                return (branch == "master" or branch == "main") and "<MAIN>" or branch
                            end,
                        },
                        {
                            "diff",
                            fmt = hide(),
                        },
                    },
                    lualine_c = {
                        { lineLength, icon = "", fmt = hide() },
                        { "filetype", colored = true, icon_only = true, icon = { align = "right" }, separator = "" },
                        "filename",
                    },
                    lualine_x = { "diagnostics", { "filesize", icon = "" } },
                    lualine_y = {
                        { countLoc, icon = "", fmt = hide() },
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
                                return isCramp() and "" or "[" .. (count == "" and 0 or count) .. "]"
                            end,
                        },
                        "location",
                    },
                },
                tabline = {
                    lualine_a = { { nvimVer, icon = "", separator = { right = "" } } },
                    lualine_b = {
                        {
                            bufferCount,
                            icon = "󰌨",
                            separator = { right = "" },
                            on_click = function()
                                utils.feedkeys("<leader>sb")
                            end,
                        },
                    },
                    lualine_c = {
                        {
                            cwd,
                            icon = "",
                            on_click = function()
                                utils.feedkeys("<leader>sf")
                            end,
                        },
                    },
                    lualine_x = {
                        {
                            '"Reg: " .. vim.v.register',
                            icon = "󱓥",
                            function(text)
                                return editorIsCramp() and vim.v.register or text
                            end,
                            on_click = function()
                                utils.feedkeys("<leader>sR")
                            end,
                        },
                        {
                            '"Zoom: " .. vim.g.neovide_scale_factor',
                            icon = "󰍉",
                            function(text)
                                return editorIsCramp() and vim.g.neovide_scale_factor or text
                            end,
                            on_click = function()
                                utils.feedkeys("<leader>z")
                            end,
                        },
                    },
                    lualine_y = {
                        {
                            function()
                                local stats = require("lazy").stats()
                                return editorIsCramp() and stats.loaded .. "/" .. stats.count
                                    or stats.loaded .. "/" .. stats.count .. " Plugins loaded"
                            end,
                            icon = "",
                            separator = { left = "" },
                            on_click = function()
                                utils.feedkeys("<leader>l")
                            end,
                        },
                    },
                    lualine_z = {
                        {
                            "datetime",
                            icon = "󰃮",
                            style = "%a, %b %d | %I:%M:%S %p",
                            separator = { left = "" },
                            fmt = function(text)
                                return editorIsCramp() and "T" or text
                            end,
                        },
                    },
                },
                winbar = {
                    lualine_x = {
                        {
                            altFile,
                            icon = "",
                            on_click = function()
                                utils.feedkeys("<C-Tab>")
                            end,
                        },
                    },
                    lualine_y = { { winSize, icon = "󰗆" } },
                    lualine_z = { { winNum, icon = "󰻾" } },
                },
                inactive_winbar = {
                    lualine_a = fancyFileName,
                    lualine_z = { { winNum, icon = "󰻾" } },
                    lualine_y = { { winSize, icon = "󰗆" } },
                },
            })
        end,
    },

    -- Add indentation guides
    {
        "lukas-reineke/indent-blankline.nvim",
        version = "2.20.8",
        opts = {
            max_indent_increase = 1,
            char_blankline = "∙",
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
                    math.random(5) == 1 and altHeader[math.random(#altHeader)]
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
                    button("r", "Recently Open", "󱦻", "<cmd>Telescope oldfiles<cr>", "dashButton2"),
                    button("n", "New Scratch", "", "<cmd>Scratch<cr>", "dashButton3"),
                    button(
                        "s",
                        "School Note",
                        "",
                        "<cmd>cd C:\\Users\\nphuy\\OneDrive\\Desktop\\School Note<cr><cmd>Telescope find_files<cr>",
                        "dashButton4"
                    ),
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
                pattern = "VeryLazy",
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
    "winston0410/range-highlight.nvim",
}
