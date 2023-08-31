return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- create group
        defaults = {
            ["<leader>s"] = { name = "[s]earch" },
            ["<leader>sf"] = { name = "[s]earch [f]iles" },
        },

        icons = {
            breadcrumb = ">>", -- symbol used in the command line area that shows your active key combo
            separator = ">",   -- symbol used between a key and it's label
            group = "+",       -- symbol prepended to a group
        },

        triggers_blacklist = {
            -- exclude v from which-key
            n = { "v" }
        },

        window = {
            border = "single",

        }
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register(opts.defaults)
    end,
}
