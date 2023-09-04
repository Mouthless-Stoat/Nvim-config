return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                -- change command cus powershell is defaults shell
                build =
                "(cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release) -and (cmake --build build --config Release) -and (cmake --install build --prefix build)"
            }
        },
        keys = {
            { "<Leader>sf", "<cmd>Telescope find_files<cr>",             desc = "[s]earch [f]iles" },
            { "<Leader>sh", "<cmd>Telescope find_files hidden=true<cr>", desc = "[s]earch [h]idden files" },
            { "<Leader>st", "<cmd>Telescope live_grep<cr>",              desc = "[s]earch [t]ext" },
        },
        opts = {
            defaults = {
                scroll_strategy = "limit",
                file_ignore_patterns = {
                    "node_modules",
                    "%.zip",
                    "%.exe"
                }
            }
        },
        config = function(_, opts)
            require("telescope").setup(opts)
            require('telescope').load_extension('fzf')
        end,
    }
}
