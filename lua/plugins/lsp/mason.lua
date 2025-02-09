local lspconfig_present, lspconfig = pcall(require, "lspconfig")
if not lspconfig_present then
    return
end

local mason_present, mason = pcall(require, "mason")
if not mason_present then
    return
end

local mason_lspconfig_present, mason_lspconfig =
    pcall(require, "mason-lspconfig")
if not mason_lspconfig_present then
    return
end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {},
    automatic_installation = false,
    inlay_hints = { enable = true },
})

local opts = {
    on_attach = require("plugins.lsp.handlers").on_attach,
    capabilities = require("plugins.lsp.handlers").capabilities,
}

mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup(opts)
    end,
    ["lua_ls"] = function()
        local lua_ls_opts = require("plugins.lsp.settings.lua_ls")
        lspconfig.lua_ls.setup(lua_ls_opts)
    end,
    ["ts_ls"] = function()
        local ts_ls_opts = require("plugins.lsp.settings.ts_ls")
        lspconfig.ts_ls.setup(ts_ls_opts)
    end,
    ["jsonls"] = function()
        local jsonls_opts = require("plugins.lsp.settings.jsonls")
        lspconfig.jsonls.setup(jsonls_opts)
    end,
    ["pyright"] = function()
        local pyright_opts = require("plugins.lsp.settings.pyright")
        lspconfig.pyright.setup(pyright_opts)
    end,
})
