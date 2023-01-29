return {
	"kyazdani42/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- optional, for file icons
	},
	keys = {
		{
			"<C-n>",
			":NvimTreeToggle<cr>",
			desc = "NvimTree",
		},
	},
	config = function()
		local status_ok, nvim_tree = pcall(require, "nvim-tree")
		if not status_ok then
			return
		end

		local config_status_ok, nvim_tree_config =
			pcall(require, "nvim-tree.config")
		if not config_status_ok then
			return
		end

		local tree_cb = nvim_tree_config.nvim_tree_callback
		nvim_tree.setup({
			disable_netrw = true,
			hijack_netrw = true,
			open_on_setup = false,
			ignore_ft_on_setup = {
				"startify",
				"dashboard",
				"alpha",
			},
			open_on_tab = false,
			hijack_cursor = false,
			update_cwd = true,
			hijack_directories = {
				enable = true,
				auto_open = true,
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
			update_focused_file = {
				enable = true,
				update_cwd = true,
				ignore_list = {},
			},
			git = {
				enable = true,
				ignore = true,
				show_on_dirs = true,
				show_on_open_dirs = true,
				timeout = 200,
			},
			filesystem_watchers = {
				enable = true,
			},
			view = {
				adaptive_size = true,
				width = 25,
				hide_root_folder = true,
				side = "left",
				mappings = {
					custom_only = false,
					list = {
						{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
						{ key = "h", cb = tree_cb("close_node") },
						{ key = "v", cb = tree_cb("vsplit") },
					},
				},
				number = false,
				relativenumber = false,
				signcolumn = "yes",
			},
			actions = {
				open_file = {
					quit_on_open = false,
					resize_window = false,
				},
			},
			renderer = {
				highlight_git = true,
				root_folder_label = ":~:s?$?/..?",
				indent_width = 4,
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
					webdev_colors = true,
					git_placement = "after",
					padding = " ",
					symlink_arrow = " ➛ ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
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
			filters = {
				dotfiles = false,
				custom = { "node_modules", "\\.cache" },
				exclude = {},
			},
		})

		-- vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#E0AF68" })
	end,
}
