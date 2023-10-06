-- remap key for nvim. For plugin specific remap go to the plugin file
local utils = require("helper.utils")
local window = require("helper.window")
local float = require("helper.float")

vim.g.mapleader = " " -- set the leader to a space

-- unmap stuff
utils.delKey("n", "Y")

-- lone keymao
utils.setKey({ "n", "i" }, "<C-s>", vim.cmd.w, {})
utils.setKey("t", "<esc>", "<C-\\><C-n>", {}) -- set <esc> in terminal mode to quit
utils.setKey("n", "x", '"_x') -- but x content into void cus why?????
utils.setKey("n", "<c-cr>", "i<cr><esc>", {}) -- set <s-cr> in normal mode to insert a newline
utils.setKey("n", "Q", "<nop>", {}) -- me and the bois hate Q
utils.setKey("v", "/", "/\\%V")
utils.setKey("v", "\\", "/")
utils.setKey("n", "<c-a>", "<c-^>", {})

utils.setKey("n", "<leader>]", function()
    local width = 20
    local height = 10

    local opts = {
        relative = "editor",
        position = "center",
        title = "Sticky",
        width = width,
        height = height,
        style = "minimal",
        border = "single",
    }
    float.createFloat(opts)
end)

-- remap base command to be more useful
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

-- make scrolling eaiser to follow
utils.setKey("n", "<c-d>", "<c-d>zz", {})
utils.setKey("n", "<c-u>", "<c-u>zz", {})

utils.setKey("v", ">", ">gv", {})
utils.setKey("v", "<", "<gv", {})

-- move line command
utils.setKey({ "n", "i" }, "<a-Up>", "<esc><cmd>m .-2<cr>==") -- cus <esc> in normal mode do nothing we can combine the command
utils.setKey({ "n", "i" }, "<a-Down>", "<esc><cmd>m .+1<cr>==")
utils.setKey("v", "<a-Up>", ":m '<-2<cr>gv=gv")
utils.setKey("v", "<a-Down>", ":m '>+1<cr>gv=gv")

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

-- tab control
utils.setKey("n", "<k6>", "<cmd>tabn<cr>", { desc = "switch to next tab" })
utils.setKey("n", "<k4>", "<cmd>tabp<cr>", { desc = "switch to previous tab" })

-- Window control keybind
utils.setKey("n", "<leader>wx", "<c-w>o", { desc = "quit all other window" })

utils.setKey("n", "<s-Up>", "<c-w>-")
utils.setKey("n", "<s-Down>", "<c-w>+")
utils.setKey("n", "<s-Left>", "<c-w><")
utils.setKey("n", "<s-Right>", "<c-w>>")

utils.setKey("n", "<c-Up>", "<c-w><Up>", { desc = "switch to up window" })
utils.setKey("n", "<c-Down>", "<c-w><Down>", { desc = "switch to down window" })
utils.setKey("n", "<c-Left>", "<c-w><Left>", { desc = "switch to left window" })
utils.setKey("n", "<c-Right>", "<c-w><Right>", { desc = "switch to right window" })

-- make new window
utils.setKey("n", "<leader>w<Up>", "<cmd>top new<cr>", { desc = "make new window [up]" })
utils.setKey("n", "<leader>w<Down>", "<cmd>bot new<cr>", { desc = "make new window [down]" })
utils.setKey("n", "<leader>w<Left>", "<cmd>top vnew<cr>", { desc = "make new window [left]" })
utils.setKey("n", "<leader>w<Right>", "<cmd>bot vnew<cr>", { desc = "make new window [right]" })

utils.setKey("n", "<leader>ww", "<c-w><c-w>", { desc = "switch [w]indow" })

-- command that I use alot
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
