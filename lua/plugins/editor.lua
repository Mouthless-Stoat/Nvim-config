return {
    {
        "lukas-reineke/indent-blankline.nvim",
        version = "2.20.8",
        opts = {
            max_indent_increase = 1,
            char_blankline = "∙",
            show_current_context = true,
            show_current_context_start = true,
            char_highlight_list = {
                "Indent1",
                "Indent2",
                "Indent3",
                "Indent4",
                "Indent5",
                "Indent6",
                "Indent7",
            },
            context_highlight_list = {
                "Context1",
                "Context2",
                "Context3",
                "Context4",
                "Context5",
                "Context6",
                "Context7",
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
