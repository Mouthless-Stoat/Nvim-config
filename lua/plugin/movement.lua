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
                desc = "[h]op [l]ine",
            },
            {
                "<leader>hw",
                function()
                    ---@diagnostic disable-next-line: missing-parameter
                    require("hop").hint_words()
                end,
                desc = "[h]op [w]ord",
            },
            {
                "<leader>h1",
                function()
                    require("hop").hint_char1()
                end,
                desc = "[h]op [1] character",
            },
            {
                "<leader>h2",
                function()
                    require("hop").hint_char2()
                end,
                desc = "[h]op [2] character",
            },
            {
                "<leader>hp",
                function()
                    ---@diagnostic disable-next-line: missing-parameter
                    require("hop").hint_patterns()
                end,
            },
        },
        event = { "BufReadPost", "BufNewFile" },
    },
}
