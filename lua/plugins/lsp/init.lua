return {
	"neovim/nvim-lspconfig", -- enable LSP
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
		"j-hui/fidget.nvim",
	},
	config = function()
		local status_ok, _ = pcall(require, "lspconfig")
		if not status_ok then
			return
		end

		require("plugins.lsp.handlers").setup()
		require("plugins.lsp.mason")
		require("plugins.lsp.null-ls")
		require("fidget").setup()
	end,
}
