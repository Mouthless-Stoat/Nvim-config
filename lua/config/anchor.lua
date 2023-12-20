local utils = require("helper.utils")

local anchors = {
    {
        key = "c",
        path = "C:\\Users\\nphuy\\OneDrive\\Desktop\\Code",
        type = "open",
        desc = "[G]oto [c]ode folder",
    },
    {
        key = "m",
        path = "C:\\Users\\nphuy\\OneDrive\\Desktop\\Code\\DiscordBot\\discord.js\\IMFMagpie\\index.js",
        type = "file",
        desc = "[G]oto [m]agpie code",
    },
    {
        key = "d",
        path = "C:\\Users\\nphuy\\OneDrive\\Desktop\\Code\\DiscordBot\\discord.js\\Dyyes\\index.ts",
        type = "file",
        desc = "[G]oto [d]yyes code",
    },
    {
        key = "v",
        path = "C:\\Users\\nphuy\\AppData\\Local\\nvim",
        type = "folder",
        desc = "[G]oto [v]im config folder",
    },
    {
        key = "s",
        path = "C:\\Users\\nphuy\\OneDrive\\Desktop\\School Note",
        type = "folder",
        desc = "[G]oto school [n]ote folder",
    },
    { key = "h", path = "C:\\Users\\nphuy", type = "open", desc = "[G]oto [h]ome folder" },
    {
        key = "t",
        path = "C:\\Users\\nphuy\\OneDrive\\Desktop",
        type = "open",
        desc = "[G]oto [d]esktop folder",
    },
    {
        key = "d",
        path = "C:\\Users\\nphuy\\Downloads",
        type = "open",
        desc = "[G]oto [d]ownloads folder",
    },
}
local function genAnchorCommand(anchor)
    local command = ""
    if anchor.type == "folder" then
        command = "<cmd>cd " .. anchor.path .. "<cr><cmd>Telescope find_files<cr>"
    elseif anchor.type == "file" then
        command = "<cmd>e " .. anchor.path .. "<cr><cmd>Here<cr>"
    elseif anchor.type == "open" then
        command = "<cmd>cd " .. anchor.path .. "<cr><cmd>Oil .<cr>"
    end
    return command
end
for _, anchor in ipairs(anchors) do
    local command = genAnchorCommand(anchor)
    utils.setKey("n", "<Leader>G" .. anchor.key, command, { desc = anchor.desc })
end

return {
    anchors = anchors,
    genAnchorCommand = genAnchorCommand,
}
