return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- create group
        defaults = {
            ["<Leader>s"] = { name = "[s]earch" },
            ["<Leader>q"] = { name = "[q]uit" },
            ["<Leader>G"] = { name = "[G]oto" },
            ["<Leader>g"] = { name = "[g]it" },
            ["<Leader>f"] = { name = "[f]iles" },
            ["<Leader>w"] = { name = "[w]indow" },
            ["<Leader>t"] = { name = "[t]oggle window" },
            ["<Leader>gh"] = { name = "[h]unk" },
        },

        icons = {
            breadcrumb = ">>", -- symbol used in the command line area that shows your active key combo
        },

        triggers_blacklist = {
            -- exclude v from which-key
            n = { "v" },
        },

        window = {
            border = "single",
        },

        layout = {
            align = "center",
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register(opts.defaults)
    end,
}
