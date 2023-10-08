local language = { "lua", "vim", "vimdoc", "javascript", "typescript", "python" }
return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = language,
            auto_install = true, -- auto install if missing
            highlight = {
                enable = true,
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gs", -- set to `false` to disable one of the mappings
                    node_incremental = "<c-=>",
                    node_decremental = "<c-->",
                    scope_incremental = false,
                },
            },
        })
    end,
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall" },
}
