return {
    "stevearc/oil.nvim",
    opts = {
        keymaps = {
            ["<C-s>"] = false,
            ["<C-h>"] = false,
        },
        skip_confirm_for_simple_edits = true,
        view_options = {
            show_hidden = true,
        },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>f", "<cmd>Oil<cr>", desc = "[f]ile [e]xplorer" },
    },
    cmd = {
        "Oil",
    },
}
