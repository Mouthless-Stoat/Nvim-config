return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- create group
        defaults = {
            ["<leader>s"] = { name = "[s]earch" },
            ["<leader>q"] = { name = "[q]uit" },
            ["<leader>G"] = { name = "[G]oto" },
            ["<leader>g"] = { name = "[g]it" },
            ["<leader>f"] = { name = "[f]iles" },
            ["<leader>w"] = { name = "[w]indow" }
        },

        icons = {
            breadcrumb = ">>", -- symbol used in the command line area that shows your active key combo
        },

        triggers_blacklist = {
            -- exclude v from which-key
            n = { "v" }
        },

        window = {
            border = "single",
        },

        layout = {
            align = "center"
        }
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register(opts.defaults)
    end,
}
