local on_attach = require("plugins.configs.lsp_servers.on_attach")
local capabilities = require("plugins.configs.lsp_servers.capabilities")

-- Install alongside https://github.com/eruizc-dev/jdtls-launcher
require "lspconfig".jdtls.setup {
    cmd = {"jdtls"},
    filetypes = {"java"},
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150
    },
    root_dir = function(fname)
        return require "lspconfig".util.root_pattern(
            "build.xml",
            "pom.xml",
            "settings.gradle",
            "settings.gradle.kts",
            "build.gradle",
            "build.gradle.kts",
            "gradle.build"
        )(fname) or vim.fn.getcwd()
    end
}
