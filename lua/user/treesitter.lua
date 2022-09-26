local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
	return
end

treesitter.setup({
	ensure_installed = {
		"typescript",
		"lua",
		"javascript",
		"json",
		"rust",
		"python",
		"c",
		"cpp",
		"yaml",
	},
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	indent = {
		enable = true,
		disable = { "yaml" },
	},
	autotag = {
		enable = true,
		filetypes = {
			"html",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"svelte",
			"vue",
		},
	},
	rainbow = {
		enable = true,
		extended_mode = true,
	},
})
