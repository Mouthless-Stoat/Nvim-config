require("config.remap")
require("config.command")

-- auto command
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]] -- format when save

-- these config so which-key work correctly
vim.o.timeout = true
vim.o.timeoutlen = 300

-- show line number and set to relative
vim.o.number = true
vim.o.rnu = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- replace tab with space and set shift width(using the >> command) to use 4 space as well
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.updatetime = 250     -- Decrease update time

vim.o.signcolumn = 'yes'   -- Keep signcolumn on by default

vim.o.showmode = false     -- hide the `--INSERT--` at the bottom use status line instead

vim.o.termguicolors = true -- color in terminal

vim.o.hlsearch = false     -- turn hightlight off after searching

vim.o.wrap = false         -- i hate line wrap

vim.o.mouse = nil          -- turn mouse off to get use to vim

-- highlight yanked text
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- persistent undo
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = "C:\\Users\\nphuy\\AppData\\Local\\nvim-data\\undo"
vim.o.undofile = true

vim.o.scrolloff = 8

-- terminal shit
vim.o.gfn = "CaskaydiaCove Nerd Font Mono:h12" --set font and size

vim.o.shell = "powershell"
vim.o.shellcmdflag = "-c"
