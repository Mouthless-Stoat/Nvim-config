-- remap key for nvim. For plugin specific remap go to the plugin file
local utils = require("utils")

vim.g.mapleader = " " -- set the leader to a space

-- unmap stuff
utils.delKey("n", "Y")

-- lone keymao
utils.setKey({ "n", "i" }, "<C-s>", vim.cmd.w, {})
utils.setKey("t", "<esc>", "<C-\\><C-n>", {}) -- set <esc> in terminal mode to quit

-- insert mode c-arrow key make more sense
utils.setKey("i", "<c-Right>", "<esc>ea", {})
utils.setKey("i", "<c-Left>", "<esc>gea", {})
utils.setKey("i", "<s-c-Right>", "<esc>Ea", {})
utils.setKey("i", "<s-c-Left>", "<esc>gE", {})

-- word wrap movement
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

utils.setKey("n", "<c-cr>", "i<cr><esc>", {}) -- set <s-cr> in normal mode to insert a newline
utils.setKey("n", "Q", "<nop>", {}) -- me and the bois hate Q

-- make scrolling eaiser to follow
utils.setKey("n", "<c-d>", "<c-d>zz", {})
utils.setKey("n", "<c-u>", "<c-u>zz", {})

-- move line command
utils.setKey({ "n", "i" }, "<a-Up>", "<esc><cmd>m .-2<cr>==") -- cus <esc> in normal mode do nothing we can combine the command
utils.setKey({ "n", "i" }, "<a-Down>", "<esc><cmd>m .+1<cr>==")
utils.setKey("v", "<a-Up>", ":m '<-2<cr>gv=gv")
utils.setKey("v", "<a-Down>", ":m '>+1<cr>gv=gv")

-- window toggle
vim.g.termCount = 0
vim.g.termBufferId = -1
vim.g.termWindowId = -1

utils.createToggleWindow(
    { "n", "t" },
    "<c-`>",
    "Toggle Terminal window",
    "n",
    "<leader>t",
    "reset [t]erminal window",
    "terminal",
    "Terminal",
    "bot sp",
    "ter",
    "start",
    function()
        vim.cmd.startinsert()
        vim.api.nvim_input('cd "' .. vim.fn.getcwd() .. '"<cr>')
    end,
    "function"
)

vim.g.treeBufferId = -1
vim.g.treeWindowId = -1
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

-- leader stuff
-- command that I use alot
utils.setKey("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "[l]azy.nvim config" })
utils.setKey("n", "<leader>m", "<cmd>Mason<cr>", { desc = "[m]ason.nvim config" })
utils.setKey("n", "<leader>d", "<cmd>Alpha<cr>", { desc = "[d]ashboard" })

-- tab control
utils.setKey("n", "<k6>", "<cmd>tabn<cr>", { desc = "Switch to next tab" })
utils.setKey("n", "<k4>", "<cmd>tabp<cr>", { desc = "Switch to previous tab" })

-- Window control keybind
utils.setKey("n", "<leader>wx", "<c-w>o", { desc = "Quit all other window" })

utils.setKey("n", "<s-Up>", "<c-w>+", { desc = "Switch to up window" })
utils.setKey("n", "<s-Down>", "<c-w>-", { desc = "Switch to down window" })
utils.setKey("n", "<s-Left>", "<c-w><", { desc = "Switch to left window" })
utils.setKey("n", "<s-Right>", "<c-w>>", { desc = "Switch to right window" })

utils.setKey("n", "<c-Up>", "<c-w><Up>", {})
utils.setKey("n", "<c-Down>", "<c-w><Down>", {})
utils.setKey("n", "<c-Left>", "<c-w><Left>", {})
utils.setKey("n", "<c-Right>", "<c-w><Right>", {})

-- make new window
utils.setKey("n", "<leader>w<Up>", "<cmd>top new<cr>", { desc = "Make new window [up]" })
utils.setKey("n", "<leader>w<Down>", "<cmd>bot new<cr>", { desc = "Make new window [down]" })
utils.setKey("n", "<leader>w<Left>", "<cmd>top vnew<cr>", { desc = "Make new window [left]" })
utils.setKey("n", "<leader>w<Right>", "<cmd>bot vnew<cr>", { desc = "Make new window [right]" })

-- file keymap
utils.setKey("n", "<leader>fe", vim.cmd.Ex, { desc = "[f]ile [e]xplorer" })
