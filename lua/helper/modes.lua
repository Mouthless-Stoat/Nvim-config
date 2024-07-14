local M = {}
function M.isNormal()
    return vim.tbl_contains({ "n", "niI", "niR", "niV", "nt", "ntT" }, vim.api.nvim_get_mode().mode)
end

function M.isInsert()
    return vim.tbl_contains({ "i", "ic", "ix" }, vim.api.nvim_get_mode().mode)
end

function M.isVisual()
    return vim.tbl_contains({ "v", "vs", "V", "Vs", "\22", "\22s", "s", "S", "\19" }, vim.api.nvim_get_mode().mode)
end

function M.isCommand()
    return vim.tbl_contains({ "c", "cv", "ce", "rm", "r?" }, vim.api.nvim_get_mode().mode)
end

function M.isReplace()
    return vim.tbl_contains({ "R", "Rc", "Rx", "Rv", "Rvc", "Rvx", "r" }, vim.api.nvim_get_mode().mode)
end

function M.whichMode()
    return M.isNormal() and "n"
        or M.isInsert() and "i"
        or M.isVisual() and "v"
        or M.isCommand() and "c"
        or M.isReplace() and "r"
        or "t"
end

function M.formattedMode()
    return ({
        n = "normal",
        i = "insert",
        v = "visual",
        c = "command",
        r = "replace",
        t = "terminal",
    })[M.whichMode()]
end

return M
