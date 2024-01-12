require("config.remap")
require("config.command")
require("config.autocmd")
require("config.anchor")
require("config.codeRunner")
require("config.filetype")
require("config.misc")

-- these config so which-key work correctly
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- show line number and set to relative
vim.opt.number = true
vim.opt.relativenumber = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- replace tab with space and set shift width(using the > command) to use 4 space as well
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.updatetime = 1000 -- Decrease update time

vim.opt.signcolumn = "yes" -- Keep signcolumn on by default

vim.opt.showmode = false -- hide the `--INSERT--` at the bottom use status line instead

vim.opt.termguicolors = true -- color in terminal

vim.opt.hlsearch = false -- turn hightlight off after searching

vim.opt.wrap = false -- i hate line wrap

vim.g.netrw_liststyle = 3 -- default netrw to the tree view

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.list = true
vim.opt.listchars = { multispace = "·", tab = ">-" }

-- highlight yanked text
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

-- persistent undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "C:\\Users\\nphuy\\AppData\\Local\\nvim-data\\undo"
vim.opt.undofile = true

vim.opt.scrolloff = 8

-- terminal shit
vim.opt.gfn = "CaskaydiaCove Nerd Font Mono,Uiua386:h9:#h-none" --set font and size

vim.opt.shell = "powershell"
vim.opt.shellcmdflag = "-c"

-- neovide setting
if vim.g.neovide then
    require("config.neovideConfig")
end
