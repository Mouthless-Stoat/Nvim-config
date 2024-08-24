return {
    "stevearc/oil.nvim",
    opts = {
        default_file_explorer = true,
        keymaps = {
            ["<C-s>"] = false,
            ["<C-h>"] = false,
            ["<S-CR>"] = { "actions.select", opts = { vertical = true } },
            ["<esc>"] = { "actions.close", mode = "n" },
        },
        skip_confirm_for_simple_edits = true,
        view_options = {
            show_hidden = true,
        },

        float = {
            padding = 5,
            win_options = {
                winblend = 10,
            },
            preview_split = "right",
            override = function(conf)
                conf.style = "minimal"
                return conf
            end,
        },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>f", "<cmd>Oil --float<cr>", desc = "[f]ile explorer" },
    },
    cmd = {
        "Oil",
    },
}
