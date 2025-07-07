require("config.main")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("config.theme.main")
require("lazy").setup({
    spec = {
        "nvim-tree/nvim-web-devicons",
        { import = "plugins" },
    },
    change_detection = {
        enable = false,
        notify = false,
    },
})
require("config.anchor")
require("config.theme.plugins.status")
