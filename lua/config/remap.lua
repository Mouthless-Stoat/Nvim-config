-- remap key for nvim. For plugin specific remap go to the plugin file
local utils = require("helper.utils")
local window = require("helper.window")

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

-- code runner
utils.setKey({ "n", "t" }, "<F5>", "<cmd>wa<cr><cmd>RunCode<cr>", {})
utils.setKey("n", "<C-cr>", "<cmd>RunFile<cr>", {})

utils.setKey({ "n" }, "H", "^", {})
utils.setKey({ "n" }, "L", "$", {})

-- make a terminal toggle window
window.createWindowBind({
    name = "terminal",
    windowName = "Terminal",
    toggle = {
        key = "<C-`>",
        mode = { "n", "t" },
        description = "Toggle Terminal Window",
        type = "cmd",
        splitCmd = "bot sp",
        cmd = "ter",
        afterCmd = "start",
    },
    reset = {
        key = "<Leader>tt",
        mode = "n",
        description = "[t]oggle [t]erminal reset",
        type = "func",
        func = function()
            vim.cmd.startinsert()
            vim.api.nvim_input('cd "' .. vim.fn.getcwd() .. '"<cr>')
        end,
    },
})

-- make new window
utils.setKey("n", "<Leader>k", "<cmd>top new<cr>", { desc = "make new [w]indow [up]" })
utils.setKey("n", "<Leader>j", "<cmd>bot new<cr>", { desc = "make new [w]indow [down]" })
utils.setKey("n", "<Leader>h", "<cmd>top vnew<cr>", { desc = "make new [w]indow [left]" })
utils.setKey("n", "<Leader>l", "<cmd>bot vnew<cr>", { desc = "make new [w]indow [right]" })

utils.setKey("n", "<C-k>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        utils.feedkeys("<C-w><Up>")
    else
        float.moveFloat(win, "up")
    end
end, { desc = "switch to up window" })

utils.setKey("n", "<C-j>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        utils.feedkeys("<C-w><Down>")
    else
        float.moveFloat(win, "down")
    end
end, { desc = "switch to down window" })

utils.setKey("n", "<C-h>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        utils.feedkeys("<C-w><Left>")
    else
        float.moveFloat(win, "left")
    end
end, { desc = "switch to left window" })

utils.setKey("n", "<C-l>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        utils.feedkeys("<C-w><Right>")
    else
        float.moveFloat(win, "right")
    end
end, { desc = "switch to right window" })
