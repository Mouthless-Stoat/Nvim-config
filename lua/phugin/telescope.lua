return {

    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            -- change command cus powershell is defaults shell
            build =
            "(cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release) -and (cmake --build build --config Release) -and (cmake --install build --prefix build)"
        },
    },
    keys = {
        { "<Leader>sf", "<cmd>Telescope find_files no_ignore=true<cr>",             desc = "[s]earch [f]iles" },
        { "<Leader>sF", "<cmd>Telescope find_files no_ignore=true hidden=true<cr>", desc = "[s]earch hidden [F]iles" },
        { "<Leader>st", "<cmd>Telescope live_grep no_ignore=true<cr>",              desc = "[s]earch [t]ext" },
        { "<Leader>sT", "<cmd>Telescope live_grep no_ignore=true hidden=true<cr>",  desc = "[s]earch hidden [T]ext" },
    },
    opts = {
        defaults = {
            scroll_strategy = "limit",
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    width = 0.99,
                    preview_width = 0.8
                }
            },
            file_ignore_patterns = {
                "node_modules\\",
                ".git\\",
                "%.zip",
                "%.tar",
                "%.gz",
                "%.7zip",
                "%.exe"
            }
        }
    },
    config = function(_, opts)
        require("telescope").setup(opts)
        require('telescope').load_extension('fzf')
    end,

    lazy = false
}
