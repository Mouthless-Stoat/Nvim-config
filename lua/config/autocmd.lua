local utils = require("utils")

utils.createAutocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf, timeout_ms = 5000 })
    end,
}) -- format when save

-- md formating
utils.createAutocmd("BufEnter", {
    pattern = "*.md",
    callback = function()
        vim.o.syntax = "markdown"
        vim.o.wrap = true
        vim.o.linebreak = true
    end,
})

utils.createAutocmd("BufLeave", {
    pattern = "*.md",
    callback = function()
        vim.o.syntax = nil
        vim.o.wrap = false
        vim.o.linebreak = true
    end,
})

utils.createAutocmd("InsertEnter", {
    pattern = "*",
    callback = function()
        vim.cmd("TSBufDisable highlight")
    end,
})

utils.createAutocmd("InsertLeave", {
    pattern = "*",
    callback = function()
        vim.cmd("TSBufEnable highlight")
    end,
})
