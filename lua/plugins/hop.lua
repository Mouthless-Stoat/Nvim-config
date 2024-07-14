return {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
        keys = "etovxqpdygfblzhckisuran",
    },
    keys = {
        {
            "<leader><leader>",
            function()
                require("hop").hint_words()
            end,
            desc = "[h]op [w]ord",
        },
    },
    event = { "BufReadPost", "BufNewFile" },
}
