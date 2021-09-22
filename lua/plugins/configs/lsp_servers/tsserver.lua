local on_attach = require("plugins.configs.lsp_servers.on_attach")
local capabilities = require("plugins.configs.lsp_servers.capabilities")

require "lspconfig".tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
       debounce_text_changes = 150,
    },
}
