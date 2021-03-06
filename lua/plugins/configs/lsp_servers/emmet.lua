local lspconfig = require "lspconfig"

local on_attach = require("plugins.configs.lsp_servers.on_attach")
local capabilities = require("plugins.configs.lsp_servers.capabilities")

lspconfig.emmet_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"html", "css", "javascript"},
    flags = {
        debounce_text_changes = 150
    }
}
