---@diagnostic disable: missing-fields
return {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Mason
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",

        -- Additional lua configuration, makes nvim stuff amazing!
        "folke/neodev.nvim",

        -- Auto complete and source
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-cmdline",
        "FelipeLema/cmp-async-path",

        -- snippet engine for  autocomplete
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        -- loading bar :)
        {

            "j-hui/fidget.nvim",
            tag = "legacy",
            opts = {
                text = {
                    done = "",
                    spinner = "pipe",
                },
                window = {
                    blend = 0,
                },
            },
        },
    },
    config = function()
        local on_attach = function(_, bufnr)
            -- function to help remap
            local nmap = function(keys, func, desc, mode)
                local modeToPut = { "n" }
                if desc then
                    desc = "LSP: " .. desc
                end

                if mode then
                    table.insert(modeToPut, mode)
                end

                vim.keymap.set(modeToPut, keys, func, { buffer = bufnr, desc = desc })
            end
            nmap("<Leader>c", vim.lsp.buf.code_action, "[c]ode actions")

            nmap("gd", vim.lsp.buf.definition, "[g]oto [d]efinition")
            nmap("gr", "<cmd>Telescope lsp_references<cr>", "[g]oto [r]eferences")
            nmap("gi", vim.lsp.buf.implementation, "[g]oto [i]mplementation")
            nmap("gt", vim.lsp.buf.type_definition, "[g]oto [t]ype definition")
            nmap("<Leader>ss", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[s]earch [s]ymbols")
            nmap("<F2>", vim.lsp.buf.rename, "[r]ename symbol")

            -- See `:help K` for why this keymap
            nmap("K", vim.lsp.buf.hover, "Hover Documentation")
            nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation", "i")

            -- Lesser used LSP functionality
            nmap("gD", vim.lsp.buf.declaration, "[g]oto [D]eclaration")
        end

        -- Setup neovim lua configuration
        require("neodev").setup()

        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        -- configure auto complete
        vim.o.pumheight = 15
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        require("luasnip.loaders.from_vscode").lazy_load()
        luasnip.config.setup({})

        local lspIcon = {
            Text = "󱀍",
            Method = "󰡱",
            Function = "󰊕",
            Constructor = "󱌣",
            Field = "",
            Variable = "󰫧",
            Class = "",
            Interface = "",
            Module = "",
            Property = "",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "󰌆",
            Snippet = "󰅌",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "",
        }
        cmp.setup({
            completion = { completeopt = "menu,menuone,noinsert" },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<Down>"] = cmp.mapping.select_next_item(),
                ["<Up>"] = cmp.mapping.select_prev_item(),
                ["<C-Space>"] = cmp.mapping(function(fallback) -- if the menu is not open open it, else close it
                    if not cmp.visible() then
                        cmp.complete({})
                    else
                        fallback()
                    end
                end),
                ["<esc>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.close()
                    else
                        fallback()
                    end
                end),
                ["<Tab>"] = cmp.mapping(
                    function(fallback) -- if the auto complete menu is open confirm if not snippet time
                        if cmp.visible() then
                            cmp.confirm({
                                behavior = cmp.ConfirmBehavior.Insert,
                                select = true,
                            })
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end
                ),
            }),
            sources = {
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "luasnip" },
                { name = "async_path" },
            },
            experimental = {
                ghost_text = true,
            },
            formatting = {
                format = function(entry, vim_item)
                    -- Kind icons
                    vim_item.kind = string.format("[%s %s]", lspIcon[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                    -- Source
                    vim_item.menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                        latex_symbols = "[LaTeX]",
                    })[entry.source.name]
                    return vim_item
                end,
            },
        })

        cmp.setup.cmdline(":", {
            completion = { autocomplete = false, completeopt = "menu,menuone,noinsert" },
            mapping = cmp.mapping.preset.cmdline({
                ["<Tab>"] = cmp.mapping(function(fallback)
                    vim.print(cmp.visible())
                    if cmp.visible() then
                        cmp.confirm()
                    elseif not cmp.visible() then
                        cmp.complete({})
                    else
                        fallback()
                    end
                end),
            }),
            sources = {
                { name = "async_path" },
                { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } },
            },
        })

        local servers = {
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
            pyright = {},
            tsserver = {},
        }
        -- set up mason
        require("mason").setup()
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
        })
        mason_lspconfig.setup_handlers({
            function(server_name)
                local setting = {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                }
                if server_name == "lua_ls" then
                    setting["root_dir"] = function()
                        return false
                    end
                end
                require("lspconfig")[server_name].setup(setting)
            end,
        })
        -- change diagnostic icon
        vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
        vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
        vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
        vim.fn.sign_define("DiagnosticSignHint", { text = "󰌶", texthl = "DiagnosticSignHint" })
    end,
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
}
