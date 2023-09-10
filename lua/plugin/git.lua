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
                    vim.ui.input({ prompt = "Enter commit message: " },
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
                "<leader>gl", "<cmd>Telescope git_commits<cr>", desc = "[g]it commit [l]ogs"
            },
            {
                "<leader>gp", "<cmd>Git push<cr>", desc = "[g]it [p]ush"
            }
        }
    },
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            numhl = true,
            on_attach = function(bufnr)
                utils.setKey('n', '<leader>ghp', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = '[g]it [h]unk [p]review' })
                utils.setKey('n', '<leader>ghn', require('gitsigns').next_hunk,
                    { buffer = bufnr, desc = '[g]it [h]unk [p]review' })
                utils.setKey('n', '<leader>ghb', require('gitsigns').prev_hunk,
                    { buffer = bufnr, desc = '[g]it [h]unk [p]review' })
            end,
        },
    },
}
