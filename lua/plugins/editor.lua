return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            whitespace = {
                remove_blankline_trail = true,
                highlight = "IblWhitespaces",
            },
            indent = {
                highlight = "Indent",
            },
            scope = {
                enabled = true,
                show_start = false,
                show_end = false,
                highlight = {
                    "Delimit1",
                    "Delimit2",
                    "Delimit3",
                    "Delimit4",
                    "Delimit5",
                    "Delimit6",
                    "Delimit7",
                },
                exclude = {
                    language = { "toml" },
                },
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
    {
        "lowitea/aw-watcher.nvim",
        opts = {},
    },
}
