return {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = { open_cmd = "noswapfile vnew" },
    keys = {
        {
            "<leader>S",
            function()
                require("spectre").toggle()
            end,
            desc = "Replace in files (Spectre)",
        },
    },
}
