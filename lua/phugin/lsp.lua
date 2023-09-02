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
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end
            nmap('<leader>c', vim.lsp.buf.code_action, '[c]ode actions')

            nmap('gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
            nmap('gr', require('telescope.builtin').lsp_references, '[g]oto [r]eferences')
            nmap('gi', vim.lsp.buf.implementation, '[g]oto [i]mplementation')
            nmap('<leader>d', vim.lsp.buf.type_definition, 'type [D]efinition')
            nmap('<leader>ss', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[f]ind [s]ymbols')

            -- See `:help K` for why this keymap
            nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
            nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

            -- Lesser used LSP functionality
            nmap('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
        end

        -- language server to install
        local servers = {
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
        }

        -- Setup neovim lua configuration
        require('neodev').setup()

        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        -- Ensure the servers above are installed
        local mason_lspconfig = require('mason-lspconfig')

        -- tell mason to download lsp
        mason_lspconfig.setup {
            ensure_installed = vim.tbl_keys(servers),
        }

        mason_lspconfig.setup_handlers {
            function(server_name)
                require('lspconfig')[server_name].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                }
            end
        }

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
    end
}
