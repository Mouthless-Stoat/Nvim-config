local utils = require("helper.utils")
local floatie = require("helper.floatie")

function RunUiua()
    vim.cmd.write() -- save the file
    local output = vim.fn.system({ "uiua", "run", string.format("%s", vim.fn.expand("%:p")) })
    vim.fn.setreg("+", output)
    local float = floatie.createFloat({
        relative = "win",
        position = "bottom",
        win = vim.api.nvim_get_current_win(),
        title = "Pad Output",
        width = 78,
        height = 10,
        style = "minimal",
        border = "single",
        moveCount = 0,
        shiftCount = 0,
    })
end
utils.setKey("n", "<Leader>wp", function()
    local float = floatie.createFloat({
        relative = "editor",
        position = "center",
        title = "Uiua Pad",
        width = 80,
        height = 20,
        style = "minimal",
        border = "single",
        moveCount = 5,
        shiftCount = 2,
    })
    vim.opt_local.filetype = "uiua"

    -- set up the lsp cus it doesn't for some reason
    vim.lsp.start({
        name = "uiua_lsp",
        cmd = { "uiua", "lsp" },
    })
    -- function to help remap
    local nmap = function(keys, func, desc, mode)
        local modeToPut = { "n" }
        if desc then
            desc = "LSP: " .. desc
        end

        if mode then
            table.insert(modeToPut, mode)
        end

        vim.keymap.set(modeToPut, keys, func, { buffer = float.buf, desc = desc })
    end

    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    vim.cmd.edit(vim.fn.stdpath("config") .. "\\lua\\config\\main.ua")
    local newBuf = vim.api.nvim_win_get_buf(float.win)
    vim.keymap.set("n", "<c-s>", RunUiua, { buffer = newBuf, remap = true })
    vim.opt.gfn = "Uiua386:h9:#h-none" -- uiua font
end, { desc = "new [w]indow [s]ticky note" })
