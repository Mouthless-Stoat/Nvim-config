-- remap key for nvim. For phugin specific remap go to the phugin file
local utils = require("utils")

vim.g.mapleader = " " -- set the leader to a space

-- lone keymao
utils.setKey({ "n", "i" }, "<C-s>", vim.cmd.w, {})
utils.setKey("t", "<esc>", "<C-\\><C-n>", {}) -- set <esc> in terminal mode to quit
utils.setKey("i", "<c-v>", "<c-r>*", {})      -- set <c-v> in insert mode to paste
utils.setKey("n", "<s-cr>", "i<cr><esc>", {}) -- set <s-cr> in normal mode to insert a newline
utils.setKey("n", "Q", "<nop>", {})           -- me and the bois hate Q

-- move line command
utils.setKey({ "n", "i" }, "<a-Up>", "<esc><cmd>m .-2<cr>==") -- cus <esc> in normal mode do nothing we can combine the command
utils.setKey({ "n", "i" }, "<a-Down>", "<esc><cmd>m .+1<cr>==")
utils.setKey("v", "<a-Up>", ":m '<-2<cr>gv=gv")
utils.setKey("v", "<a-Down>", ":m '>+1<cr>gv=gv")

-- short command
utils.setKey("n", "<leader>r", "<cmd>bro ol<cr>", { desc = "[r]ecent file list" })
utils.setKey("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "[l]azy.nvim config" })
utils.setKey("n", "<leader>m", "<cmd>Mason<cr>", { desc = "[m]ason.nvim config" })
utils.setKey("n", "<leader>t", "<cmd>ter<cr>", { desc = "[t]erminal" })

-- Window control keybind
utils.setKey({ "n", "i" }, "<c-Tab>", "<c-w>w", { desc = "Switch to next window" }) -- set <s-Tab> to switch wimdow

-- arrow key version
utils.setKey({ "n", "i" }, "<s-Up>", "<c-w>+", { desc = "Switch to up window" })
utils.setKey({ "n", "i" }, "<s-Down>", "<c-w>-", { desc = "Switch to down window" })
utils.setKey({ "n", "i" }, "<s-Left>", "<c-w><", { desc = "Switch to left window" })
utils.setKey({ "n", "i" }, "<s-Right>", "<c-w>>", { desc = "Switch to right window" })

utils.setKey({ "n", "i" }, "<c-Up>", "<c-w><Up>", {})
utils.setKey({ "n", "i" }, "<c-Down>", "<c-w><Down>", {})
utils.setKey({ "n", "i" }, "<c-Left>", "<c-w><Left>", {})
utils.setKey({ "n", "i" }, "<c-Right>", "<c-w><Right>", {})

-- hjkl version
utils.setKey({ "n", "i" }, "<s-k>", "<c-w>+", { desc = "Switch to up window" })
utils.setKey({ "n", "i" }, "<s-j>", "<c-w>-", { desc = "Switch to down window" })
utils.setKey({ "n", "i" }, "<s-h>", "<c-w><", { desc = "Switch to left window" })
utils.setKey({ "n", "i" }, "<s-l>", "<c-w>>", { desc = "Switch to right window" })

utils.setKey({ "n", "i" }, "<c-k>", "<c-w><Up>", {})
utils.setKey({ "n", "i" }, "<c-j>", "<c-w><Down>", {})
utils.setKey({ "n", "i" }, "<c-h>", "<c-w><Left>", {})
utils.setKey({ "n", "i" }, "<c-l>", "<c-w><Right>", {})

-- make new window
utils.setKey("n", "<leader>w<Up>", function()
    local preVal = vim.o.splitbelow
    vim.o.splitbelow = false
    vim.cmd.new()
    vim.o.splitbelow = preVal
end, { desc = "Make new window [up]" })
utils.setKey("n", "<leader>w<Down>", function()
    local preVal = vim.o.splitbelow
    vim.o.splitbelow = true
    vim.cmd.new()
    vim.o.splitbelow = preVal
end, { desc = "Make new window [down]" })
utils.setKey("n", "<leader>w<Left>", function()
    local preVal = vim.o.splitright
    vim.o.splitright = false
    vim.cmd.vne()
    vim.o.splitright = preVal
end, { desc = "Make new window [left]" })
utils.setKey("n", "<leader>w<Right>", function()
    local preVal = vim.o.splitright
    vim.o.splitright = true
    vim.cmd.vne()
    vim.o.splitright = preVal
end, { desc = "Make new window [right]" })


-- Quit keymap
utils.setKey("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "[Q]uit all" })
utils.setKey("n", "<leader>qq", "<cmd>q!<cr>", { desc = "[q]uit current window" })
utils.setKey("n", "<leader>qs", vim.cmd.wq, { desc = "[q]uit and [s]ave current window" })
utils.setKey("n", "<leader>qa", vim.cmd.wqa, { desc = "[q]uit and save [a]ll windows" })

-- goto keymap
utils.setKey("n", "<leader>gc", "<cmd>cd C:\\Users\\nphuy\\OneDrive\\Desktop\\Code<cr>",
    { desc = "[g]oto [c]ode" })
utils.setKey("n", "<leader>gm",
    "<cmd>e C:\\Users\\nphuy\\OneDrive\\Desktop\\Code\\DiscordBot\\discord.js\\IMFMagpie\\index.js<cr><cmd>Here<cr>",
    { desc = "[g]oto [m]agpie code" })
utils.setKey("n", "<leader>gd",
    "<cmd>e C:\\Users\\nphuy\\OneDrive\\Desktop\\Code\\DiscordBot\\discord.js\\Dyyes\\index.ts<cr><cmd>Here<cr>",
    { desc = "[g]oto [d]yess code" })
utils.setKey("n", "<leader>gv",
    "<cmd>e C:\\Users\\nphuy\\AppData\\Local\\nvim\\init.lua<cr><cmd>Here<cr>",
    { desc = "[g]oto [v]im init file" })

-- file keymap
utils.setKey("n", "<leader>fr", vim.lsp.buf.rename, { desc = "[f]ile [r]ename" })
utils.setKey("n", "<leader>fe", vim.cmd.Ex, { desc = "[f]ile [e]xplorer" })
