return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                json = { "prettier" },
                markdown = { "prettier" },
                rust = { "rustfmt" },
                uiua = { "uiuafmt" },
            },
            formatters = {
                uiuafmt = {
                    command = "uiua",
                    args = { "fmt", "$FILENAME" },
                    stdin = false,
                },
            },
        },
        lazy = true,
    },
}
