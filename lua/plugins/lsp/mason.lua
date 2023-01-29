local present, lspconfig = pcall(require, "lspconfig")

if not present then
	return
end

local present1, mason = pcall(require, "mason")
if not present1 then
	return
end

local present2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not present2 then
	return
end

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {},
	automatic_installation = false,
})

local opts = {
	on_attach = require("plugins.lsp.handlers").on_attach,
	capabilities = require("plugins.lsp.handlers").capabilities,
}

mason_lspconfig.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup(opts)
	end,
	["sumneko_lua"] = function()
		local sumneko_opts = require("plugins.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
		lspconfig.sumneko_lua.setup(opts)
	end,
	--[[ FIX: when setup tsserver all servers start at the same time to js/ts files ]]
	--[[ ["tsserver"] = function() ]]
	--[[ 	local tsserver_opts = require("plugins.lsp.settings.tsserver") ]]
	--[[ 	opts = vim.tbl_deep_extend("force", tsserver_opts, opts) ]]
	--[[ 	lspconfig.tsserver.setup(opts) ]]
	--[[ end, ]]
	["jsonls"] = function()
		local jsonls_opts = require("plugins.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
		lspconfig.jsonls.setup(opts)
	end,
	["pyright"] = function()
		local pyright_opts = require("plugins.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
		lspconfig.pyright.setup(opts)
	end,
})
