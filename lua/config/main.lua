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


vim.o.updatetime = 250          -- Decrease update time

vim.wo.signcolumn = 'yes'       -- Keep signcolumn on by default

vim.o.showmode = false          -- hide the `--INSERT--` at the bottom use status line instead

vim.o.clipboard = 'unnamedplus' -- sync clipboard with vim and os

vim.o.undofile = true           -- save undo on the file

vim.o.termguicolors = true      -- color in terminal

vim.o.hlsearch = false          -- turn hightlight off after searching

vim.o.breakindent = true        -- when line wrap around also copy indent

vim.o.gfn = "CaskaydiaCove Nerd Font Mono:h12"