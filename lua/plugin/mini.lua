return {
    {
        "echasnovski/mini.comment",
        opts = {
            mappings = { comment_line = "gcc" },
            options = { ignore_blank_line = true },
        },
        event = { "BufReadPost", "BufNewFile" },
    },
    {
        "echasnovski/mini.move",
        opts = {
            mappings = {
                up = "<M-Up>",
                down = "<M-Down>",
                left = "<M-Left>",
                right = "<M-Right>",

                -- Move current line in Normal mode
                line_up = "<M-Up>",
                line_down = "<M-Down>",
                line_left = "<M-Left>",
                line_right = "<M-Right>",
            },
            options = {
                reindent_lineise = true,
            },
        },
    },
}
