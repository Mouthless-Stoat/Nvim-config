local module = { "options", "remap", "codeRunner", "autocmd", "anchor", "command" }
for _, m in ipairs(module) do
    require("config." .. m)
end
