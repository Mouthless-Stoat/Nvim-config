function math.clamp(val, min, max)
    return math.min(math.max(val, min), max)
end
return {
    setKey = vim.keymap.set,
    delKey = vim.keymap.del,
    addCommand = vim.api.nvim_create_user_command,
    createAutocmd = vim.api.nvim_create_autocmd,
}
