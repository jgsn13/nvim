local configs_status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not configs_status_ok then
	return
end

configs.setup({
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
		"vue",
	},
	sync_install = false,
	ignore_install = {}, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		-- disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true, disable = { "yaml" } },
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
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})
