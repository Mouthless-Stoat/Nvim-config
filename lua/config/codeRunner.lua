local utils = require("helper.utils")
local window = require("helper.window")
local fileTypeConfig = {
    python = "py ",
}
window.createToggleWindowBind({
    name = "codeOutput",
    windowName = "out",
    toggle = {
        key = "<leader>tc",
        mode = "n",
        description = "Open [c]ode runner output window",
        type = "cmd",
        splitCmd = "bot sp",
        cmd = "ter",
        afterCmd = "",
    },
})
utils.addCommand("RunCode", function()
    local cmd = vim.F.if_nil(fileTypeConfig[vim.bo.filetype], "")
    local path = vim.fn.expand("%:p")
    if cmd == "" then
        error("No command define for " .. vim.bo.filetype .. " file type")
        return
    end
    window.toggleWindow("codeOutput", true)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i" .. cmd .. path .. "<cr>", true, false, true), "t", false)
end, {})
