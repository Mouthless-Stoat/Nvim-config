
return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    keys = {
        -- commonly used command
        { "<Leader>sf", "<cmd>Telescope find_files no_ignore=true<cr>", desc = "[s]earch [f]iles" },
        { "<Leader>sF", "<cmd>Telescope find_files no_ignore=true hidden=true<cr>", desc = "[s]earch hidden [F]iles" },
        { "<Leader>st", "<cmd>Telescope live_grep no_ignore=true<cr>", desc = "[s]earch [t]ext" },
        { "<Leader>sT", "<cmd>Telescope live_grep no_ignore=true hidden=true<cr>", desc = "[s]earch hidden [T]ext" },

        -- other less use command
        { "<Leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "[s]earch [d]iagnostics" },
        { "<Leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "[s]earch [r]ecent file" },

        -- git stuff
        { "<Leader>gS", "<cmd>Telescope git_status<cr>", desc = "[g]it status" },
        { "<Leader>gl", "<cmd>Telescope git_commits<cr>", desc = "[g]it commit [l]ogs" },
    },
    cmd = "Telescope",
    opts = {
        defaults = {
            scroll_strategy = "limit",
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    width = 0.8,
                },
            },
            path_display = { "truncate", truncate = 5 },
            file_ignore_patterns = {
                "node_modules\\",
                "__pycache__\\",
                ".git\\",
                "target\\",
                "%.zip",
                "%.tar",
                "%.gz",
                "%.7zip",
                "%.exe",
                "%.pyc",
            },
            prompt_prefix = "  ",
            selection_caret = "▷ ",
        },
        pickers = {
            find_files = {
                layout_config = {
                    horizontal = {
                        preview_width = 0.6,
                    },
                },
            },
        },
    },
}
