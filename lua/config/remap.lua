-- remap key for nvim. For plugin specific remap go to the plugin file
local utils = require("helper.utils")

vim.g.mapleader = " " -- set the leader to a space

-- remap default funtion
utils.setKey("t", "<esc>", "<C-\\><C-n>", {}) -- set <esc> in terminal mode to quit
utils.setKey("n", "x", '"_x') -- put x content into void cus why?????
utils.setKey("n", "Q", "<nop>", {}) -- me and the bois hate Q

-- remap for easier search in v mode
utils.setKey("v", "/", "/\\%V")
utils.setKey("v", "\\", "/")

-- make scrolling eaiser to follow
utils.setKey("n", "<C-d>", "<C-d>zz", {})
utils.setKey("n", "<C-u>", "<C-u>zz", {})

-- keep current group selected when shifting
utils.setKey("v", ">", ">gv", {})
utils.setKey("v", "<", "<gv", {})

-- insert mode c-arrow key to make more sense
utils.setKey("i", "<C-Right>", "<esc>ea", {})
utils.setKey("i", "<C-Left>", "<esc>ba", {})
utils.setKey("i", "<S-C-Right>", "<esc>Ea", {})
utils.setKey("i", "<S-C-Left>", "<esc>Ba", {})

-- word wrap movement
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- arrow key wrap movement
vim.keymap.set("n", "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- new remap
utils.setKey({ "n", "i" }, "<C-s>", vim.cmd.w, {})

utils.setKey("n", "<A-cr>", "i<cr><esc>", {}) -- set <A-cr> in normal mode to insert a newline
utils.setKey("n", "<Tab>", "<C-^>", {})
utils.setKey({ "n", "v" }, "+", '"+')
-- very janky fix because sometime it doesn;t paste in terminal
utils.setKey("t", "<c-v>", function()
    utils.feedkeys(vim.fn.getreg("+"))
end)

-- make new window
utils.setKey("n", "<Leader>w<Up>", "<cmd>top new<cr>", { desc = "make new [w]indow [up]" })
utils.setKey("n", "<Leader>w<Down>", "<cmd>bot new<cr>", { desc = "make new [w]indow [down]" })
utils.setKey("n", "<Leader>w<Left>", "<cmd>top vnew<cr>", { desc = "make new [w]indow [left]" })
utils.setKey("n", "<Leader>w<Right>", "<cmd>bot vnew<cr>", { desc = "make new [w]indow [right]" })

utils.setKey("n", "<C-Up>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        utils.feedkeys("<C-w><Up>")
    else
        float.moveFloat(win, "up")
    end
end, { desc = "switch to up window" })

utils.setKey("n", "<C-Down>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        utils.feedkeys("<C-w><Down>")
    else
        float.moveFloat(win, "down")
    end
end, { desc = "switch to down window" })

utils.setKey("n", "<C-Left>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        utils.feedkeys("<C-w><Left>")
    else
        float.moveFloat(win, "left")
    end
end, { desc = "switch to left window" })

utils.setKey("n", "<C-Right>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        utils.feedkeys("<C-w><Right>")
    else
        float.moveFloat(win, "right")
    end
end, { desc = "switch to right window" })

-- common command
utils.setKey("n", "<Leader>l", "<cmd>Lazy<cr>", { desc = "[l]azy.nvim config" })
utils.setKey("n", "<Leader>m", "<cmd>Mason<cr>", { desc = "[m]ason.nvim config" })
utils.setKey("n", "<Leader>a", "<cmd>Alpha<cr>", { desc = "[a]lpha dashboard" })
