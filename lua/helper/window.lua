local M = {}
vim.g.toggleWinId = {}

function M.createToggleWindow(config)
    local temp = vim.g.toggleWinId
    temp[config.name] = vim.tbl_extend("error", {
        bufferId = -1,
        windowId = -1,
    }, config)
    vim.g.toggleWinId = temp
end

function M.toggleWindow(name)
    local temp = vim.g.toggleWinId
    local data = temp[name]

    if vim.fn.win_gotoid(data.windowId) == 0 then
        if vim.fn.bufexists(data.bufferId) == 0 then
            if data.toggle.type == "cmd" then
                -- make the terminal
                vim.cmd(data.toggle.splitCmd)
                vim.cmd(data.toggle.cmd)

                -- rename the buffer to use later
                vim.cmd.file(data.windowName)

                -- save the window and buffer id
                data.bufferId = vim.api.nvim_get_current_buf()
                data.windowId = vim.api.nvim_get_current_win()

                vim.cmd(data.toggle.afterCmd)
            elseif data.toggle.type == "function" then
                data.toggle.createFunc()
            end
        else
            if data.toggle.type == "cmd" then
                vim.cmd(data.toggle.splitCmd) -- split the screen at the bottom
                vim.cmd.buffer(data.windowName) -- reuse the terminal buffer
                data.windowId = vim.api.nvim_get_current_win() -- save the new window info
                vim.cmd(data.toggle.afterCmd)
            elseif data.toggle.type == "func" then
                data.toggle.openFunc()
            end
        end
    else
        vim.fn.win_gotoid(data.windowId)
        vim.cmd.hide()
    end
    vim.g.toggleWinId = temp
end

function M.resetToggleWindow(name)
    local temp = vim.g.toggleWinId
    local data = temp[name]

    if vim.fn.win_gotoid(data.windowId) == 0 then
        if data.toggle.type == "cmd" then
            vim.cmd(data.toggle.splitCmd) -- split the screen at the bottom
            vim.cmd.buffer(data.name) -- reuse the terminal buffer
        elseif data.toggle.type == "func" then
            data.toggle.openFunc()
        end
    end
    if data.reset.type == "cmd" then
        vim.cmd(data.reset.cmd)
    elseif data.reset.type == "func" then
        data.reset.func()
    end
    data.windowId = vim.api.nvim_get_current_win() -- save the new window info
    vim.g.toggleWinId = temp
end

function M.createToggleWindowBind(config)
    M.createToggleWindow(config)
    vim.keymap.set(config.toggle.mode, config.toggle.key, function()
        M.toggleWindow(config.name)
    end, { desc = config.toggle.description })
    vim.keymap.set(config.reset.mode, config.reset.key, function()
        M.resetToggleWindow(config.name)
    end, { desc = config.reset.description })
end

return M
