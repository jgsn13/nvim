local on_attach = require("plugins.configs.lsp_servers.on_attach")
local capabilities = require("plugins.configs.lsp_servers.capabilities")

-- require("jdtls").start_or_attach {
--     cmd = {"launch_jdtls"},
--     capabilities = CAPABILITIES,
--     on_attach = ON_ATTACH,
--     root_dir = require("jdtls.setup").find_root(
--         {
--             "gradle.build",
--             "pom.xml",
--             "build.xml",
--             "settings.gradle",
--             "settings.gradle.kts",
--             "build.gradle",
--             "build.gradle.kts"
--         }
--     )
-- }

vim.api.nvim_set_keymap("n", "<leader>la", ":lua require('jdtls').code_action()<CR>", {noremap = true, silent = true})

require "lspconfig".jdtls.setup {
    cmd = {"launch_jdtls"},
    filetypes = {"java"},
    root_dir = require "lspconfig".util.root_pattern(
        "build.xml",
        "pom.xml",
        "settings.gradle",
        "settings.gradle.kts",
        "build.gradle",
        "build.gradle.kts"
    ) or vim.fn.getcwd(),
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
       debounce_text_changes = 150,
    },
}
