return {
    {
        "ixru/nvim-markdown",
        init = function()
            vim.g.vim_markdown_no_default_key_mappings = 1
        end,
        ft = "markdown",
    },
}
