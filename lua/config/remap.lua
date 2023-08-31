-- remap key for nvim. For phugin specific remap go to the phugin file
local utils = require("utils")
vim.g.mapleader = " "
utils.setKey("n", "<C-s>", vim.cmd.w, {})
