return {
    "mbbill/undotree",
    keys = {
        {
            "<leader>u",
            function()
                vim.cmd.UndotreeToggle()
                vim.o.number = true
                vim.o.relativenumber = true
            end,
            desc = "[u]ndo tree",
        },
    },
    config = function()
        vim.g.undotree_DiffAutoOpen = 0
        vim.g.undotree_SetFocusWhenToggle = 1
    end,
}
