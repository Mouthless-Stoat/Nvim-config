return {
    "NStefan002/screenkey.nvim",
    lazy = false,
    version = "*", -- or branch = "dev", to use the latest commit

    opts = {
        clear_after = 100000,
        group_mappings = true,
        show_leader = false,
        win_opts = {
            row = 2,
            col = vim.o.columns - 1,
            anchor = "NE",

            border = "solid",
            title = " screenkey ",
            height = 1,
            width = 30,
        },
    },
}
