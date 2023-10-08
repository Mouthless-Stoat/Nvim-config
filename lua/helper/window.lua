local M = {}
M.winId = {}

--[[
{
    name = "", -- interenal name for this togggle window
    windowName = "", -- window name 
    toggle = { -- window toggle option
        key = "", -- key to press
        mode = "" -- mode the key is active in
        bufLocal = false -- the key shoudl be only local to the window
        description = "", -- keybind description

        type = "", -- type of toggle. "cmd", "func"

        -- if type is "cmd" provide these option
        splitCmd = "", -- how to split the window
        cmd = "", -- what to run in the split
        afterCmd = "", -- what to run after everything is done

        -- if type if "func" provide these option
        createFunc = function() end, -- function to create the toggle window
        openFunc = function() end, -- function to open the toggle window
    },

    reset = { -- window reset option
        key = "", -- key to press
        mode = "" -- mode the key is active in
        bufLocal = false -- the key shoudl be only local to the window
        description = "", -- keybind description

        type = "", -- type of reset. "cmd", "func"

        -- if type is "cmd" provide these option
        cmd = "", -- what to run when reset

        -- if type if "func" provide these option
        func = function() end, -- function to run when reset
    }
}
--]]
function M.createWindowData(config)
    local temp = M.winId
    temp[config.name] = vim.tbl_extend("error", {
        bufferId = -1,
        windowId = -1,
    }, config)
    M.winId = temp
end

function M.showWindow(name)
    local data = M.winId[name]
    if data.toggle.type == "cmd" then
        vim.cmd(data.toggle.splitCmd) -- open the window
        vim.cmd.buffer(data.bufferId) -- reuse the buffer
        data.windowId = vim.api.nvim_get_current_win() -- save the new window info
        vim.cmd(data.toggle.afterCmd)
    elseif data.toggle.type == "func" then
        data.toggle.openFunc()
    end
end

function M.hideWindow(name)
    local data = M.winId[name]
    vim.fn.win_gotoid(data.windowId)
    vim.cmd.hide()
end

function M.createWindow(name)
    local data = M.winId[name]
    if data.toggle.type == "cmd" then
        -- make the window by spliting
        vim.cmd(data.toggle.splitCmd)
        vim.cmd(data.toggle.cmd)

        -- rename the buffer to reuse later instead of using buffer id
        vim.cmd.file(data.windowName)

        -- save the window and buffer id to use
        data.bufferId = vim.api.nvim_get_current_buf()
        data.windowId = vim.api.nvim_get_current_win()

        vim.cmd(data.toggle.afterCmd)
    elseif data.toggle.type == "func" then
        data.toggle.createFunc()
    end
end

function M.toggleWindow(name)
    local data = M.winId[name]

    if vim.fn.win_gotoid(data.windowId) == 0 then
        if vim.fn.bufexists(data.bufferId) == 0 then
            M.createWindow(name)
        else
            M.showWindow(name)
        end
    else
        M.hideWindow(name)
    end
end

function M.resetWindow(name)
    local data = M.winId[name]

    if vim.fn.win_gotoid(data.windowId) == 0 then
        M.showWindow(name)
    end
    if data.reset.type == "cmd" then
        vim.cmd(data.reset.cmd)
    elseif data.reset.type == "func" then
        data.reset.func()
    end
    data.windowId = vim.api.nvim_get_current_win() -- save the new window info
end

function M.createWindowBind(config)
    M.createWindowData(config)
    if config.toggle.mode ~= nil or config.toggle.mode ~= "" or config.toggle.key ~= nil or config.toggle.key ~= "" then
        vim.keymap.set(config.toggle.mode, config.toggle.key, function()
            -- jank fix for local mapping
            if config.toggle.bufLocal and vim.api.nvim_get_current_buf() ~= M.winId[config.name].bufferId then
                return
            end
            M.toggleWindow(config.name)
        end, { desc = config.toggle.description })
    end
    if config.reset == nil then
        return
    end
    if config.reset.mode ~= nil or config.reset.mode ~= "" or config.reset.key ~= nil or config.reset.key ~= "" then
        vim.keymap.set(config.reset.mode, config.reset.key, function()
            if config.toggle.bufLocal and vim.api.nvim_get_current_buf() ~= M.winId[config.name].bufferId then
                return
            end
            M.resetWindow(config.name)
        end, { desc = config.reset.description })
    end
end

return M
