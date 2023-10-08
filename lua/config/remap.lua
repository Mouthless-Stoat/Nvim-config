-- remap key for nvim. For plugin specific remap go to the plugin file
local utils = require("helper.utils")
local window = require("helper.window")
local float = require("helper.float")

vim.g.mapleader = " " -- set the leader to a space

-- unmap stuff
utils.delKey("n", "Y")

-- remap default funtion
utils.setKey("t", "<esc>", "<C-\\><C-n>", {}) -- set <esc> in terminal mode to quit
utils.setKey("n", "x", '"_x') -- but x content into void cus why?????
utils.setKey("n", "Q", "<nop>", {}) -- me and the bois hate Q

-- remap so easier search in v mode
utils.setKey("v", "/", "/\\%V")
utils.setKey("v", "\\", "/")

-- make scrolling eaiser to follow
utils.setKey("n", "<c-d>", "<c-d>zz", {})
utils.setKey("n", "<c-u>", "<c-u>zz", {})

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
utils.setKey("n", "<leader>]", function()
    local width = 30
    local height = 20

    local opts = {
        relative = "editor",
        position = "center",
        title = "Sticky",
        width = width,
        height = height,
        style = "minimal",
        border = "single",
        highlight = {
            Normal = "notepadNormal",
            FloatTitle = "notepadTitle",
            FloatBorder = "notepadBorder",
        },
        moveCount = 5,
        shiftCount = 2,
    }
    float.createFloat(opts)
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
end)

utils.setKey({ "n", "i" }, "<C-s>", vim.cmd.w, {})

-- move line command
utils.setKey({ "n", "i" }, "<a-Up>", "<esc><cmd>m .-2<cr>==") -- cus <esc> in normal mode do nothing we can combine the command
utils.setKey({ "n", "i" }, "<a-Down>", "<esc><cmd>m .+1<cr>==")
utils.setKey("v", "<a-Up>", ":m '<-2<cr>gv=gv")
utils.setKey("v", "<a-Down>", ":m '>+1<cr>gv=gv")

utils.setKey("n", "<c-cr>", "i<cr><esc>", {}) -- set <s-cr> in normal mode to insert a newline
utils.setKey("n", "<c-a>", "<c-^>", {})

-- make a terminal toggle window
window.createWindowBind({
    name = "terminal",
    windowName = "Terminal",
    toggle = {
        key = "<c-`>",
        mode = { "n", "t" },
        description = "Toggle Terminal Window",
        type = "cmd",
        splitCmd = "bot sp",
        cmd = "ter",
        afterCmd = "start",
    },
    reset = {
        key = "<leader>tt",
        mode = "n",
        description = "[t]oggle [t]erminal reset",
        type = "func",
        func = function()
            vim.cmd.startinsert()
            vim.api.nvim_input('cd "' .. vim.fn.getcwd() .. '"<cr>')
        end,
    },
})

utils.setKey("n", "<c-b>", function()
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
end) -- set <c-b> to open the file tree to the right

-- Window control keybind

-- make new window
utils.setKey("n", "<leader>w<Up>", "<cmd>top new<cr>", { desc = "make new [w]indow [up]" })
utils.setKey("n", "<leader>w<Down>", "<cmd>bot new<cr>", { desc = "make new [w]indow [down]" })
utils.setKey("n", "<leader>w<Left>", "<cmd>top vnew<cr>", { desc = "make new [w]indow [left]" })
utils.setKey("n", "<leader>w<Right>", "<cmd>bot vnew<cr>", { desc = "make new [w]indow [right]" })

-- move between window
utils.setKey("n", "<leader>ww", "<c-w>w", { desc = "switch [[w]]indow" })

-- faster switching
utils.setKey("n", "<c-1>", "1<c-w>w", { desc = "go to [w]indow [1]" })
utils.setKey("n", "<c-2>", "2<c-w>w", { desc = "go to [w]indow [2]" })
utils.setKey("n", "<c-3>", "3<c-w>w", { desc = "go to [w]indow [3]" })
utils.setKey("n", "<c-4>", "4<c-w>w", { desc = "go to [w]indow [4]" })
utils.setKey("n", "<c-5>", "5<c-w>w", { desc = "go to [w]indow [5]" })
utils.setKey("n", "<c-6>", "6<c-w>w", { desc = "go to [w]indow [6]" })
utils.setKey("n", "<c-7>", "7<c-w>w", { desc = "go to [w]indow [7]" })
utils.setKey("n", "<c-8>", "8<c-w>w", { desc = "go to [w]indow [8]" })
utils.setKey("n", "<c-9>", "9<c-w>w", { desc = "go to [w]indow [9]" })

-- manipulating window
utils.setKey("n", "<s-Up>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-w>-", true, false, true), "t", false)
    else
        float.resizeFloat(win, { direction = "up" })
    end
end)
utils.setKey("n", "<s-Down>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-w>+", true, false, true), "t", false)
    else
        float.resizeFloat(win, { direction = "down" })
    end
end)
utils.setKey("n", "<s-Left>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-w>>", true, false, true), "t", false)
    else
        float.resizeFloat(win, { direction = "left" })
    end
end)
utils.setKey("n", "<s-Right>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-w><", true, false, true), "t", false)
    else
        float.resizeFloat(win, { direction = "right" })
    end
end)

utils.setKey("n", "<c-Up>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-w><Up>", true, false, true), "t", false)
    else
        float.moveFloat(win, "up")
    end
end, { desc = "switch to up window" })
utils.setKey("n", "<c-Down>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-w><Down>", true, false, true), "t", false)
    else
        float.moveFloat(win, "down")
    end
end, { desc = "switch to down window" })
utils.setKey("n", "<c-Left>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-w><Left>", true, false, true), "t", false)
    else
        float.moveFloat(win, "left")
    end
end, { desc = "switch to left window" })
utils.setKey("n", "<c-Right>", function()
    local config = vim.api.nvim_win_get_config(0)
    local win = vim.api.nvim_get_current_win()
    if config.relative == "" then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-w><Right>", true, false, true), "t", false)
    else
        float.moveFloat(win, "right")
    end
end, { desc = "switch to right window" })

-- common command
utils.setKey("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "[l]azy.nvim config" })
utils.setKey("n", "<leader>m", "<cmd>Mason<cr>", { desc = "[m]ason.nvim config" })
utils.setKey("n", "<leader>a", "<cmd>Alpha<cr>", { desc = "[a]lpha dashboard" })
utils.setKey(
    "n",
    "<leader>d",
    "<cmd>lua vim.diagnostic.open_float()<cr>",
    { desc = "open floating [d]iagnostic window" }
)

-- file keymap
utils.setKey("n", "<leader>fe", vim.cmd.Ex, { desc = "[f]ile [e]xplorer" })
