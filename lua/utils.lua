vim.g.toggleWinId = {}
local function createToggleWindow(name, windowName, splitCmd, cmd, afterCmd, resetCmd, resetType)
    local temp = vim.g.toggleWinId
    local data = temp[name]
    if data == nil then
        temp[name] = {
            bufferId = -1,
            windowId = -1,
            name = windowName,
            splitCmd = splitCmd,
            cmd = cmd,
            afterCmd = afterCmd,
            resetCmd = resetCmd,
            resetType = resetType,
        }
        vim.g.toggleWinId = temp
    end
end
local function toggleWindow(name)
    local temp = vim.g.toggleWinId
    local data = temp[name]

    if vim.fn.win_gotoid(data.windowId) == 0 then
        if vim.fn.bufexists(data.bufferId) == 0 then
            -- make the terminal
            vim.cmd(data.splitCmd)
            vim.cmd(data.cmd)

            -- rename the buffer to use later
            vim.cmd.file(data.name)

            -- save the window and buffer id
            data.bufferId = vim.api.nvim_get_current_buf()
            data.windowId = vim.api.nvim_get_current_win()

            vim.cmd(data.afterCmd)
        else
            vim.cmd(data.splitCmd) -- split the screen at the bottom
            vim.cmd.buffer(data.name) -- reuse the terminal buffer
            data.windowId = vim.api.nvim_get_current_win() -- save the new window info
            vim.cmd.startinsert()
        end
    else
        vim.fn.win_gotoid(data.windowId)
        vim.cmd.hide()
    end
    vim.g.toggleWinId = temp
end

local function resetToggleWindow(name)
    local temp = vim.g.toggleWinId
    local data = temp[name]

    if vim.fn.win_gotoid(data.windowId) == 0 then
        vim.cmd(data.splitCmd) -- split the screen at the bottom
        vim.cmd.buffer(data.name) -- reuse the terminal buffer
    end
    if data.resetType == "cmd" then
        if data.resetCmd == "" or data.resetCmd == nil then
            vim.cmd(data.cmd)
        else
            vim.cmd(data.resetCmd)
        end
        vim.cmd.file(data.name)
    elseif data.resetType == "feed" then
        vim.api.nvim_input(data.resetCmd)
    elseif data.resetType == "function" then
        data.resetCmd()
    end
    data.windowId = vim.api.nvim_get_current_win() -- save the new window info
    vim.g.toggleWinId = temp
end
return {
    setKey = vim.keymap.set,
    delKey = vim.keymap.del,
    addCommand = vim.api.nvim_create_user_command,
    isNormal = function()
        return vim.tbl_contains({ "n", "niI", "niR", "niV", "nt", "ntT" }, vim.api.nvim_get_mode().mode)
    end,
    isInsert = function()
        return vim.tbl_contains({ "i", "ic", "ix" }, vim.api.nvim_get_mode().mode)
    end,
    isVisual = function()
        return vim.tbl_contains({ "v", "vs", "V", "Vs", "\22", "\22s", "s", "S", "\19" }, vim.api.nvim_get_mode().mode)
    end,
    isCommand = function()
        return vim.tbl_contains({ "c", "cv", "ce", "rm", "r?" }, vim.api.nvim_get_mode().mode)
    end,
    isReplace = function()
        return vim.tbl_contains({ "R", "Rc", "Rx", "Rv", "Rvc", "Rvx", "r" }, vim.api.nvim_get_mode().mode)
    end,
    createToggleWindow = function(
        mode,
        key,
        desc,
        resetMode,
        resetKey,
        resetDesc,
        name,
        windowName,
        splitCmd,
        cmd,
        afterCmd,
        resetCmd,
        resetType
    )
        createToggleWindow(name, windowName, splitCmd, cmd, afterCmd, resetCmd, resetType)
        vim.keymap.set(mode, key, function()
            toggleWindow(name)
        end, { desc = desc })
        vim.keymap.set(resetMode, resetKey, function()
            resetToggleWindow(name)
        end, { desc = resetDesc })
    end,
}
