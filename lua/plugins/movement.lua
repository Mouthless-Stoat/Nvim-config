return {
    {
        "smoka7/hop.nvim",
        version = "*",
        opts = {},
        keys = {
            {
                "<leader>hw",
                function()
                    require("hop").hint_words()
                end,
                desc = "[h]op [w]ord",
            },
        },
        event = { "BufReadPost", "BufNewFile" },
    },
}
