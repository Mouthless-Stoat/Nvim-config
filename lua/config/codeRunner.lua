local utils = require("helper.utils")
local window = require("helper.window")
local fileTypeConfig = {
    python = 'py "%f"',
    javascript = 'node "%f"',
    rust = 'cd "%p"<cr>cargo run',
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
    local filePath = vim.fn.expand("%:p")
    local path = vim.fn.expand("%:h")
    local cmd = vim.F.if_nil(fileTypeConfig[vim.bo.filetype], ""):gsub("%%p", path):gsub("%%f", filePath)
    if cmd == "" then
        error("No command define for " .. vim.bo.filetype .. " file type")
        return
    end
    window.showWindow("codeOutput")
    -- utils.feedkeys("i" .. cmd .. "<cr><esc>")
end, {})
