local utils = require("helper.utils")

local anchors = {
    {
        key = "c",
        path = "C:\\Users\\nphuy\\OneDrive\\Desktop\\Code",
        type = "open",
        desc = "[c]ode folder",
    },
    {
        key = "m",
        path = "C:\\Users\\nphuy\\OneDrive\\Desktop\\Code\\DiscordBot\\discord.js\\IMFMagpie\\index.js",
        type = "file",
        desc = "[m]agpie code",
    },
    {
        key = "d",
        path = "C:\\Users\\nphuy\\OneDrive\\Desktop\\Code\\DiscordBot\\discord.js\\Dyyes\\index.ts",
        type = "file",
        desc = "[d]yyes code",
    },
    {
        key = "v",
        path = "C:\\Users\\nphuy\\AppData\\Local\\nvim",
        type = "folder",
        desc = "[v]im config folder",
    },
    {
        key = "n",
        path = "C:\\Users\\nphuy\\OneDrive\\Desktop\\School Note",
        type = "folder",
        desc = "school [n]ote folder",
    },
    { key = "h", path = "C:\\Users\\nphuy", type = "open", desc = "[h]ome folder" },
}
local function genAnchorCommand(anchor)
    local command = ""
    if anchor.type == "folder" then
        command = "<cmd>cd " .. anchor.path .. "<cr><cmd>Telescope find_files<cr>"
    elseif anchor.type == "file" then
        command = "<cmd>e " .. anchor.path .. "<cr><cmd>Here<cr>"
    elseif anchor.type == "open" then
        command = "<cmd>cd " .. anchor.path .. "<cr><cmd>e .<cr>"
    end
    return command
end
for _, anchor in ipairs(anchors) do
    local command = genAnchorCommand(anchor)
    utils.setKey("n", "<leader>G" .. anchor.key, command, { desc = anchor.desc })
end

return {
    anchors = anchors,
    genAnchorCommand = genAnchorCommand,
}
