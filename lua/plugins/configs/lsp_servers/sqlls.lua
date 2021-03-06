local on_attach = require("plugins.configs.lsp_servers.on_attach")
local capabilities = require("plugins.configs.lsp_servers.capabilities")

require "lspconfig".sqlls.setup {
    cmd = {"sql-language-server", "up", "--method", "stdio"},
    filetypes = {"sql", "mysql", "sqlite"},
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = require "lspconfig".util.root_pattern("") or vim.fn.getcwd(),
    flags = {
        debounce_text_changes = 150
    }
}
