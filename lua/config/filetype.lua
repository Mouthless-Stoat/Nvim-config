vim.filetype.add({
    extension = {
        ua = function(_, bufnr)
            return "uiua",
                function()
                    vim.lsp.start({
                        name = "uiua_lsp",
                        cmd = { "uiua", "lsp" },
                    })
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

                    -- Lesser used LSP functionality
                    nmap("gD", vim.lsp.buf.declaration, "[g]oto [D]eclaration")
                end
        end,
    },
})
