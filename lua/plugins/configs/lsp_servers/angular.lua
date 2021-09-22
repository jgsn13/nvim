local on_attach = require("plugins.configs.lsp_servers.on_attach")
local capabilities = require("plugins.configs.lsp_servers.capabilities")

local project_library_path = "/usr/lib/node_modules/@angular/language-server/index.js"
local cmd = {
    "ngserver",
    "--stdio",
    "--tsProbeLocations",
    project_library_path,
    "--ngProbeLocations",
    project_library_path
}

require "lspconfig".angularls.setup {
    cmd = cmd,
    on_new_config = function(new_config, new_root_dir)
        new_config.cmd = cmd
    end,
    root_dir = require "lspconfig".util.root_pattern("angular.json") or vim.fn.getcwd(),
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150
    }
}
