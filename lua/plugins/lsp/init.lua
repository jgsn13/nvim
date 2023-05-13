return {
	"neovim/nvim-lspconfig", -- enable LSP
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
		"j-hui/fidget.nvim",
	},
	init = function()
		local lspconfig_present, _ = pcall(require, "lspconfig")
		if not lspconfig_present then
			return
		end

		require("plugins.lsp.handlers").setup()
		require("plugins.lsp.mason")
		require("plugins.lsp.null-ls")
		require("fidget").setup()
	end,
}
