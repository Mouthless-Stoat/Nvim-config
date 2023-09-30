vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf, timeout_ms = 5000 })
    end,
}) -- format when save

-- md formating
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.md",
    callback = function()
        vim.o.syntax = "markdown"
        vim.o.wrap = true
        vim.o.linebreak = true
    end,
})

vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*.md",
    callback = function()
        vim.o.syntax = nil
        vim.o.wrap = false
        vim.o.linebreak = true
    end,
})

-- highlights current option on start screen
vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = function()
        if pcall(function()
            return vim.inspect_pos().extmarks[1].opts.hl_group
        end) then
            local hl = vim.inspect_pos().extmarks[1].opts.hl_group
            local hlSetting = vim.api.nvim_get_hl(0, { name = hl })
            if hl:sub(1, #"dashButton") == "dashButton" then
                hlSetting.reverse = true
                hlSetting.italic = true
                vim.api.nvim_set_hl(0, hl, hlSetting)
                local cursorPos = vim.api.nvim_win_get_cursor(0)
                if
                    pcall(function()
                        return vim.inspect_pos(0, cursorPos[1] - 3, cursorPos[2]).extmarks[1].opts.hl_group
                    end)
                then
                    hl = vim.inspect_pos(0, cursorPos[1] - 3, cursorPos[2]).extmarks[1].opts.hl_group
                    hlSetting = vim.api.nvim_get_hl(0, { name = hl })
                    hlSetting.reverse = false
                    hlSetting.italic = false
                    vim.api.nvim_set_hl(0, hl, hlSetting)
                end
                if
                    pcall(function()
                        return vim.inspect_pos(0, cursorPos[1] + 1, cursorPos[2]).extmarks[1].opts.hl_group
                    end)
                then
                    hl = vim.inspect_pos(0, cursorPos[1] + 1, cursorPos[2]).extmarks[1].opts.hl_group
                    hlSetting = vim.api.nvim_get_hl(0, { name = hl })
                    hlSetting.reverse = false
                    hlSetting.italic = false
                    vim.api.nvim_set_hl(0, hl, hlSetting)
                end
            else
                return
            end
        end
    end,
})
