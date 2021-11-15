local lspconfig = require "lspconfig"
local configs = require "lspconfig/configs"

local on_attach = require("plugins.configs.lsp_servers.on_attach")
local capabilities = require("plugins.configs.lsp_servers.capabilities")

if not lspconfig.emmet_language_server then
    configs.emmet_language_server = {
        default_config = {
            cmd = {"emmet-language-server", "--stdio"},
            filetypes = {
                "html",
                "typescriptreact",
                "javascriptreact",
                "javascript",
                "typescript",
                "javascript.jsx",
                "typescript.tsx",
                "css"
            },
            root_dir = function(fname)
                return vim.loop.cwd()
            end,
            settings = {}
        }
    }
end
lspconfig.emmet_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150
    }
}
