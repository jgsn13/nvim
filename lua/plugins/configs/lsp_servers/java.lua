local function on_attach(_, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("i", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "<A-[>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "<A-]>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    -- Java (jdtls)
    -- `code_action` is a superset of vim.lsp.buf.code_action and you'll be able to
    -- use this mapping also with other language servers
    buf_set_keymap("n", "<space>ca", "<Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>", opts)
    buf_set_keymap("v", "<A-CR>", "<Esc><Cmd>lua require('jdtls').code_action(true)<CR>", opts)
    buf_set_keymap("n", "<A-CR>", "<Cmd>lua require('jdtls').code_action()<CR>", opts)
    buf_set_keymap("n", "<A-o>", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
    buf_set_keymap("n", "crv", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
    buf_set_keymap("v", "crv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
    buf_set_keymap("n", "crc", "<Cmd>lua require('jdtls').extract_constant()<CR>", opts)
    buf_set_keymap("v", "crc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", opts)
    buf_set_keymap("v", "crm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
    buf_set_keymap("n", "<leader>la", ":lua require('jdtls').code_action()<CR>", opts)

    -- If using nvim-dap
    -- This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
    require("jdtls").setup_dap({hotcodereplace = "auto"})
    buf_set_keymap("n", "<leader>df", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
    buf_set_keymap("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)

    vim.cmd [[command! -buffer JdtCompile lua require('jdtls').compile()]]
    vim.cmd [[command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()]]
    vim.cmd [[command! -buffer JdtJol lua require('jdtls').jol()]]
    vim.cmd [[command! -buffer JdtBytecode lua require('jdtls').javap()]]
    vim.cmd [[command! -buffer JdtJshell lua require('jdtls').jshell()]]

    vim.cmd [[command! Format execute 'lua vim.lsp.buf.formatting()']]
end

local capabilities = require("plugins.configs.lsp_servers.capabilities")

local bundles = {
    vim.fn.glob(
        "/home/joaquim/LangServers/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
    )
}

vim.list_extend(bundles, vim.split(vim.fn.glob("/home/joaquim/LangServers/vscode-java-test/server/*.jar"), "\n"))

-- require("jdtls").start_or_attach {
--     cmd = {"launch_jdtls"},
--     capabilities = capabilities,
--     on_attach = on_attach,
--     flags = {
--         debounce_text_changes = 150
--     },
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
--     ) or vim.fn.getcwd(),
--     init_options = {
--         bundles = bundles
--     }
-- }

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
        debounce_text_changes = 150
    },
    init_options = {
        bundles = bundles
    }
}
