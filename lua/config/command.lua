-- new command for nvim
local utils = require("helper.utils")
utils.addCommand("Here", "cd %:h", {})
utils.addCommand("Scratch", "enew | setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile", {})
