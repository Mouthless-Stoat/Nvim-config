local utils = require("helper.utils")
return {
    {
        "tpope/vim-fugitive",
        keys = {
            { "<Leader>gp", "<cmd>Git push<cr>", desc = "[g]it [p]ush" },
            { "<Leader>gs", "<cmd>Git<cr>", desc = "[g]it [s]tatus" },
        },
        lazy = false
    },
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
            numhl = true,
            on_attach = function(bufnr)
                local gitsign = require("gitsigns")
                utils.setKey( { "n", "v" },
                    "<Leader>ga",
                    gitsign.stage_hunk,
                    { buffer = bufnr, desc = "[g]it [h]unk [a]dd" }
                )
                utils.setKey( { "n", "v" },
                    "<Leader>gr",
                    gitsign.reset_hunk,
                    { buffer = bufnr, desc = "[g]it [h]unk [r]eset" }
                )
            end,
        },
        event = { "BufReadPost", "BufNewFile" },
    },
}
