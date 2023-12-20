return {
    "ixru/nvim-markdown",
    config = function()
        vim.cmd("map <Plug> <Plug>Markdown_CreateLink")
    end,
    ft = "markdown",
}
