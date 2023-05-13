local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local formatting_settings = require("plugins.lsp.null-ls.formatting")

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	debug = false,
	sources = {
		-- Formatting
		formatting.prettier.with(formatting_settings.prettier),
		formatting.rustfmt.with(formatting_settings.rustfmt),
		formatting.stylua.with(formatting_settings.stylua),
		formatting.clang_format.with(formatting_settings.clang_format),
		formatting.black.with(formatting_settings.black),

		-- Diagnostics [https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#diagnostics]
		diagnostics.eslint, -- https://eslint.org/
		diagnostics.flake8, -- https://flake8.pycqa.org/en/latest/
		diagnostics.pylint, -- https://pypi.org/project/pylint/
		diagnostics.dotenv_linter, -- https://github.com/dotenv-linter/dotenv-linter
		diagnostics.editorconfig_checker, -- https://github.com/editorconfig-checker/editorconfig-checker
	},
	-- on_attach = function(client, bufnr)
	-- 	-- NOTE: format on save is actually not sync with <leader>f
	-- 	local client_names = { "lua_ls" }

	-- 	if client.supports_method("textDocument/formatting") then
	-- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	-- 		vim.api.nvim_create_autocmd("BufWritePre", {
	-- 			group = augroup,
	-- 			buffer = bufnr,
	-- 			callback = function()
	-- 				vim.lsp.buf.format({
	-- 					bufnr = bufnr,
	-- 					filter = function(lsp_client)
	-- 						for _, client_name in ipairs(client_names) do
	-- 							if lsp_client.name == client_name then
	-- 								return true
	-- 							end
	-- 						end

	-- 						return false
	-- 					end,
	-- 				})
	-- 			end,
	-- 		})
	-- 	end
	-- end,
})

KEYMAP("n", "<leader>f", vim.lsp.buf.format, OPTS)
