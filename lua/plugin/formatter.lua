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
            },
        },
        lazy = true,
    },
}
