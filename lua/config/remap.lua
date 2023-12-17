-- remap key for nvim. For plugin specific remap go to the plugin file
local utils = require("helper.utils")
local window = require("helper.window")
local float = require("helper.floatie")

vim.g.mapleader = " " -- set the leader to a space

-- unmap stuff
utils.delKey("n", "Y")
-- utils.setKey("n", "S", "<Nop>")

-- remap default funtion
utils.setKey("t", "<esc>", "<C-\\><C-n>", {}) -- set <esc> in terminal mode to quit
utils.setKey("n", "x", '"_x') -- put x content into void cus why?????
utils.setKey("n", "Q", "<nop>", {}) -- me and the bois hate Q

-- remap so easier search in v mode
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
utils.setKey("n", "<C-Tab>", "<C-^>", {})
utils.setKey({ "n", "i" }, "+", '"+')

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

utils.setKey("n", "<C-b>", function()
    if vim.fn.bufexists(vim.g.treeBufferId) == 0 then
        vim.cmd("top 40vs")
        vim.cmd.e(".")

        vim.g.treeBufferId = vim.api.nvim_get_current_buf()
        vim.g.treeWindowId = vim.api.nvim_get_current_win()

        vim.fn.win_gotoid(vim.g.treeWindowId)
    else
        if vim.fn.win_gotoid(vim.g.treeWindowId) == 0 then
            vim.g.treeBufferId = -1
            vim.g.treeWindowId = -1
        end
        vim.cmd.close()
    end
end) -- set <C-b> to open the file tree to the right

-- Window control keybind
utils.setKey("n", "<Leader>ws", function()
    float.createFloat({
        relative = "editor",
        position = "center",
        title = "Sticky",
        width = 20,
        height = 10,
        style = "minimal",
        border = "single",
        highlight = {
            Normal = "notepadNormal",
            FloatTitle = "notepadTitle",
            FloatBorder = "notepadBorder",
        },
        moveCount = 5,
        shiftCount = 2,
    })
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.cmd.startinsert()
end, { desc = "new [w]indow [s]ticky note" })

-- make new window
utils.setKey("n", "<Leader>w<Up>", "<cmd>top new<cr>", { desc = "make new [w]indow [up]" })
utils.setKey("n", "<Leader>w<Down>", "<cmd>bot new<cr>", { desc = "make new [w]indow [down]" })
utils.setKey("n", "<Leader>w<Left>", "<cmd>top vnew<cr>", { desc = "make new [w]indow [left]" })
utils.setKey("n", "<Leader>w<Right>", "<cmd>bot vnew<cr>", { desc = "make new [w]indow [right]" })

-- move between window
utils.setKey("n", "<Leader>ww", "<C-w>w", { desc = "switch [[w]]indow" })

-- faster switching
utils.setKey("n", "<C-1>", "1<C-w>w", { desc = "go to [w]indow [1]" })
utils.setKey("n", "<C-2>", "2<C-w>w", { desc = "go to [w]indow [2]" })
utils.setKey("n", "<C-3>", "3<C-w>w", { desc = "go to [w]indow [3]" })
utils.setKey("n", "<C-4>", "4<C-w>w", { desc = "go to [w]indow [4]" })
utils.setKey("n", "<C-5>", "5<C-w>w", { desc = "go to [w]indow [5]" })
utils.setKey("n", "<C-6>", "6<C-w>w", { desc = "go to [w]indow [6]" })
utils.setKey("n", "<C-7>", "7<C-w>w", { desc = "go to [w]indow [7]" })
utils.setKey("n", "<C-8>", "8<C-w>w", { desc = "go to [w]indow [8]" })
utils.setKey("n", "<C-9>", "9<C-w>w", { desc = "go to [w]indow [9]" })

-- manipulating window
utils.setKey("n", "<S-Up>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        utils.feedkeys("<C-w>-")
    else
        float.resizeFloat(win, { direction = "up" })
    end
end)
utils.setKey("n", "<S-Down>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        utils.feedkeys("<C-w>+")
    else
        float.resizeFloat(win, { direction = "down" })
    end
end)
utils.setKey("n", "<S-Left>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        utils.feedkeys("<C-w>>")
    else
        float.resizeFloat(win, { direction = "left" })
    end
end)
utils.setKey("n", "<S-Right>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        utils.feedkeys("<C-w><")
    else
        float.resizeFloat(win, { direction = "right" })
    end
end)

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
utils.setKey(
    "n",
    "<Leader>d",
    "<cmd>lua vim.diagnostic.open_float()<cr>",
    { desc = "open floating [d]iagnostic window" }
)
