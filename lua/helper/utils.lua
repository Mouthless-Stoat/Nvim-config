function math.clamp(val, min, max)
    return math.max(math.min(max, val), min)
end
return {
    setKey = vim.keymap.set,
    delKey = vim.keymap.del,
    createCommand = vim.api.nvim_create_user_command,
    createAutocmd = vim.api.nvim_create_autocmd,
    createAugroup = vim.api.nvim_create_augroup,
    feedkeys = function(feed)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(feed, true, false, true), "t", false)
    end,
}
