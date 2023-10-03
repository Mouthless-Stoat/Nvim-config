local utils = require("helper.utils")
return {
    {
        "tpope/vim-fugitive",
        keys = {
            {
                "<leader>gc",
                function()
                    vim.ui.input({ prompt = "Enter commit message: " }, function(input)
                        vim.cmd([[Git ca "]] .. input .. [["]])
                    end)
                end,
                desc = "[g]it [a]dd all",
            },
            { "<leader>gp", "<cmd>Git push<cr>", desc = "[g]it [p]ush" },
            { "<leader>ga", "<cmd>Git add *<cr>", desc = "[g]it [a]dd" },
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
                    "<leader>ghp",
                    gitsign.preview_hunk,
                    { buffer = bufnr, desc = "[g]it [h]unk [p]review" }
                )
                utils.setKey("n", "<leader>ghn", gitsign.next_hunk, { buffer = bufnr, desc = "[g]it [h]unk [n]ext" })
                utils.setKey("n", "<leader>ghb", gitsign.prev_hunk, { buffer = bufnr, desc = "[g]it [h]unk [b]ack" })
                utils.setKey({ "n", "v" }, "<leader>ghs", gitsign.stage_hunk)
                utils.setKey({ "n", "v" }, "<leader>ghr", gitsign.reset_hunk)
            end,
        },
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    },
}
