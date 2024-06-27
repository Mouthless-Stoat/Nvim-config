return {
    {
        "lukas-reineke/indent-blankline.nvim",
        version = "2.20.8",
        opts = {
            max_indent_increase = 1,
            char_blankline = "∙",
            show_current_context = true,
            char_highlight = "indent",
            context_highlight_list = {
                "Delimit1",
                "Delimit2",
                "Delimit3",
                "Delimit4",
                "Delimit5",
                "Delimit6",
                "Delimit7",
            },
        },
        event = { "BufReadPost", "BufNewFile" },
    },
    {
        "hiphish/rainbow-delimiters.nvim",
        config = function()
            vim.g.rainbow_delimiters = {
                highlight = {
                    "Delimit1",
                    "Delimit2",
                    "Delimit3",
                    "Delimit4",
                    "Delimit5",
                    "Delimit6",
                    "Delimit7",
                },
            }
        end,
        event = { "BufReadPost", "BufNewFile" },
    },
}
