---@diagnostic disable: missing-fields
return {
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
            nmap('gt', vim.lsp.buf.type_definition, '[g]oto [t]ype definition')
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
                ['<C-Space>'] = cmp.mapping(function(fallback) -- if the menu is not open open it, else close it
                    if cmp.visible() then
                        cmp.close()
                    elseif not cmp.visible() then
                        cmp.complete {}
                    else
                        fallback()
                    end
                end),
                ['<Tab>'] = cmp.mapping(function(fallback) -- if the auto complete menu is open confirm if not snippet time
                    if cmp.visible() then
                        cmp.confirm {
                            behavior = cmp.ConfirmBehavior.Insert,
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
                { name = 'nvim_lsp_signature_help' },
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
}
