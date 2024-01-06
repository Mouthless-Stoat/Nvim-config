local utils = require("helper.utils")

utils.createAugroup("Editor", {})

utils.createAutocmd("BufWritePre", {
    pattern = "*",
    group = "Editor",
    callback = function(args)
        require("conform").format({ bufnr = args.buf, timeout_ms = 5000 })
    end,
}) -- format when save

-- md formating
utils.createAutocmd("BufEnter", {
    pattern = "*.md",
    group = "Editor",
    callback = function()
        vim.bo.syntax = "markdown"
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
    end,
})

utils.createAutocmd("InsertEnter", {
    pattern = "*",
    group = "Editor",
    callback = function()
        if vim.fn.line("$") <= 2000 then
            return
        end
        vim.cmd("TSBufDisable highlight")
    end,
})

utils.createAutocmd("InsertLeave", {
    pattern = "*",
    group = "Editor",
    callback = function()
        if vim.fn.line("$") <= 2000 then
            return
        end
        vim.cmd("TSBufEnable highlight")
    end,
})

-- utils.createAutocmd("BufEnter", {
--     callback = function()
--         if vim.bo.filetype == "uiua" then
--             vim.opt.gfn = "Uiua386:h9:#h-none" -- uiua font
--         else
--             vim.opt.gfn = "CaskaydiaCove Nerd Font Mono:h9:#h-none" --set font and size
--         end
--     end,
-- })
-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(args)
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--         client.server_capabilities.semanticTokensProvider = nil
--     end,
-- })
