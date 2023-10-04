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
                desc = "[g]it [c]ommit all",
            },
            {
                "<leader>gC",
                function()
                    vim.ui.input({ prompt = "Enter commit message: " }, function(input)
                        vim.cmd([[Git commit -m "]] .. input .. [["]])
                    end)
                end,
                desc = "[g]it [c]ommit added",
            },
            { "<leader>gp", "<cmd>Git push<cr>", desc = "[g]it [p]ush" },
            { "<leader>ga", "<cmd>Git add *<cr>", desc = "[g]it [a]dd all" },
            { "<leader>g.", "<cmd>Gwrite<cr>", desc = "[g]it [a]dd current file" },
            { "<leader>gs", "<cmd>Git<cr>", desc = "[g]it [s]tatus" },
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
                utils.setKey(
                    { "n", "v" },
                    "<leader>gha",
                    gitsign.stage_hunk,
                    { buffer = bufnr, desc = "[g]it [h]unk [a]dd" }
                )
                utils.setKey(
                    { "n", "v" },
                    "<leader>ghr",
                    gitsign.reset_hunk,
                    { buffer = bufnr, desc = "[g]it [h]unk [r]eset" }
                )
            end,
        },
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    },
}
