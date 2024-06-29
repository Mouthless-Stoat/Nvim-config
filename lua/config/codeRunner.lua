local utils = require("helper.utils")
local window = require("helper.window")
local fileTypeConfig = {
    python = 'py "%f"',
    javascript = 'node "%f"',
    rust = 'cd "%p"<cr>cargo run',
    typescript = 'ts-node "%f"',
}

function ProcessCmd(fileType, path, filePath)
    return vim.F.if_nil(fileTypeConfig[fileType], ""):gsub("%%p", path):gsub("%%f", filePath)
end

function RunCode(fileType, path, filePath)
    local cmd = ProcessCmd(fileType, path, filePath)
    if cmd == "" then
        error("No comman define for " .. vim.bo.filetype .. " file type. Please define one in config")
        return
    end
    window.showWindow("terminal")
    utils.feedkeys(cmd .. "<cr>")
end

-- window.createWindowBind({
--     name = "codeOutput",
--     windowName = "out",
--     toggle = {
--         key = "<Leader>tc",
--         mode = "n",
--         description = "Open [c]ode runner output window",
--         type = "cmd",
--         splitCmd = "bot sp",
--         cmd = "ter",
--         afterCmd = "",
--     },
-- })

utils.createCommand("RunFile", function()
    RunCode(vim.bo.filetype, vim.fn.expand("%:p:h"), vim.fn.expand("%:p"))
end, {})

utils.createCommand("RunCode", function()
    local list = utils.listDir(vim.fn.getcwd())
    local configPath = ""
    for _, file in ipairs(list) do
        if file:find("\\config.json") then
            configPath = file
        end
    end
    local file = io.open(configPath, "r")
    if not file then
        error("No config.json found in cwd please make one")
    end
    local content = file:read("*all")
    file:close()
    if content == "" then
        error("Config.json is empty")
    end
    local json = vim.fn.json_decode(content)
    if not json then
        error("Invalid JSON")
    end
    if (not json.file or not json.type) and not json.commands then
        error("Config.json missing field")
    end

    if not json.commands then
        RunCode(json.type, vim.fn.getcwd(), json.file)
    else
        local cmd = ""
        if type(json.commands) then
            for i, v in ipairs(json.commands) do
                print(i, v[1])
            end
            print("Command: ")
            cmd = json.commands[tonumber(vim.fn.getcharstr())][2]
        else
            cmd = json.commands
        end
        window.showWindow("terminal")
        utils.feedkeys(cmd .. "<cr>")
    end
end, {})
