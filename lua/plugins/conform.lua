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
                java = { "clang-format" },
                uiua = { "uiuafmt" },
            },
            formatters = {
                ["clang-format"] = {
                    args = {
                        "-assume-filename",
                        "$FILENAME",
                        "-style=file:D:\\config\\nvim\\clang-formatter.yaml",
                    },
                },
                ["uiuafmt"] = {
                    command = "uiua",
                    args = { "fmt", "$FILENAME" },
                    stdin = false,
                },
            },
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
