local on_attach = require("plugins.configs.lsp_servers.on_attach")
local capabilities = require("plugins.configs.lsp_servers.capabilities")

require("lspconfig").vuels.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
       debounce_text_changes = 150,
    },
    filetypes = {"vue"},
    init_options = {
        config = {
            css = {
                enable = true
            },
            emmet = {
                enable = true
            },
            html = {
                suggest = {
                    enable = true
                }
            },
            javascript = {
                format = {}
            },
            stylusSupremacy = {},
            typescript = {
                format = {
                    enable = true
                }
            },
            vetur = {
                completion = {
                    autoImport = true,
                    tagCasing = "camel",
                    useScaffoldSnippets = false
                },
                format = {
                    defaultFormatter = {
                        js = "eslint",
                        ts = "eslint"
                    },
                    defaultFormatterOptions = {},
                    scriptInitialIndent = true,
                    styleInitialIndent = true
                },
                useWorkspaceDependencies = true,
                validation = {
                    script = true,
                    style = true,
                    template = true
                }
            }
        }
    },
    root_dir = function()
        return "package.json"
    end
}
