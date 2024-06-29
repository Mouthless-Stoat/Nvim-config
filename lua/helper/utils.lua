function math.clamp(val, min, max)
    return math.max(math.min(max, val), min)
end

function string.starts(str, start)
    return string.sub(str, 1, string.len(start)) == start
end

function string.trim(str)
    return str:gsub("^%s*(.-)%s*$", "%1")
end

local function setHl(g, c)
    vim.api.nvim_set_hl(0, g, c)
end

return {
    setKey = vim.keymap.set,
    delKey = vim.keymap.del,
    createCommand = vim.api.nvim_create_user_command,
    createAutocmd = vim.api.nvim_create_autocmd,
    createAugroup = vim.api.nvim_create_augroup,
    setHl = setHl,
    setHls = function(hls)
        for c, g in pairs(hls) do
            setHl(c, g)
        end
    end,
    feedkeys = function(feed)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(feed, true, false, true), "t", false)
    end,
    evalStatus = function(str)
        return vim.api.nvim_eval_statusline(str, {}).str
    end,
}
