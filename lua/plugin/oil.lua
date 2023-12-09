return {
    "stevearc/oil.nvim",
    opts = {
        keymaps = {
            ["<C-s>"] = false,
            ["<C-h>"] = false,
        },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>fe", "<cmd>Oil<cr>", desc = "[f]ile [e]xplorer" },
    },
    cmd = {
        "Oil",
    },
}
