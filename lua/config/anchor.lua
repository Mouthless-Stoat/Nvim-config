local utils = require("helper.utils")

local anchors = {
    {
        name = "Code Folder",
        path = "D:\\OneDrive\\Desktop\\Code",
        type = "open",
        color = "Blue",
    },
    {
        name = "Magpie Source File",
        path = "D:\\OneDrive\\Desktop\\Code\\DiscordBot\\discord.js\\IMFMagpie\\index.js",
        type = "file",
        color = "Yellow",
    },
    {
        name = "Nvim Config Folder",
        path = "D:\\config\\nvim",
        type = "folder",
        color = "Green",
    },
    {
        name = "Magpie",
        path = "D:\\OneDrive\\Desktop\\Code\\Rust\\magpie",
        type = "folder",
        color = "Orange",
    },
}

local longestName = 0

for _, a in ipairs(anchors) do
    if #a.name > longestName then
        longestName = #a.name
    end
end

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local entry_display = require("telescope.pickers.entry_display")

local displayer = entry_display.create({
    separator = " | ",
    items = {
        { width = longestName },
        { remaining = true },
    },
})

local function anchor(opts)
    opts = opts or {}
    pickers
        .new(opts, {
            prompt_title = "Anchor",
            finder = finders.new_table({
                results = anchors,
                entry_maker = function(entry)
                    return {
                        value = entry,
                        display = function(e)
                            return displayer({
                                { e.value.name, e.value.color },
                                { e.value.path, e.value.color },
                            })
                        end,
                        ordinal = entry.name,
                    }
                end,
            }),
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(prompt_bufnr, _)
                actions.select_default:replace(function()
                    actions.close(prompt_bufnr)
                    local a = action_state.get_selected_entry().value
                    if a.type == "folder" then
                        vim.cmd.cd(a.path)
                        vim.cmd("Oil .")
                        vim.cmd("Telescope find_files")
                    elseif a.type == "file" then
                        vim.cmd.e(a.path)
                        vim.cmd("Here")
                    elseif a.type == "open" then
                        vim.cmd.cd(a.path)
                        vim.cmd("Oil .")
                    end
                end)
                return true
            end,
        })
        :find()
end

utils.setKey("n", "<leader>sa", anchor, {})
