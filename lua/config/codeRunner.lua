local utils = require("helper.utils")
local fileTypeConfig = {
    python = "py ",
}
utils.addCommand("RunCode", function()
    local cmd = vim.F.if_nil(fileTypeConfig[vim.bo.filetype], "")
    if cmd == "" then
        error("No command define for " .. vim.bo.filetype .. " file type")
        return
    end
end, {})
