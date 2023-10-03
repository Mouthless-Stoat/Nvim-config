local utils = require("helper.utils")

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
        if vim.fn.line("$") <= 2000 then
            return
        end
        vim.cmd("TSBufDisable highlight")
    end,
})

utils.createAutocmd("InsertLeave", {
    pattern = "*",
    callback = function()
        if vim.fn.line("$") <= 2000 then
            return
        end
        vim.cmd("TSBufEnable highlight")
    end,
})
