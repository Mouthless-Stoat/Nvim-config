vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end

}) -- format when save

-- md formating
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.md",
    callback = function()
        vim.o.syntax = "markdown"
        vim.o.wrap = true
    end
})

vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*.md",
    callback = function()
        vim.o.syntax = nil
        vim.o.wrap = false
    end
})
