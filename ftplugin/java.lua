vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.expandtab = true

local is_java_present, java = pcall(require, 'java');
if is_java_present then
    java.setup()
end

local is_lspconfig_present, lspconfig = pcall(require, 'lspconfig');

local is_lsphandlers_present, lsp_handlers = pcall(require, 'plugins.lsp.handlers');
if is_lspconfig_present then
    if is_lsphandlers_present then
        lspconfig.jdtls.setup({
            on_attach = lsp_handlers.on_attach,
            capabilities = lsp_handlers.capabilities,
        })
    else
        lspconfig.jdtls.setup({})
    end
end

local is_jdtls_present, jdtls = pcall(require, 'jdtls');
if is_jdtls_present then
    local config = {
        cmd = { vim.fs.expand('~/.local/share/nvim/mason/packages/jdtls') },
        root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    }

    jdtls.start_or_attach(config)
end
