return {
	"romgrk/barbar.nvim",
	dependencies = {
		"nvim-web-devicons",
	},
	config = function()
		local status_ok, barbar = pcall(require, "barbar")
		if not status_ok then
			return
		end

		barbar.setup({
			-- WARN: do not copy everything below into your config!
			--       It is just an example of what configuration options there are.
			--       The defaults are suitable for most people.

			-- Enable/disable animations
			animation = true,

			-- Enable/disable auto-hiding the tab bar when there is a single buffer
			auto_hide = false,

			-- Enable/disable current/total tabpages indicator (top right corner)
			tabpages = true,

			-- Enables/disable clickable tabs
			--  - left-click: go to buffer
			--  - middle-click: delete buffer
			clickable = true,

			-- Excludes buffers from the tabline
			exclude_ft = { "javascript" },
			exclude_name = { "package.json" },

			-- A buffer to this direction will be focused (if it exists) when closing the current buffer.
			-- Valid options are 'left' (the default) and 'right'
			focus_on_close = "left",

			-- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
			hide = { extensions = true, inactive = true },

			-- Disable highlighting alternate buffers
			highlight_alternate = false,

			-- Disable highlighting file icons in inactive buffers
			highlight_inactive_file_icons = false,

			-- Enable highlighting visible buffers
			highlight_visible = true,

			icons = {
				-- Configure the base icons on the bufferline.
				buffer_index = false,
				buffer_number = false,
				button = "",
				-- Enables / disables diagnostic symbols
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = {
						enabled = true,
						icon = "ﬀ",
					},
					[vim.diagnostic.severity.WARN] = { enabled = false },
					[vim.diagnostic.severity.INFO] = { enabled = false },
					[vim.diagnostic.severity.HINT] = { enabled = true },
				},
				filetype = {
					-- Sets the icon's highlight group.
					-- If false, will use nvim-web-devicons colors
					custom_colors = false,

					-- Requires `nvim-web-devicons` if `true`
					enabled = true,
				},
				separator = { left = "▎", right = "" },

				-- Configure the icons on the bufferline when modified or pinned.
				-- Supports all the base icon options.
				modified = { button = "●" },
				pinned = {
					button = "車",
					filename = true,
					separator = { right = "" },
				},

				-- Configure the icons on the bufferline based on the visibility of a buffer.
				-- Supports all the base icon options, plus `modified` and `pinned`.
				alternate = { filetype = { enabled = false } },
				current = { buffer_index = true },
				inactive = { button = "×" },
				visible = { modified = { buffer_number = false } },
			},

			-- If true, new buffers will be inserted at the start/end of the list.
			-- Default is to insert after current buffer.
			insert_at_end = false,
			insert_at_start = false,

			-- Sets the maximum padding width with which to surround each tab
			maximum_padding = 1,

			-- Sets the minimum padding width with which to surround each tab
			minimum_padding = 1,

			-- Sets the maximum buffer name length.
			maximum_length = 30,

			-- If set, the letters for each buffer in buffer-pick mode will be
			-- assigned based on their name. Otherwise or in case all letters are
			-- already assigned, the behavior is to assign letters in order of
			-- usability (see order below)
			semantic_letters = true,

			-- Set the filetypes which barbar will offset itself for
			sidebar_filetypes = {
				-- Use the default values: {event = 'BufWinLeave', text = nil}
				NvimTree = true,
				-- Or, specify the text used for the offset:
				undotree = { text = "undotree" },
				-- Or, specify the event which the sidebar executes when leaving:
				["neo-tree"] = { event = "BufWipeout" },
				-- Or, specify both
				Outline = { event = "BufWinLeave", text = "symbols-outline" },
			},

			-- New buffer letters are assigned in this order. This order is
			-- optimal for the qwerty keyboard layout but might need adjustement
			-- for other layouts.
			letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",

			-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
			-- where X is the buffer number. But only a static string is accepted here.
			no_name_title = nil,
		})

		-- Move to previous/next
		KEYMAP("n", "<A-,>", "<Cmd>BufferPrevious<CR>", OPTS)
		KEYMAP("n", "<A-.>", "<Cmd>BufferNext<CR>", OPTS)
		-- Re-order to previous/next
		KEYMAP("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", OPTS)
		KEYMAP("n", "<A->>", "<Cmd>BufferMoveNext<CR>", OPTS)
		-- Goto buffer in position...
		KEYMAP("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", OPTS)
		KEYMAP("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", OPTS)
		KEYMAP("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", OPTS)
		KEYMAP("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", OPTS)
		KEYMAP("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", OPTS)
		KEYMAP("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", OPTS)
		KEYMAP("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", OPTS)
		KEYMAP("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", OPTS)
		KEYMAP("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", OPTS)
		KEYMAP("n", "<A-0>", "<Cmd>BufferLast<CR>", OPTS)
		-- Pin/unpin buffer
		KEYMAP("n", "<A-p>", "<Cmd>BufferPin<CR>", OPTS)
		-- Close buffer
		KEYMAP("n", "<A-c>", "<Cmd>BufferClose<CR>", OPTS)
		-- Wipeout buffer
		--                 :BufferWipeout
		-- Close commands
		--                 :BufferCloseAllButCurrent
		--                 :BufferCloseAllButPinned
		--                 :BufferCloseAllButCurrentOrPinned
		--                 :BufferCloseBuffersLeft
		--                 :BufferCloseBuffersRight
		-- Magic buffer-picking mode
		KEYMAP("n", "<C-p>", "<Cmd>BufferPick<CR>", OPTS)
		-- Sort automatically by...
		KEYMAP("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", OPTS)
		KEYMAP("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", OPTS)
		KEYMAP("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", OPTS)
		KEYMAP("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", OPTS)

		-- Other:
		-- :BarbarEnable - enables barbar (enabled by default)
		-- :BarbarDisable - very bad command, should never be used
	end,
}
