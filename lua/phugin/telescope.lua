return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<Leader>sfh", "<cmd>Telescope find_files hidden=true<cr>", desc = "[s]earch [f]iles [h]idden" },
        { "<Leader>sfn", "<cmd>Telescope find_files hidden=true<cr>", desc = "[s]earch [f]iles [n]ormal" }
    }
}
