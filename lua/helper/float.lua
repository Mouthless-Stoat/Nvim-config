local utils = require("helper.utils")
local M = {}

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
    keymap = {
        moveUp = "",
        moveDown = "",
        moveLeft = "",
        moveRight = "",
        decHeight = "<S-Up>",
        incHeight = "<S-Down>",
        decWidth = "<S-Left>",
        incWidth = "<S-Right>",
    }
}

--]]
function M.createFloat(config)
    local col = 0
    local row = 0

    -- clean non window base option
    local highlight = config.highlights or nil
    local position = config.position or nil
    local titleFunc = config.titleFunc or nil
    local keymap = config.keymap or nil
    local title = config.title

    config.highlights = nil
    config.position = nil
    config.titleFunc = nil
    config.keymap = nil

    local container = config.relative == "editor" and vim.api.nvim_list_uis()[1]
        or config.relative == "win"
            and {
                width = vim.api.nvim_win_get_width(config.win or 0),
                height = vim.api.nvim_win_get_height(config.win or 0),
            }

    -- postion it if a postion is set
    if position == "center" then
        col = (container.width / 2) - (config.width / 2)
        row = (container.height / 2) - (config.height / 2)
    end

    config.col = col
    config.row = row

    -- make the window and buffer
    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, config)

    -- change the window hl
    if highlight ~= nil then
        for hn, hs in pairs(highlight) do
            vim.api.nvim_win_set_option(win, "winhl", hn .. ":" .. hs)
        end
    end

    -- function to help reset the float window
    local update = function()
        vim.api.nvim_win_set_config(win, config)
    end

    -- set the title and id so it easier to go to
    ---@diagnostic disable-next-line: need-check-nil
    config.title = titleFunc == nil and "" .. title .. " / " .. vim.api.nvim_win_get_number(win) or titleFunc
    update()

    if keymap == nil then
        keymap = {
            moveUp = "<C-Up>",
            moveDown = "<C-Down>",
            moveLeft = "<C-Left>",
            moveRight = "<C-Right>",
            decHeight = "<S-Up>",
            incHeight = "<S-Down>",
            decWidth = "<S-Left>",
            incWidth = "<S-Right>",
        }
    end

    -- keymap to move float window
    utils.setKey("n", keymap.moveUp or "<C-Up>", function()
        config.row = math.clamp(config.row - 1, 0, container.height)
        update()
    end, { buffer = buf, remap = true })
    utils.setKey("n", keymap.moveDown or "<C-Down>", function()
        config.row = math.clamp(config.row + 1, 0, container.height)
        update()
    end, { buffer = buf, remap = true })
    utils.setKey("n", keymap.moveLeft or "<C-Left>", function()
        config.col = math.clamp(config.col - 1, 0, container.width)
        update()
    end, { buffer = buf, remap = true })
    utils.setKey("n", keymap.moveRight or "<C-Right>", function()
        config.col = math.clamp(config.col + 1, 0, container.width)
        update()
    end, { buffer = buf, remap = true })

    -- keymap to scale float window
    utils.setKey("n", keymap.decHeight or "<S-Up>", function()
        config.height = config.height - 1
        update()
    end, { buffer = buf, remap = true })
    utils.setKey("n", keymap.incHeight or "<S-Down>", function()
        config.height = config.height + 1
        update()
    end, { buffer = buf, remap = true })
    utils.setKey("n", keymap.decWidth or "<S-Left>", function()
        config.width = config.width - 1
        update()
    end, { buffer = buf, remap = true })
    utils.setKey("n", keymap.incWidth or "<S-Right>", function()
        config.width = config.width + 1
        update()
    end, { buffer = buf, remap = true })

    -- auto cmd to update window id
    utils.createAutocmd("WinEnter", {
        buffer = buf,
        callback = function()
            config.title = titleFunc == nil and "" .. title .. " / " .. vim.api.nvim_win_get_number(win)
                ---@diagnostic disable-next-line: need-check-nil
                or titleFunc()
            update()
        end,
    })

    return { win = win, buf = buf }
end

return M
