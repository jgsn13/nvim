local lsp_installer = require("nvim-lsp-installer")
local on_attach = require("plugins.configs.lsp_servers.on_attach")
local capabilities = require("plugins.configs.lsp_servers.capabilities")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(
    function(server)
        local opts = {
            on_attach = on_attach,
            capabilities = capabilities,
            flags = {
                debounce_text_changes = 150
            }
        }

        -- Lua
        if server.name == "sumneko_lua" then
            opts.settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = "LuaJIT",
                        -- Setup your lua path
                        path = runtime_path
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = {"vim"}
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true)
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {
                        enable = false
                    }
                }
            }
        end

        -- Typescript/Javascript
        if server.name == "tsserver" then
            opts.filetypes = {
                "javascript",
                "javascriptreact",
                "javascript.jsx",
                "typescript",
                "typescriptreact",
                "typescript.tsx"
            }
        end

        -- Python
        if server.name == "pyright" or server.name == "jedi_language_server" or server.name == "pylsp" then
            opts.root_dir = require "lspconfig".util.root_pattern(".git") or vim.fn.getcwd()
        end

        -- Php
        if server.name == "intelephense" then
            opts.root_dir = require "lspconfig".util.root_pattern(".git") or vim.fn.getcwd()
        end

        -- Java
        if server.name == "jdtls" then
            opts.root_dir = function(fname)
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
        end

        if server.name == "rust_analyzer" then
            require "plugins.configs.rust_tools"
        end

        -- This setup() function will take the provided server configuration and decorate it with the necessary properties
        -- before passing it onwards to lspconfig.
        -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        server:setup(opts)
    end
)

lsp_installer.settings(
    {
        ui = {
            icons = {
                server_installed = "✓",
                server_pending = "➜",
                server_uninstalled = "✗"
            },
            keymaps = {
                -- Keymap to expand a server in the UI
                toggle_server_expand = "<CR>",
                -- Keymap to install a server
                install_server = "i",
                -- Keymap to reinstall/update a server
                update_server = "u",
                -- Keymap to update all installed servers
                update_all_servers = "U",
                -- Keymap to uninstall a server
                uninstall_server = "X"
            }
        }
    }
)
