-- new command for nvim
local utils = require("helper.utils")
utils.createCommand("Here", "cd %:h", {})
utils.createCommand("Scratch", "enew | setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile", {})
utils.createCommand("Q", "q", {})
