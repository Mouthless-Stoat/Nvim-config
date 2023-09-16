return {
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                -- Conform will run multiple formatters sequentially
                python = { "isort", "black" },
                -- Use a sub-list to run only the first available formatter
                javascript = { "prettier" },
            },
        },
    },
    {
        "MunifTanjim/prettier.nvim",
        opts = {
            cli_options = {
                tab_width = 4,
                use_tabs = true
            }
        }
    }
}
