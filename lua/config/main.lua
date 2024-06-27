local module = { "options", "remap", "codeRunner", "autocmd", "anchor", "command" }
for _, m in ipairs(module) do
    require("config." .. m)
end

-- neovide setting
if vim.g.neovide then
    require("config.neovide")
end
