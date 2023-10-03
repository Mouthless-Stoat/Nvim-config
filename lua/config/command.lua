-- new command for nvim
local utils = require("helper.utils")
utils.addCommand("Here", "cd %:h", {})
