-- remap key for nvim. For plugin specific remap go to the plugin file
local utils = require("utils")

vim.g.mapleader = " " -- set the leader to a space

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
vim.g.termBufferId = -1
vim.g.termWindowId = -1
utils.setKey({ "n", "t" }, "<c-`>", function()
    if vim.fn.win_gotoid(vim.g.termWindowId) == 0 then
        if vim.fn.bufexists(vim.g.termBufferId) == 0 then
            -- make the terminal
            vim.cmd("bot sp")
            vim.cmd.terminal()

            -- rename the buffer to use later
            vim.cmd.file("Terminal")

            -- save the window and buffer id
            vim.g.termBufferId = vim.api.nvim_get_current_buf()
            vim.g.termWindowId = vim.api.nvim_get_current_win()

            -- go into insert mode
            vim.cmd.startinsert()
        else
            vim.cmd("bot sp") -- split the screen at the bottom
            vim.cmd.buffer("Terminal") -- reuse the terminal buffer
            vim.g.termWindowId = vim.api.nvim_get_current_win() -- save the new window info
            vim.cmd.startinsert()
        end
    else
        vim.fn.win_gotoid(vim.g.termWindowId) -- go to and delete it
        vim.cmd.hide()
    end
end, {}) -- open terminal at the bottom

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
-- short command
utils.setKey("n", "<leader>r", "<cmd>Telescope oldfiles<cr>", { desc = "[r]ecent file list" })
utils.setKey("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "[l]azy.nvim config" })
utils.setKey("n", "<leader>m", "<cmd>Mason<cr>", { desc = "[m]ason.nvim config" })

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

local anchors = {
    {
        key = "c",
        path = "C:\\Users\\nphuy\\OneDrive\\Desktop\\Code",
        type = "open",
        desc = "[c]ode folder",
    },
    {
        key = "m",
        path = "C:\\Users\\nphuy\\OneDrive\\Desktop\\Code\\DiscordBot\\discord.js\\IMFMagpie\\index.js",
        type = "file",
        desc = "[m]agpie code",
    },
    {
        key = "d",
        path = "C:\\Users\\nphuy\\OneDrive\\Desktop\\Code\\DiscordBot\\discord.js\\Dyyes\\index.ts",
        type = "file",
        desc = "[d]yyes code",
    },
    {
        key = "v",
        path = "C:\\Users\\nphuy\\AppData\\Local\\nvim",
        type = "folder",
        desc = "[v]im config folder",
    },
    {
        key = "n",
        path = "C:\\Users\\nphuy\\OneDrive\\Desktop\\School Note",
        type = "folder",
        desc = "school [n]ote folder",
    },
    { key = "h", path = "C:\\Users\\nphuy", type = "open", desc = "[h]ome folder" },
}
for _, anchor in ipairs(anchors) do
    local command = ""
    if anchor.type == "folder" then
        command = "<cmd>cd " .. anchor.path .. "<cr><cmd>Telescope find_files<cr>"
    elseif anchor.type == "file" then
        command = "<cmd>e " .. anchor.path .. "<cr><cmd>Here<cr>"
    elseif anchor.type == "open" then
        command = "<cmd>cd " .. anchor.path .. "<cr><cmd>e .<cr>"
    end
    utils.setKey("n", "<leader>G" .. anchor.key, command, { desc = anchor.desc })
end

-- file keymap
utils.setKey("n", "<leader>fr", vim.lsp.buf.rename, { desc = "[f]ile [r]ename" })
utils.setKey("n", "<leader>fe", vim.cmd.Ex, { desc = "[f]ile [e]xplorer" })
