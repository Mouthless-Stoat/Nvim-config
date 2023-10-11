local utils = require("helper.utils")
return {
    {
        "tpope/vim-fugitive",
        keys = {
            {
                "<Leader>gc",
                function()
                    vim.ui.input({ prompt = "Enter commit message: " }, function(input)
                        vim.cmd([[Git ca "]] .. input .. [["]])
                    end)
                end,
                desc = "[g]it [c]ommit all",
            },
            {
                "<Leader>gC",
                function()
                    vim.ui.input({ prompt = "Enter commit message: " }, function(input)
                        vim.cmd([[Git commit -m "]] .. input .. [["]])
                    end)
                end,
                desc = "[g]it [c]ommit added",
            },
            { "<Leader>gp", "<cmd>Git push<cr>", desc = "[g]it [p]ush" },
            { "<Leader>ga", "<cmd>Git add *<cr>", desc = "[g]it [a]dd all" },
            { "<Leader>g.", "<cmd>Gwrite<cr>", desc = "[g]it [a]dd current file" },
            { "<Leader>gs", "<cmd>Git<cr>", desc = "[g]it [s]tatus" },
        },
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
                utils.setKey(
                    "n",
                    "<Leader>ghp",
                    gitsign.preview_hunk,
                    { buffer = bufnr, desc = "[g]it [h]unk [p]review" }
                )
                utils.setKey("n", "<Leader>ghn", gitsign.next_hunk, { buffer = bufnr, desc = "[g]it [h]unk [n]ext" })
                utils.setKey("n", "<Leader>ghb", gitsign.prev_hunk, { buffer = bufnr, desc = "[g]it [h]unk [b]ack" })
                utils.setKey(
                    { "n", "v" },
                    "<Leader>gha",
                    gitsign.stage_hunk,
                    { buffer = bufnr, desc = "[g]it [h]unk [a]dd" }
                )
                utils.setKey(
                    { "n", "v" },
                    "<Leader>ghr",
                    gitsign.reset_hunk,
                    { buffer = bufnr, desc = "[g]it [h]unk [r]eset" }
                )
            end,
        },
        event = { "BufReadPost", "BufNewFile" },
    },
}
