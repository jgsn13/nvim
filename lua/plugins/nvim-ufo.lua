return {
	"kevinhwang91/nvim-ufo", -- Easily comment stuff
	dependencies = {
		"kevinhwang91/promise-async",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local status_ok, ufo = pcall(require, "ufo")
		if not status_ok then
			return
		end

		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		-- Using ufo provider need remap `zR` and `zM`
		KEYMAP("n", "zR", ufo.openAllFolds)
		KEYMAP("n", "zM", ufo.closeAllFolds)

		ufo.setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		})
	end,
}
