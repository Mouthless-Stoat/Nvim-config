local utils = require("helper.utils")

-- Folder: Cd to the path and open the picker
-- File: Open the file and cd parent
-- Explore: Cd to the path and open the explorer

local anchors = {
    {
        name = "Code Folder",
        path = "D:\\OneDrive\\Desktop\\Code",
        type = "explore",
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
    {
        name = "IMF Sigils Book",
        path = "D:\\OneDrive\\Desktop\\sigilBook",
        type = "folder",
        color = "Purple",
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
                        vim.cmd("Telescope find_files")
                    elseif a.type == "file" then
                        vim.cmd.e(a.path)
                        vim.cmd("Here")
                    elseif a.type == "explore" then
                        vim.cmd.cd(a.path)
                        utils.feedkeys("<leader>f")
                    end
                end)
                return true
            end,
        })
        :find()
end

utils.setKey("n", "<leader>sa", anchor, {})
