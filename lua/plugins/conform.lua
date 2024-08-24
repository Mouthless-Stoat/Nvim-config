local utils = require("helper.utils")
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
                yaml = { "prettier" },
                toml = { "taplo" },
            },
            formatters = {},
        },
        config = function(_, opt)
            require("conform").setup(opt)
            utils.createAutocmd("BufWritePre", {
                pattern = "*",
                callback = function(args)
                    require("conform").format({ bufnr = args.buf, timeout_ms = 5000 })
                end,
            }) -- format when save
        end,
    },
}
