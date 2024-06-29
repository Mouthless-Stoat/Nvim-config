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
        path = "D:\\config\\nvim",
        type = "folder",
        desc = "[v]im config folder",
    },
    {
        key = "s",
        path = "C:\\Users\\nphuy\\OneDrive\\Desktop\\School Note",
        type = "folder",
        desc = "school [n]ote folder",
    },
    { key = "h", path = "C:\\Users\\nphuy", type = "open", desc = "[h]ome folder" },
    {
        key = "t",
        path = "C:\\Users\\nphuy\\OneDrive\\Desktop",
        type = "open",
        desc = "[d]esktop folder",
    },
    {
        key = "d",
        path = "C:\\Users\\nphuy\\Downloads",
        type = "open",
        desc = "[d]ownloads folder",
    },
    {
        key = "x",
        path = "C:\\Users\\nphuy\\OneDrive\\Desktop\\Code\\Javascript\\Xper\\src\\main.ts",
        type = "file",
        desc = "[x]per code",
        post = "<cmd>cd ..<cr>",
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
    command = command .. vim.F.if_nil(anchor.post, "")
    return command
end
for _, anchor in ipairs(anchors) do
    local command = genAnchorCommand(anchor)
    utils.setKey("n", "<Leader>G" .. anchor.key, command, { desc = "[G]oto " .. anchor.desc })
end

return {
    anchors = anchors,
    genAnchorCommand = genAnchorCommand,
}
