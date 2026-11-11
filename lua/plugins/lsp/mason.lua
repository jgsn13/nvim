local mason_present, mason = pcall(require, "mason")
if not mason_present then
    return
end

local mason_lspconfig_present, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_present then
    return
end

mason.setup({
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

local handlers = require("plugins.lsp.handlers")

-- Neovim 0.12+ native LSP configuration (replaces deprecated require('lspconfig') framework)
vim.lsp.config("*", {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
})

local ok_lua, lua_ls_opts = pcall(require, "plugins.lsp.settings.lua_ls")
if ok_lua and lua_ls_opts then
    vim.lsp.config("lua_ls", lua_ls_opts)
end

local ok_ts, ts_ls_opts = pcall(require, "plugins.lsp.settings.ts_ls")
if ok_ts and ts_ls_opts then
    vim.lsp.config("ts_ls", ts_ls_opts)
end

local ok_json, jsonls_opts = pcall(require, "plugins.lsp.settings.jsonls")
if ok_json and jsonls_opts then
    vim.lsp.config("jsonls", jsonls_opts)
end

local ok_py, pyright_opts = pcall(require, "plugins.lsp.settings.pyright")
if ok_py and pyright_opts then
    vim.lsp.config("pyright", pyright_opts)
end

mason_lspconfig.setup({
    ensure_installed = { "lua_ls", "ts_ls" },
    automatic_installation = false,
    automatic_enable = {
        exclude = { "stylua", "jdtls" },
    },
})
