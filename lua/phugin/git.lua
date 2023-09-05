local utils = require("utils")
return {
    {
        "tpope/vim-fugitive",
        keys = {
            {
                "<leader>gs",
                "<cmd>Git<cr>",
                desc = "[g]it [s]tatus"
            },
            {
                "<leader>gc",
                function()
                    vim.ui.input({ prompt = "Enter commit message" },
                        function(input) vim.cmd([[Git ca "]] .. input .. [["]]) end)
                end,
                desc = "[g]it [a]dd all"
            },
            {
                "<leader>gd",
                "<cmd>Gvdiffsplit<cr>",
                desc = "[g]it compare [d]iffence"
            },
            {
                "<leader>gh", "<cmd>Telescope git_commits<cr>", desc = "[g]it commit [h]istory"
            }
        }
    },
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            numhl = true,
            on_attach = function(bufnr)
                utils.setKey('n', '<leader>gp', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = '[g]it [p]review hunk' })
            end,
        },
    },
}
