return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		{
			"lukas-reineke/indent-blankline.nvim",
			"p00f/nvim-ts-rainbow",
			"windwp/nvim-ts-autotag",
			-- "nvim-treesitter/nvim-treesitter-angular", -- this breaks treesitter
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
	keys = {
	    -- stylua: ignore
		{ "<A-h>", ":foldclose<CR>", mode = "n", silent = true, desc = "Fold Close" },
	    -- stylua: ignore
		{ "<A-l>", ":foldopen<CR>", mode = "n", silent = true, desc = "Fold Open" },
	    -- stylua: ignore
		{ "<A-h>", ":foldclose<CR>", mode = "n", silent = true, desc = "Fold Close" },
	    -- stylua: ignore
		{ "<A-l>", ":foldopen<CR>", mode = "n", silent = true, desc = "Fold Open" },
	},
	init = function()
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
	end,
}
