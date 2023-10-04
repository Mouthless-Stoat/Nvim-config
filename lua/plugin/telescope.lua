return {

    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            -- change command cus powershell is defaults shell
            build = "(cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release) -and (cmake --build build --config Release) -and (cmake --install build --prefix build)",
        },
    },
    keys = {
        { "<Leader>sf", "<cmd>Telescope find_files no_ignore=true<cr>", desc = "[s]earch [f]iles" },
        { "<Leader>sF", "<cmd>Telescope find_files no_ignore=true hidden=true<cr>", desc = "[s]earch hidden [F]iles" },
        { "<Leader>st", "<cmd>Telescope live_grep no_ignore=true<cr>", desc = "[s]earch [t]ext" },
        { "<Leader>sT", "<cmd>Telescope live_grep no_ignore=true hidden=true<cr>", desc = "[s]earch hidden [T]ext" },
        {
            "<Leader>sj",
            "<cmd>Telescope jumplist<cr>",
            desc = "[s]earch cursor [j]ump list",
        },
        { "<Leader>sR", "<cmd>Telescope registers<cr>", desc = "[s]earch [R]egisters" },
        { "<Leader>sk", "<cmd>Telescope keymaps<cr>", desc = "[s]earch [k]eymaps" },
        { "<Leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "[s]earch [d]iagnostics" },
        { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "[r]ecent file list" },
        { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "[b]uffers list" },
        { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "[m]arks list" },

        -- git stuff
        { "<leader>gS", "<cmd>Telescope git_status<cr>", desc = "[g]it status" },
        { "<leader>gl", "<cmd>Telescope git_commits<cr>", desc = "[g]it commit [l]ogs" },
    },
    opts = {
        defaults = {
            scroll_strategy = "limit",
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    width = 0.99,
                },
            },
            path_display = { "truncate", truncate = 5 },
            file_ignore_patterns = {
                "node_modules\\",
                "__pycache__\\",
                ".git\\",
                "%.zip",
                "%.tar",
                "%.gz",
                "%.7zip",
                "%.exe",
                "%.pyc",
            },
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
    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("fzf")
    end,
    cmd = "Telescope",
}
