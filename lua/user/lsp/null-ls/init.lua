local present, null_ls = pcall(require, "null-ls")
if not present then
	return
end

-- local formatting = null_ls.builtins.formatting
-- local formatting_settings = require("user.lsp.null-ls.formatting")

local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		-- Formatting settings
		-- formatting.prettier.with(formatting_settings.prettier),
		-- formatting.rustfmt.with(formatting_settings.rustfmt),
		-- formatting.stylua.with(formatting_settings.stylua),
		-- formatting.clang_format.with(formatting_settings.clang_format),
		-- formatting.black.with(formatting_settings.black),

		-- DIagnostics
		diagnostics.eslint,
		diagnostics.flake8,
		diagnostics.pylint,
	},
})

-- KEYMAP("n", "<Leader>f", ":Format<cr>", OPTS)
