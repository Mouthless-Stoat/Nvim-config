local utils = require("helper.utils")
local M = {}
M.floatData = {}

function M.cleanConfig(config)
    return {
        relative = config.relative,
        win = config.win,
        anchor = config.anchor,
        width = config.width,
        height = config.height,
        bufpos = config.bufpos,
        row = config.row,
        col = config.col,
        focusable = config.focusable,
        external = config.external,
        zindex = config.zindex,
        style = config.style,
        border = config.border,
        title = config.title,
        title_pos = config.title_pos,
    }
end

function M.changeWinHl(win, hl)
    -- change the window hl
    if hl ~= nil then
        local temp = {}
        for hn, hs in pairs(hl) do
            table.insert(temp, hn .. ":" .. hs)
        end
        vim.api.nvim_win_set_option(win, "winhl", table.concat(temp, ","))
    end
end

function M.updateFloat(win, config)
    vim.api.nvim_win_set_config(win, M.cleanConfig(config))
end

--[[
config is just normal vim.api.nvim_open_win() opts with a few extra
{
    position = "center" -- auto center when create
    highlight = { -- window hl key is hl name and value is hl to
        "Normal" = "",
        "FloatBorder" = "",
        "FloatTitle" = "",
        -- etc
    }
    titleFunc = function() end -- function to generate title
    moveCount = 0 -- how much to move the window
    shiftCount = 0 -- how much to shift/scale the window
}
--]]
function M.createFloat(config)
    local col = 0
    local row = 0

    local container = (
        config.relative == "editor" and vim.api.nvim_list_uis()[1]
        or config.relative == "win" and {
            width = vim.api.nvim_win_get_width(config.win or 0),
            height = vim.api.nvim_win_get_height(config.win or 0),
        }
        or {}
    )

    -- postion it if a postion is set
    if config.position == "center" then
        col = (container.width / 2) - (config.width / 2)
        row = (container.height / 2) - (config.height / 2)
    elseif config.position == "bottomMid" then
        col = (container.width / 2) - (config.width / 2)
        row = container.height - config.height - 1
    elseif config.position == "bottom" then
        col = 0
        row = container.height - config.height - 1
    end

    config.col = col
    config.row = row
    config.container = container

    -- make the window and buffer
    local buf = vim.api.nvim_create_buf(false, true)
    -- pass in all the relevant info cus i can't be bother to clean it
    local win = vim.api.nvim_open_win(buf, true, M.cleanConfig(config))

    -- change window hl group
    M.changeWinHl(win, config.highlight)

    -- set the title and id so it easier to go to
    ---@diagnostic disable-next-line: need-check-nil
    config.ogTitle = config.title
    config.title = config.titleFunc == nil and vim.api.nvim_win_get_number(win) .. ": " .. config.ogTitle
        or config.titleFunc
    M.updateFloat(win, config)

    M.floatData[vim.fn.win_getid()] = config

    return { win = win, buf = buf }
end

function M.moveFloat(win, direction, amount)
    local config = M.floatData[win]
    -- calculate the amount base on which direction and moveCount
    amount = vim.F.if_nil(amount, vim.F.if_nil(config.moveCount, 1))
        * (
            (direction == "up" or direction == "left") and -1
            or (direction == "down" or direction == "right") and 1
            or 0
        )
    print(amount)
    -- helper function instead of typing ternary hell
    local function checkDir(ifX, ifY)
        return (direction == "left" or direction == "right") and ifX
            or (direction == "up" or direction == "down") and ifY
            or ""
    end
    print(
        math.clamp(
            config[checkDir("col", "row")] + amount,
            0,
            config.container[checkDir("width", "height")] - config[checkDir("width", "height")]
        ),
        config[checkDir("col", "row")] + amount,
        config.container[checkDir("width", "height")] - config[checkDir("width", "height")]
    )
    config[checkDir("col", "row")] = math.clamp(
        config[checkDir("col", "row")] + amount,
        0,
        config.container[checkDir("width", "height")] - config[checkDir("width", "height")]
    )
    M.updateFloat(win, config)
end

function M.resizeFloat(win, opt)
    local config = M.floatData[win]
    if opt.width and opt.height then
        config.width = opt.width
        config.height = opt.height
    else
        local amount = (opt.amount or config.shiftCount or 1)
            * (
                (opt.direction == "up" or opt.direction == "left") and -1
                or (opt.direction == "down" or opt.direction == "right") and 1
                or 0
            )
        local temp = (
            (opt.direction == "left" or opt.direction == "right") and "width"
            or (opt.direction == "up" or opt.direction == "down") and "height"
            or ""
        )

        config[temp] = math.clamp(config[temp] + amount, 1, config.container[temp] - 2)
    end
    M.updateFloat(win, config)
end

M.augroup = utils.createAugroup("stickyNote", {})

utils.createAutocmd({ "WinNew", "WinEnter", "WinClosed" }, {
    pattern = "*",
    group = M.augroup,
    callback = function(data)
        if data.event == "WinClosed" then
            M.floatData[tonumber(data.match)] = nil
        end
        for win, config in pairs(M.floatData) do
            config.title = config.titleFunc == nil and vim.api.nvim_win_get_number(win) .. ": " .. config.ogTitle
                or config.titleFunc
            M.updateFloat(win, config)
        end
    end,
})
return M
