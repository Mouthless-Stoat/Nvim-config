vim.g.lspLines = true
return {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
        require("lsp_lines").setup()
    end,
    keys = {
        {
            "<leader>d",
            function()
                if vim.g.lspLines then
                    vim.diagnostic.config({
                        virtual_text = false,
                        virtual_lines = { highlight_whole_line = false },
                    })
                else
                    vim.diagnostic.config({
                        virtual_text = true,
                        virtual_lines = false,
                    })
                end
                vim.g.lspLines = not vim.g.lspLines
            end,
            desc = "Toggle lsp line [d]iagnostics",
        },
    },
}
