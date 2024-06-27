-- for the sake of conciseness winbar and statusline are consider the same thing
local colors = require("config.theme.colors")
local utils = require("helper.utils")
local modes = require("helper.modes")
local devicons = require("nvim-web-devicons")

-- status line hl group
-- empty group are simply there to remind that they exist
-- put them all here is a bit cleaner
utils.setHls({
    StatusLine = { fg = colors.blue, bg = colors.black1 },
    WinBar = { fg = colors.blue, bg = colors.black1 },
    WinBarNC = { fg = colors.blue, bg = colors.black1 },

    StatusBasic = { fg = colors.white, bg = colors.black3, bold = true },
    StatusBasicSep = { bg = colors.black1, fg = colors.black3 },

    StatusCwd = { fg = colors.black1, bg = colors.blue },
    StatusCwdSep = { bg = colors.black1, fg = colors.blue },

    StatusMode = {},
    StatusModeSep = {},

    StatusFile = {},
    StatusFileStatus = {},

    StatusError = { fg = colors.black1, bg = colors.red, bold = true },
    StatusWarn = { fg = colors.black1, bg = colors.yellow, bold = true },
    StatusInfo = { fg = colors.black1, bg = colors.blue, bold = true },
    StatusHint = { fg = colors.black1, bg = colors.purple, bold = true },

    StatusErrorSep = { bg = colors.black1, fg = colors.red },
    StatusWarnSep = { bg = colors.black1, fg = colors.yellow },
    StatusInfoSep = { bg = colors.black1, fg = colors.blue },
    StatusHintSep = { bg = colors.black1, fg = colors.purple },

    StatusChange = { fg = colors.black1, bg = colors.yellow, bold = true },
    StatusRemove = { fg = colors.black1, bg = colors.red, bold = true },
    StatusAdd = { fg = colors.black1, bg = colors.green, bold = true },

    StatusChangeSep = { bg = colors.black1, fg = colors.yellow },
    StatusRemoveSep = { bg = colors.black1, fg = colors.red },
    StatusAddSep = { bg = colors.black1, fg = colors.green },

    StatusZoom = { fg = colors.black1, bg = colors.yellow, bold = true },
    StatusZoomSep = { bg = colors.black1, fg = colors.yellow },

    StatusLsp = {},
    StatusLspSep = {},

    StatusPercent = {},
    StatusPercentSep = {},

    StatusPlugin = { fg = colors.black1, bg = colors.purple, bold = true },
    StatusPluginSep = { bg = colors.black1, fg = colors.purple },

    StatusBranch = { fg = colors.black1, bg = colors.orange, bold = true },
    StatusBranchSep = { bg = colors.black1, fg = colors.orange },

    StatusLspLine = { fg = colors.green, bg = colors.black3, bold = true },
    StatusLspLineSep = { bg = colors.black1, fg = colors.black3, bold = true },

    StatusActive = { fg = colors.black1, bg = colors.green, bold = true },
    StatusActiveSep = { bg = colors.black1, fg = colors.green },

    StatusInactive = { fg = colors.black1, bg = colors.red, bold = true },
    StatusInactiveSep = { bg = colors.black1, fg = colors.red },
})

local function hl(g)
    return "%#" .. g .. "#"
end

local function sec(h, t)
    return table.concat({ hl(h), "", table.concat(t), hl(h), "%*" })
end

local function secBasic(hSep, h, cont)
    if type(cont) == "table" then
        cont = table.concat(cont)
    end
    return sec(hSep, { hl(h), cont })
end

function string.stLen(str)
    return vim.api.nvim_eval_statusline(str, {}).width
end

local function mode(len)
    local m = modes.formattedMode()

    if len then
        return #mode + 2
    end

    local modeColor = ({
        n = colors.blue,
        i = colors.green,
        v = colors.purple,
        c = colors.yellow,
        r = colors.red,
    })[modes.whichMode()]

    utils.setHl("StatusMode", {
        bg = modeColor,
        fg = colors.black1,
        bold = true,
    })

    utils.setHl("StatusModeSep", {
        fg = modeColor,
        bg = colors.black1,
    })

    return secBasic("StatusModeSep", "StatusMode", m)
end

local function fileName()
    local filetype = vim.o.filetype
    local icon, color = devicons.get_icon_color_by_filetype(filetype)

    if icon then
        icon = icon .. " "
    else
        icon = ""
    end

    color = color or colors.blue

    utils.setHl("StatusFile", {
        bg = color,
        fg = colors.black1,
        bold = true,
    })

    utils.setHl("StatusFileSep", {
        fg = color,
        bg = colors.black1,
    })

    local modFlag = ""
    if vim.bo.modified then
        modFlag = "[+]"
    elseif vim.bo.readonly then
        modFlag = "[-]"
    end

    if modFlag ~= "" then
        color = ({
            ["[+]"] = colors.green,
            ["[-]"] = colors.red,
        })[modFlag]
        utils.setHl("StatusFile", {
            bg = color,
            fg = colors.black1,
        })

        utils.setHl("StatusFileSep", {
            fg = color,
            bg = colors.black1,
        })
    end

    local out = (" %s%s "):format(icon, utils.evalStatus("%t"))

    if #out == 2 then
        out = " [no name] "
    end

    return secBasic("StatusFileSep", "StatusFile", modFlag .. out .. modFlag)
end

local function diagnostics()
    local count = {}
    local levels = {
        error = vim.diagnostic.severity.ERROR,
        warn = vim.diagnostic.severity.WARN,
        info = vim.diagnostic.severity.INFO,
        hint = vim.diagnostic.severity.HINT,
    }

    for name, level in pairs(levels) do
        count[name] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
    end

    local out = ""

    if count.error > 0 then
        out = out .. secBasic("StatusErrorSep", "StatusError", " " .. count.error) .. " "
    end
    if count.warn > 0 then
        out = out .. secBasic("StatusWarnSep", "StatusWarn", " " .. count.warn) .. " "
    end
    if count.info > 0 then
        out = out .. secBasic("StatusInfoSep", "StatusInfo", " " .. count.info) .. " "
    end
    if count.hint > 0 then
        out = out .. secBasic("StatusHintSep", "StatusHint", " " .. count.hint) .. " "
    end

    out = out:gsub("^%s*(.-)%s*$", "%1")

    return out == "" and "" or out
end

local function locPercent()
    local percent = utils.evalStatus("%p")

    local color = ({
        colors.red,
        colors.orange,
        colors.yellow,
        colors.green,
        colors.blue,
        colors.purple,
    })[math.floor(percent / 17) + 1]

    utils.setHl("StatusPercent", {
        fg = colors.black1,
        bg = color,
        bold = true,
    })

    utils.setHl("StatusPercentSep", {
        bg = colors.black1,
        fg = color,
    })

    percent = percent .. "%%"

    if percent == "0%%" then
        percent = "top"
    elseif percent == "100%%" then
        percent = "bot"
    end

    if #percent < 3 then
        percent = (" "):rep(3 - #percent) .. percent
    end

    return secBasic("StatusPercentSep", "StatusPercent", percent)
end

local function lsp()
    local server = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
    local name = ""
    if server == {} or server[1] == nil then
        name = "n/a"
    else
        name = server[1].name
    end

    local _, color = devicons.get_icon_color_by_filetype(vim.o.filetype)

    utils.setHl("StatusLsp", {
        fg = color or colors.blue,
        bg = colors.black3,
        bold = true,
    })

    return sec("StatusBasicSep", {
        hl("StatusLsp"),
        " ",
        name,
    })
end

local function cwd()
    local shortern = {
        { path = "D:\\OneDrive\\Desktop\\Code", short = " code", color = colors.yellow },
        { path = "D:\\OneDrive\\Desktop", short = " desktop", color = colors.orange },
        { path = "C:\\Users\\nphuy\\AppData\\Local\\nvim", short = " nvim", color = colors.green },
        { path = "C:\\Users\\nphuy", short = "home", color = colors.blue },
    }

    local path = vim.fn.getcwd()
    for _, p in ipairs(shortern) do
        if path:starts(p.path) then
            path = path:gsub(p.path, p.short)

            utils.setHl("StatusCwd", { fg = colors.black1, bg = p.color, bold = true })
            utils.setHl("StatusCwdSep", { bg = colors.black1, fg = p.color })
            break
        end
    end

    return secBasic("StatusCwdSep", "StatusCwd", "cwd: " .. (#path >= 40 and "..." or "") .. path:sub(-80))
end

local function altFile()
    local file = vim.fn.expand("#:t")
    local icon, color = devicons.get_icon_color(file)

    if icon then
        icon = icon .. " "
    else
        icon = ""
    end

    color = color or colors.blue

    utils.setHl("StatusAltFile", {
        fg = color,
        bg = colors.black3,
    })

    utils.setHl("StatusAltFileSep", {
        fg = colors.black3,
        bg = colors.black1,
    })

    local out = (" %s%s"):format(icon, file)

    if #out == 1 then
        out = " [no name]"
    end

    return secBasic("StatusAltFileSep", "StatusAltFile", "alt:" .. out)
end

local function plugin()
    local stats = require("lazy").stats()
    return secBasic("StatusPluginSep", "StatusPlugin", (" %s/%s"):format(stats.loaded, stats.count))
end

local function git()
    local status = vim.b.gitsigns_status_dict

    if not status then
        return ""
    end

    local out = secBasic("StatusBranchSep", "StatusBranch", " " .. (status.head == "" and "n/a" or status.head))
        .. " "

    if (status.changed or 0) > 0 then
        out = out .. secBasic("StatusChangeSep", "StatusChange", "~" .. status.changed) .. " "
    end
    if (status.added or 0) > 0 then
        out = out .. secBasic("StatusAddSep", "StatusAdd", "+" .. status.added) .. " "
    end
    if (status.removed or 0) > 0 then
        out = out .. secBasic("StatusRemoveSep", "StatusRemove", "-" .. status.removed) .. " "
    end

    return out
end

local function lsplines()
    return (vim.g.lspLines and secBasic("StatusLspLineSep", "StatusLspLine", "lsp lines") or "")
end

local function activeWin(active)
    -- count the non floating window
    -- and hide the indicator is there only 1 window
    if #vim.fn.eval("filter(nvim_list_wins(), {k,v->nvim_win_get_config(v).relative == ''})") == 1 then
        return ""
    end
    return active and secBasic("StatusActiveSep", "StatusActive", "")
        or secBasic("StatusInactiveSep", "StatusInactive", "")
end

function MkStatus()
    return table
        .concat({
            mode(),
            git(),
            cwd(),
            "%=",
            lsplines(),
            plugin(),
            secBasic("StatusZoomSep", "StatusZoom", ("󰍉 %s"):format(vim.g.neovide_scale_factor * 100) .. "%%"),
            locPercent(),
            secBasic("StatusModeSep", "StatusMode", utils.evalStatus("%4.c:%-4.l")),
        }, " ")
        :gsub("(%%%*)%s%s(%%#%w+#)", "%1 %2")
        :gsub("^%s*(.-)%s*$", "%1") -- remove spaces from skipped module
end

function MkWinbar(active)
    local left = table.concat({
        activeWin(active),
        lsp(),
        diagnostics(),
    }, " ")

    local space = vim.api.nvim_win_get_width(0) / 2 - math.ceil(fileName():stLen() / 2) - left:stLen()

    return table
        .concat({
            left,
            (" "):rep(space), -- center sep
            fileName(),
            "%=",
            activeWin(active),
        }, " ")
        :gsub("^%s*(.-)%s*$", "%1")
end

vim.o.laststatus = 3
vim.o.statusline = "%!v:lua.MkStatus()"

utils.createAugroup("Winbar", {})

utils.createAutocmd({ "WinEnter", "BufEnter" }, {
    pattern = "*",
    callback = function()
        if vim.api.nvim_win_get_config(0).relative == "" then
            vim.opt_local.winbar = "%{%v:lua.MkWinbar(v:true)%}"
        end
    end,
})
utils.createAutocmd({ "WinLeave", "BufLeave" }, {
    pattern = "*",
    callback = function()
        if vim.api.nvim_win_get_config(0).relative == "" then
            vim.opt_local.winbar = "%{%v:lua.MkWinbar(v:false)%}"
        end
    end,
})
