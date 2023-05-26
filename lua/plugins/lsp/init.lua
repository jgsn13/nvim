return {
    "neovim/nvim-lspconfig", -- enable LSP
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
        "folke/neodev.nvim",
        {
            "jay-babu/mason-null-ls.nvim",
            event = { "BufReadPre", "BufNewFile" },
            dependencies = {
                "williamboman/mason.nvim",
                "jose-elias-alvarez/null-ls.nvim",
            },
            config = function()
                require("plugins.lsp.null-ls")
            end,
        },
    },
    init = function()
        local lspconfig_present, _ = pcall(require, "lspconfig")
        if not lspconfig_present then
            return
        end

        local neodev_present, neodev = pcall(require, "neodev")
        if neodev_present then
            neodev.setup()
        end

        require("plugins.lsp.handlers").setup()
        require("plugins.lsp.mason")
    end,
}
