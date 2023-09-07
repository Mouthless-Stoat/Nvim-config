local utils = require("utils")

-- remap
utils.setKey("n", "<c-=>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
end)
utils.setKey("n", "<c-->", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
end)

-- config
vim.g.neovide_scale_factor = 1
vim.g.neovide_cursor_animation_length = 0.08
vim.g.neovide_cursor_trail_size = 0.5
vim.g.neovide_cursor_vfx_mode = "wireframe"
