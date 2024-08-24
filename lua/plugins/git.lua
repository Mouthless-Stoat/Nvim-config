local utils = require("helper.utils")
return {
    {
        "tpope/vim-fugitive",
        keys = {
            { "<Leader>gp", "<cmd>Git push<cr>", desc = "[g]it [p]ush" },
            { "<Leader>gs", "<cmd>Git<cr>", desc = "[g]it [s]tatus" },
        },
        lazy = false,
    },
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "│" },
                untracked = { text = "┊" },
            },

            signs_staged = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "│" },
                untracked = { text = "┊" },
            },
            numhl = true,
            on_attach = function(bufnr)
                local gitsigns = require("gitsigns")
                utils.setKey("n", "<Leader>ga", gitsigns.stage_hunk, { buffer = bufnr, desc = "[g]it [h]unk st[a]ge" })
                utils.setKey("n", "<Leader>gr", gitsigns.reset_hunk, { buffer = bufnr, desc = "[g]it [h]unk [r]eset" })
                utils.setKey(
                    "n",
                    "<Leader>gu",
                    gitsigns.undo_stage_hunk,
                    { buffer = bufnr, desc = "[g]it [h]unk [r]eset" }
                )

                utils.setKey("v", "<Leader>ga", function()
                    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, { buffer = bufnr, desc = "[g]it [h]unk st[a]ge" })

                utils.setKey("v", "<Leader>gr", function()
                    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, { buffer = bufnr, desc = "[g]it [h]unk [r]eset" })

                utils.setKey(
                    { "n", "v" },
                    "<Leader>gv",
                    gitsigns.preview_hunk,
                    { buffer = bufnr, desc = "[g]it [h]unk pre[v]iew" }
                )
            end,
        },
        event = { "BufReadPost", "BufNewFile" },
    },
}
