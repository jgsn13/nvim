return {
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				mode = "n",
				silent = true,
				desc = "Dismiss all Notifications",
			},
		},
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
		init = function()
			local status_ok, notify = pcall(require, "notify")
			if not status_ok then
				return
			end

			vim.notify = notify
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			-- char = "▏",
			char = "│",
			filetype_exclude = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"lazy",
				"mason",
			},
			show_trailing_blankline_indent = false,
			show_current_context = false,
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
			},
			messages = {
				enabled = false,
			},
			notify = {
				enabled = true,
			},
		},
		keys = {
			-- stylua: ignore start
			{ "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
			{ "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
			{ "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
			{ "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
			{ "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
			{ "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = { "i", "n", "s", } },
			{ "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = { "i", "n", "s", } },
			-- stylua: ignore end
		},
	},
	{ "MunifTanjim/nui.nvim", lazy = true },
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		init = function()
			local present, icons = pcall(require, "nvim-web-devicons")
			if not present then
				return
			end

			icons.setup({
				override = {
					["spec.ts"] = {
						icon = "",
						color = "#0288D1",
						name = "typescripttest",
					},
					["test.ts"] = {
						icon = "",
						color = "#0288D1",
						name = "typescripttest",
					},
					txt = {
						icon = "",
						color = "#74c2c9",
						name = "text",
					},
					asm = {
						icon = "",
						color = "#C596C7",
						name = "assembly",
					},
					s = {
						icon = "",
						color = "#C596C7",
						name = "assembly",
					},
				},
			})
		end,
	},
}
