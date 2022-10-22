local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
	return
end

local options = {
	ensure_installed = {
		"lua",
		"typescript",
		"javascript",
		"tsx",
		"css",
		"scss",
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
}

options.rainbow = {
	enable = true,
	extended_mode = true,
}

options.autotag = {
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
}

options.context_commentstring = {
	enable = true,
}

treesitter.setup(options)

-- Setup folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 999

KEYMAP("n", "<A-h>", ":foldclose<CR>", OPTS)
KEYMAP("n", "<A-l>", ":foldopen<CR>", OPTS)
KEYMAP("v", "<A-h>", ":foldclose<CR>", OPTS)
KEYMAP("v", "<A-l>", ":foldopen<CR>", OPTS)
