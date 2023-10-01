return {
    on_attach = require("plugins.lsp.handlers").on_attach,
    capabilities = require("plugins.lsp.handlers").capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            -- workspace = {
            -- 	library = vim.api.nvim_get_runtime_file("", true),
            -- },
            telemetry = {
                enable = false,
            },
            completion = {
                callSnippet = "Replace",
            },
            hint = { enable = true },
        },
    },
}
