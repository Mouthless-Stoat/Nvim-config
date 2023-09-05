local setKey = vim.keymap.set
local addCommand = vim.api.nvim_create_user_command

vim.g.mapleader = " " -- set the leader to a space

-- lone keymap
setKey({ "n", "i" }, "<C-s>", vim.cmd.w, {})
setKey("t", "<esc>", "<C-\\><C-n>", {})                       -- set <esc> in terminal mode to quit
setKey("i", "<c-v>", "<c-r>*", {})                            -- set <c-v> in insert mode to paste
setKey("n", "<c-`>", "<cmd>ter<cr>", { desc = "[t]erminal" }) -- open terminal
setKey("n", "<s-cr>", "i<cr><esc>", {})                       -- set <s-cr> in normal mode to insert a newline
setKey("n", "Q", "<nop>", {})                                 -- me and the bois hate Q

-- move line command
setKey({ "n", "i" }, "<a-Up>", "<esc><cmd>m .-2<cr>==") -- cus <esc> in normal mode do nothing we can combine the command
setKey({ "n", "i" }, "<a-Down>", "<esc><cmd>m .+1<cr>==")
setKey("v", "<a-Up>", ":m '<-2<cr>gv=gv")
setKey("v", "<a-Down>", ":m '>+1<cr>gv=gv")

-- short command
setKey("n", "<leader>r", "<cmd>bro ol<cr>", { desc = "[r]ecent file list" })
setKey("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "[l]azy.nvim config" })
setKey("n", "<leader>m", "<cmd>Mason<cr>", { desc = "[m]ason.nvim config" })

-- Window control keybind
setKey({ "n", "i" }, "<c-Tab>", "<c-w>w", { desc = "Switch to next window" }) -- set <s-Tab> to switch wimdow
setKey("n", "<leader>wx", "<c-w>o", { desc = "Quit all other window" })

-- arrow key version
setKey({ "n", "i" }, "<s-Up>", "<c-w>+", { desc = "Switch to up window" })
setKey({ "n", "i" }, "<s-Down>", "<c-w>-", { desc = "Switch to down window" })
setKey({ "n", "i" }, "<s-Left>", "<c-w><", { desc = "Switch to left window" })
setKey({ "n", "i" }, "<s-Right>", "<c-w>>", { desc = "Switch to right window" })

setKey({ "n", "i" }, "<c-Up>", "<c-w><Up>", {})
setKey({ "n", "i" }, "<c-Down>", "<c-w><Down>", {})
setKey({ "n", "i" }, "<c-Left>", "<c-w><Left>", {})
setKey({ "n", "i" }, "<c-Right>", "<c-w><Right>", {})

-- make new window
setKey("n", "<leader>w<Up>", function()
    local preVal = vim.o.splitbelow
    vim.o.splitbelow = false
    vim.cmd.new()
    vim.o.splitbelow = preVal
end, { desc = "Make new window [up]" })
setKey("n", "<leader>w<Down>", function()
    local preVal = vim.o.splitbelow
    vim.o.splitbelow = true
    vim.cmd.new()
    vim.o.splitbelow = preVal
end, { desc = "Make new window [down]" })
setKey("n", "<leader>w<Left>", function()
    local preVal = vim.o.splitright
    vim.o.splitright = false
    vim.cmd.vne()
    vim.o.splitright = preVal
end, { desc = "Make new window [left]" })
setKey("n", "<leader>w<Right>", function()
    local preVal = vim.o.splitright
    vim.o.splitright = true
    vim.cmd.vne()
    vim.o.splitright = preVal
end, { desc = "Make new window [right]" })


-- Quit keymap
setKey("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "[Q]uit all" })
setKey("n", "<leader>qq", "<cmd>q!<cr>", { desc = "[q]uit current window" })
setKey("n", "<leader>qs", vim.cmd.wq, { desc = "[q]uit and [s]ave current window" })
setKey("n", "<leader>qa", vim.cmd.wqa, { desc = "[q]uit and save [a]ll windows" })

local anchors = {
    {
        key = "c",
        path = "C:\\Users\\nphuy\\OneDrive\\Desktop\\Code",
        type = "folder",
        desc = "[c]ode folder"
    },
    {
        key = "m",
        path = "C:\\Users\\nphuy\\OneDrive\\Desktop\\Code\\DiscordBot\\discord.js\\IMFMagpie\\index.js",
        type = "file",
        desc = "[m]agpie code"
    },
    {
        key = "d",
        path = "C:\\Users\\nphuy\\OneDrive\\Desktop\\Code\\DiscordBot\\discord.js\\Dyyes\\index.ts",
        type = "file",
        desc = "[d]yyes code"
    },
    {
        key = "v",
        path = "C:\\Users\\nphuy\\AppData\\Local\\nvim",
        type = "folder",
        desc = "[v]im config folder"
    }
}
for _, anchor in ipairs(anchors) do
    if (anchor.type == "folder") then
        setKey("", "<leader>g" .. anchor.key, "<cmd>cd " .. anchor.path .. "<cr><cmd>Telescope find_files<cr>",
            { desc = anchor.desc })
    elseif (anchor.type == "file") then
        setKey("", "<leader>g" .. anchor.key, "<cmd>e " .. anchor.path .. "<cr><cmd>Here<cr>",
            { desc = anchor.desc })
    end
end

-- file keymap
setKey("n", "<leader>fr", vim.lsp.buf.rename, { desc = "[f]ile [r]ename" })
setKey("n", "<leader>fe", vim.cmd.Ex, { desc = "[f]ile [e]xplorer" })

addCommand("Here", "cd %:h", {})

-- auto command
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]] -- format when save

-- these config so which-key work correctly
vim.o.timeout = true
vim.o.timeoutlen = 300

-- show line number and set to relative
vim.o.number = true
vim.o.rnu = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- replace tab with space and set shift width(using the >> command) to use 4 space as well
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.updatetime = 250     -- Decrease update time

vim.o.signcolumn = 'yes'   -- Keep signcolumn on by default

vim.o.showmode = false     -- hide the `--INSERT--` at the bottom use status line instead

vim.o.termguicolors = true -- color in terminal

vim.o.hlsearch = false     -- turn hightlight off after searching

vim.o.breakindent = true   -- when line wrap around also copy indent

vim.o.showbreak = "> "     -- wrap indicator

-- persistent undo
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = "C:\\Users\\nphuy\\AppData\\Local\\nvim-data\\undo"
vim.o.undofile = true

-- terminal shit
vim.o.gfn = "CaskaydiaCove Nerd Font Mono:h12" --set font and size

vim.o.shell = "powershell"
vim.o.shellcmdflag = "-c"

-- Install Lazy.vim for phugin managment https://github.com/folke/lazy.nvim#-installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

-- setup phugin using lazy.vim
require("lazy").setup({
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
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

            vim.cmd([[highlight bracket1 guifg=]] .. colors.red .. [[ gui=bold]])
            vim.cmd([[highlight bracket2 guifg=]] .. colors.yellow .. [[ gui=bold]])
            vim.cmd([[highlight bracket3 guifg=]] .. colors.green .. [[ gui=bold]])
            vim.cmd([[highlight bracket4 guifg=]] .. colors.cyan .. [[ gui=bold]])
            vim.cmd([[highlight bracket5 guifg=]] .. colors.blue .. [[ gui=bold]])
            vim.cmd([[highlight bracket6 guifg=]] .. colors.purple .. [[ gui=bold]])
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
                    section_separators = { left = '', right = '' },
                    theme = customOneDark
                },
                sections = {
                    lualine_a = { {
                        "mode",
                        icon_enable = true,
                        fmt = function()
                            local vimMode = vim.api.nvim_get_mode().mode
                            return vimMode == "n" and "" or (vimMode == "i" or vimMode == "niI") and "" or
                                vimMode == "v" and "󰒉" or
                                vimMode == "c" and "" or vimMode == "r" and "" or vimMode == "t" and "" or ""
                        end
                    }, {
                        "mode",
                        icon_enable = true,
                    } },
                }
            })
        end,
    },

    -- Add indentation guides
    {
        'lukas-reineke/indent-blankline.nvim',
        opts = {
            char = '|',
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
    },

    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Mason
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',

            -- Spinning bar at the corner to show progress
            { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',

            -- Auto complete
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',

            -- snippet engine for  autocomplete
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            local on_attach = function(_, bufnr)
                -- function to help remap
                local nmap = function(keys, func, desc, mode)
                    local modeToPut = { "n" }
                    if desc then
                        desc = 'LSP: ' .. desc
                    end

                    if mode then
                        table.insert(modeToPut, mode)
                    end

                    vim.keymap.set(modeToPut, keys, func, { buffer = bufnr, desc = desc })
                end
                nmap('<leader>c', vim.lsp.buf.code_action, '[c]ode actions')

                nmap('gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
                nmap('gr', "<cmd>Telescope lsp_references", '[g]oto [r]eferences')
                nmap('gi', vim.lsp.buf.implementation, '[g]oto [i]mplementation')
                nmap('<leader>d', vim.lsp.buf.type_definition, 'type [D]efinition')
                nmap('<leader>ss', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[s]earch [s]ymbols')

                -- See `:help K` for why this keymap
                nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
                nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation', "i")

                -- Lesser used LSP functionality
                nmap('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
            end

            -- Setup neovim lua configuration
            require('neodev').setup()

            -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

            -- configure auto complete
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'
            require('luasnip.loaders.from_vscode').lazy_load()
            luasnip.config.setup {}

            cmp.setup {
                completion = { completeopt = 'menu,menuone,noinsert' },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert {
                    ['<Down>'] = cmp.mapping.select_next_item(),
                    ['<Up>'] = cmp.mapping.select_prev_item(),
                    ['<C-Space>'] = cmp.mapping.complete {},   -- open auto complete
                    ['<Tab>'] = cmp.mapping(function(fallback) -- if the auto complete menu is open confirm if not snippet time
                        if cmp.visible() then
                            cmp.confirm {
                                behavior = cmp.ConfirmBehavior.Replace,
                                select = true,
                            }
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end
                    ),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
            }

            -- set up mason
            require("mason").setup()
            local mason_lspconfig = require('mason-lspconfig')
            mason_lspconfig.setup()
            mason_lspconfig.setup_handlers {
                function(server_name)
                    require('lspconfig')[server_name].setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                    }
                end,
                ["lua_ls"] = function()
                    require("lspconfig")["lua_ls"].setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = {
                            Lua = {
                                workspace = { checkThirdParty = false },
                                telemetry = { enable = false }
                            }
                        }
                    }
                end
            }
        end
    },

    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                -- change command cus powershell is defaults shell
                build =
                "(cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release) -and (cmake --build build --config Release) -and (cmake --install build --prefix build)"
            }
        },
        keys = {
            { "<Leader>sf", "<cmd>Telescope find_files<cr>",             desc = "[s]earch [f]iles" },
            { "<Leader>sh", "<cmd>Telescope find_files hidden=true<cr>", desc = "[s]earch [h]idden files" },
            { "<Leader>st", "<cmd>Telescope live_grep<cr>",              desc = "[s]earch [t]ext" },
        },
        opts = {
            defaults = {
                scroll_strategy = "limit",
                file_ignore_patterns = {
                    "node_modules",
                    "%.zip",
                    "%.exe"
                }
            }
        },
        config = function(_, opts)
            require("telescope").setup(opts)
            require('telescope').load_extension('fzf')
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "python" },
                auto_install = true, -- auto install if missing
                highlight = {
                    enable = true,
                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },

    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, desc = "[u]ndo tree" }
        },
        config = function()
            vim.g.undotree_DiffAutoOpen = 0
            vim.g.undotree_SetFocusWhenToggle = 1
        end
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- create group
            defaults = {
                ["<leader>s"] = { name = "[s]earch" },
                ["<leader>q"] = { name = "[q]uit" },
                ["<leader>g"] = { name = "[g]oto" },
                ["<leader>f"] = { name = "[f]iles" },
                ["<leader>w"] = { name = "[w]indow" }
            },

            icons = {
                breadcrumb = ">>", -- symbol used in the command line area that shows your active key combo
            },

            triggers_blacklist = {
                -- exclude v from which-key
                n = { "v" }
            },

            window = {
                border = "single",
            },

            layout = {
                align = "center"
            }
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.register(opts.defaults)
        end,
    }
})

