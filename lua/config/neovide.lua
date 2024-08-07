local utils = require("helper.utils")

-- remap
utils.setKey("n", "<C-=>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
    print(vim.g.neovide_scale_factor)
end)
utils.setKey("n", "<C-->", function()
    if vim.g.neovide_scale_factor > 0.5 then
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
    end
    print(vim.g.neovide_scale_factor)
end)
utils.setKey("n", "<leader>z", function()
    vim.ui.input({ prompt = "Enter new size: " }, function(input)
        local num = tonumber(input)
        if num < 0.5 then
            print("No.")
            return
        end
        vim.g.neovide_scale_factor = tonumber(input)
    end)
end, { desc = "change [z]oom" })

-- config
vim.g.neovide_refresh_rate = 120
vim.g.neovide_scale_factor = 1
vim.g.neovide_cursor_animation_length = 0.08
vim.g.neovide_cursor_trail_size = 0.5
vim.g.neovide_cursor_vfx_mode = "wireframe"
vim.g.neovide_scroll_animation_length = 0.1
vim.g.neovide_floating_shadow = false
