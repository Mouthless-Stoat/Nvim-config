return {
    {
        "smoka7/hop.nvim",
        version = "*",
        opts = {},
        keys = {
            {
                "<leader>hl",
                function()
                    require("hop").hint_vertical()
                end,
            },
            {
                "<leader>hw",
                function()
                    require("hop").hint_words()
                end,
            },
            { "<leader>h1" },
        },
        event = { "BufReadPost", "BufNewFile" },
    },
}
