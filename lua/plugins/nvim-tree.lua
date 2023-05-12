return {
	"kyazdani42/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- optional, for file icons
	},
	keys = {
		{
			"<C-n>",
			":NvimTreeToggle<cr>",
			mode = "n",
			silent = true,
			desc = "NvimTree",
		},
	},
	config = function()
		local status_ok, nvim_tree = pcall(require, "nvim-tree")
		if not status_ok then
			return
		end

		nvim_tree.setup({
			filters = {
				dotfiles = false,
				exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
			},
			disable_netrw = true,
			hijack_netrw = true,
			hijack_cursor = true,
			hijack_unnamed_buffer_when_opening = false,
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
			},

			diagnostics = {
				enable = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			view = {
				adaptive_size = true,
				side = "left",
				width = 30,
				preserve_window_proportions = true,

				mappings = {
					list = {
						{
							key = { "l", "<CR>", "o" },
							action = "edit",
							mode = "n",
						},
						{ key = "h", action = "close_node" },
						{ key = "v", action = "vsplit" },
					},
				},
			},
			git = {
				enable = true,
				ignore = false,
			},
			filesystem_watchers = {
				enable = true,
			},
			actions = {
				open_file = {
					resize_window = false,
				},
			},
			renderer = {
				root_folder_label = false,
				highlight_git = true,
				highlight_opened_files = "none",

				indent_markers = {
					enable = false,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				},

				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = false,
					},
					glyphs = {
						default = "",
						symlink = "",
						bookmark = "",
						git = {
							unstaged = "",
							staged = "S",
							unmerged = "",
							renamed = "➜",
							deleted = "",
							untracked = "U",
							ignored = "◌",
						},
						folder = {
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
						},
					},
				},
			},
		})
	end,
}
