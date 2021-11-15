local on_attach = require("plugins.configs.lsp_servers.on_attach")
local capabilities = require("plugins.configs.lsp_servers.capabilities")

require "lspconfig".denols.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150
    },
    filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"},
    init_options = {
        enable = true,
        lint = true,
        unstable = false
    },
    root_dir = require "lspconfig".util.root_pattern("deno.json", "deno.jsonc", "package.json", "tsconfig.json", ".git")
}
