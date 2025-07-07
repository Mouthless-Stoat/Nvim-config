return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },

    opts = {
        render_modes = { "n", "v", "i", "c" },

        heading = {
            sign = false,
            left_pad = 1,
            icons = { "󰬺 ", "󰬻 ", "󰬼 ", "󰬽 ", "󰬾 ", "󰬿 " },
        },

        quote = {
            repeat_linebreak = true,
        },

        code = {
            sign = false,
            left_pad = 2,
        },

        win_options = {
            conceallevel = {
                default = vim.api.nvim_get_option_value("conceallevel", {}),
                rendered = 3,
            },
            concealcursor = {
                default = vim.api.nvim_get_option_value("concealcursor", {}),
                rendered = "",
            },

            showbreak = {
                default = vim.api.nvim_get_option_value("showbreak", {}),
                rendered = "  ",
            },
            breakindent = {
                default = vim.api.nvim_get_option_value("breakindent", {}),
                rendered = true,
            },
            breakindentopt = {
                default = vim.api.nvim_get_option_value("breakindentopt", {}),
                rendered = "",
            },
        },
    },

    ft = "markdown",
}
