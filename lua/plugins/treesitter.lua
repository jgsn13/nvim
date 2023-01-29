return
	{
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
			{ "<A-h>", ":foldclose<CR>", desc = "Fold Close", mode = "n" },
			{ "<A-l>", ":foldopen<CR>", desc = "Fold Open", mode = "n" },
			{ "<A-h>", ":foldclose<CR>", desc = "Fold Close", mode = "v" },
			{ "<A-l>", ":foldopen<CR>", desc = "Fold Open", mode = "v" },
		},
		config = function()
			local present, treesitter =
				pcall(require, "nvim-treesitter.configs")
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

			local status_ok, indent_blankline =
				pcall(require, "indent_blankline")
			if not status_ok then
				return
			end

			vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
			vim.g.indent_blankline_filetype_exclude = {
				"help",
				"startify",
				"dashboard",
				"packer",
				"neogitstatus",
				"NvimTree",
				"Trouble",
			}
			vim.g.indentLine_enabled = 1
			-- vim.g.indent_blankline_char = "│"
			vim.g.indent_blankline_char = "▏"
			-- vim.g.indent_blankline_char = "▎"
			vim.g.indent_blankline_show_trailing_blankline_indent = false
			vim.g.indent_blankline_show_first_indent_level = true
			vim.g.indent_blankline_use_treesitter = true
			vim.g.indent_blankline_show_current_context = true
			vim.g.indent_blankline_context_patterns = {
				"class",
				"return",
				"function",
				"method",
				"^if",
				"^while",
				"jsx_element",
				"^for",
				"^object",
				"^table",
				"block",
				"arguments",
				"if_statement",
				"else_clause",
				"jsx_element",
				"jsx_self_closing_element",
				"try_statement",
				"catch_clause",
				"import_statement",
				"operation_type",
			}
			-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
			vim.wo.colorcolumn = "99999"

			-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
			-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
			-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
			-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
			-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
			-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
			-- vim.opt.list = true
			-- vim.opt.listchars:append "space:⋅"
			-- vim.opt.listchars:append "space:"
			-- vim.opt.listchars:append "eol:↴"

			indent_blankline.setup({
				-- show_end_of_line = true,
				-- space_char_blankline = " ",
				show_current_context = true,
				-- show_current_context_start = true,
				-- char_highlight_list = {
				--   "IndentBlanklineIndent1",
				--   "IndentBlanklineIndent2",
				--   "IndentBlanklineIndent3",
				-- },
			})
		end,
	}
