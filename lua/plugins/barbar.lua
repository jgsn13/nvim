return {
	"romgrk/barbar.nvim",
	dependencies = {
		"nvim-web-devicons",
	},
	config = function()
		local status_ok, bufferline = pcall(require, "bufferline")
		if not status_ok then
			return
		end

		bufferline.setup({
			-- Enable/disable animations
			animation = true,
			-- Enable/disable auto-hiding the tab bar when there is a single buffer
			auto_hide = false,
			-- Enable/disable current/total tabpages indicator (top right corner)
			tabpages = true,
			-- Enable/disable close button
			closable = true,
			-- Enables/disable clickable tabs
			--  - left-click: go to buffer
			--  - middle-click: delete buffer
			clickable = true,
			-- Enables / disables diagnostic symbols
			diagnostics = {
				-- you can use a list
				{ enabled = true, icon = "ﬀ " }, -- ERROR
				{ enabled = false }, -- WARN
				{ enabled = false }, -- INFO
				{ enabled = true }, -- HINT

				-- OR `vim.diagnostic.severity`
				[vim.diagnostic.severity.ERROR] = {
					enabled = true,
					icon = "ﬀ",
				},
				[vim.diagnostic.severity.WARN] = { enabled = false },
				[vim.diagnostic.severity.INFO] = { enabled = false },
				[vim.diagnostic.severity.HINT] = { enabled = true },
			},
			-- Excludes buffers from the tabline
			-- exclude_ft = { "javascript" },
			-- exclude_name = { "package.json" },
			-- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
			-- hide = { extensions = true, inactive = true },
			-- Disable highlighting alternate buffers
			highlight_alternate = false,
			-- Disable highlighting file icons in inactive buffers
			highlight_inactive_file_icons = false,
			-- Enable highlighting visible buffers
			highlight_visible = true,
			-- Enable/disable icons
			-- if set to 'numbers', will show buffer index in the tabline
			-- if set to 'both', will show buffer index and icons in the tabline
			icons = true,
			-- If set, the icon color will follow its corresponding buffer
			-- highlight group. By default, the Buffer*Icon group is linked to the
			-- Buffer* group (see Highlighting below). Otherwise, it will take its
			-- default value as defined by devicons.
			icon_custom_colors = false,
			-- Configure icons on the bufferline.
			icon_separator_active = "▎",
			icon_separator_inactive = "▎",
			icon_close_tab = "",
			icon_close_tab_modified = "●",
			icon_pinned = "車",
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
			-- New buffer letters are assigned in this order. This order is
			-- optimal for the qwerty keyboard layout but might need adjustement
			-- for other layouts.
			letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
			-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
			-- where X is the buffer number. But only a static string is accepted here.
			no_name_title = "No name",
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
