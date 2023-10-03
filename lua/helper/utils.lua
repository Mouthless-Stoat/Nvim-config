return {
    setKey = vim.keymap.set,
    delKey = vim.keymap.del,
    addCommand = vim.api.nvim_create_user_command,
    createAutocmd = vim.api.nvim_create_autocmd,
}
