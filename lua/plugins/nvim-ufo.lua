return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		"luukvbaal/statuscol.nvim",
	},
	event = "VeryLazy",
	keys = {
		{
			"<A-h>",
			":foldclose<CR>",
			mode = "n",
			silent = true,
			desc = "Fold close",
		},
		{
			"<A-l>",
			":foldopen<CR>",
			mode = "n",
			silent = true,
			desc = "Fold open",
		},
	},
	opts = {
		preview = {
			mappings = {
				scrollB = "<C-b>",
				scrollF = "<C-f>",
				scrollU = "<C-u>",
				scrollD = "<C-d>",
			},
		},
		provider_selector = function(_, filetype, buftype)
			local function handleFallbackException(bufnr, err, providerName)
				if
					type(err) == "string" and err:match("UfoFallbackException")
				then
					return require("ufo").getFolds(bufnr, providerName)
				else
					return require("promise").reject(err)
				end
			end

			return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
				or function(bufnr)
					return require("ufo")
						.getFolds(bufnr, "lsp")
						:catch(function(err)
							return handleFallbackException(
								bufnr,
								err,
								"treesitter"
							)
						end)
						:catch(function(err)
							return handleFallbackException(bufnr, err, "indent")
						end)
				end
		end,
	},
	init = function()
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
	end,
}
