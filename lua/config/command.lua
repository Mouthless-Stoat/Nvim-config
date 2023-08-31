-- new command for nvim
local utils = require("utils")
utils.addCommand("Here", "cd %:h", {})
