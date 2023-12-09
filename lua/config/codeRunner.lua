local utils = require("helper.utils")
local window = require("helper.window")
local fileTypeConfig = {
    python = 'py "%s"',
    javascript = 'node "%s"',
}
window.createWindowBind({
    name = "codeOutput",
    windowName = "out",
    toggle = {
        key = "<Leader>tc",
        mode = "n",
        description = "Open [c]ode runner output window",
        type = "cmd",
        splitCmd = "bot sp",
        cmd = "ter",
        afterCmd = "",
    },
})
utils.createCommand("RunCode", function()
    local path = vim.fn.expand("%:p")
    local cmd = vim.F.if_nil(fileTypeConfig[vim.bo.filetype], ""):format(path)
    if cmd == "" then
        error("No command define for " .. vim.bo.filetype .. " file type")
        return
    end
    window.showWindow("codeOutput")
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i" .. cmd .. "<cr>", true, false, true), "t", false)
end, {})
