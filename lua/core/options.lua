-- :help options
local options = {
	opt = {
		backup = false, -- creates a backup file
		clipboard = "unnamedplus", -- allows neovim to access the system clipboard
		cmdheight = 2, -- more space in the neovim command line for displaying messages
		completeopt = { "menuone", "noselect" }, -- mostly just for cmp
		conceallevel = 0, -- so that `` is visible in markdown files
		fileencoding = "utf-8", -- the encoding written to a file
		hlsearch = true, -- highlight all matches on previous search pattern
		ignorecase = true, -- ignore case in search patterns
		mouse = "a", -- allow the mouse to be used in neovim
		pumheight = 10, -- pop up menu height
		showmode = false, -- Disable showing modes in command line
		showtabline = 2, -- always show tabs
		smartcase = true, -- Case sensitivie searching
		smartindent = true, -- Smarter autoindentation
		splitbelow = true, -- force all horizontal splits to go below current window
		splitright = true, -- force all vertical splits to go to the right of current window
		swapfile = false, -- creates a swapfile
		termguicolors = true, -- set term gui colors (most terminals support this)
		timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
		undofile = true, -- enable persistent undo
		updatetime = 300, -- faster completion (4000ms default)
		writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
		expandtab = true, -- convert tabs to spaces
		shiftwidth = 2, -- the number of spaces inserted for each indentation
		tabstop = 2, -- insert 2 spaces for a tab
		cursorline = true, -- highlight the current line
		number = true, -- set numbered lines
		relativenumber = true, -- set relative numbered lines
		numberwidth = 4, -- set number column width to 2 {default 4}
		signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
		wrap = false, -- display lines as one long line
		scrolloff = 8, -- Number of lines to keep above and below the cursor
		sidescrolloff = 8, -- Number of columns to keep at the sides of the cursor
		-- guifont = "FiraCode NF:h10", -- the font used in graphical neovim applications
		-- guifontwide = "Noto Color Emoji",
		shortmess = "I",
		statuscolumn = "%l %r %s %T",
		breakindent = true, -- Wrap indent to match  line start
		copyindent = true, -- Copy the previous indentation on autoindenting
		fillchars = { eob = " " }, -- Disable `~` on nonexistent lines
		foldenable = true, -- enable fold for nvim-ufo
		foldlevel = 99, -- set high foldlevel for nvim-ufo
		foldlevelstart = 99, -- start with all code unfolded
		foldcolumn = vim.fn.has("nvim-0.9") == 1 and "1" or nil, -- show foldcolumn in nvim 0.9
		history = 100, -- Number of commands to remember in a history table
		infercase = true, -- Infer cases in keyword completion
		laststatus = 3, -- globalstatus
		linebreak = true, -- Wrap lines at 'breakat'
		preserveindent = true, -- Preserve indent structure as much as possible
		splitkeep = vim.fn.has("nvim-0.9") == 1 and "screen" or nil, -- Maintain code view when splitting
		virtualedit = "block", -- allow going past end of line in visual block mode
	},
	g = {
		highlighturl_enabled = true, -- highlight URLs by default
		mapleader = " ", -- set leader key
		autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
		codelens_enabled = true, -- enable or disable automatic codelens refreshing for lsp that support it
		lsp_handlers_enabled = true, -- enable or disable default vim.lsp.handlers (hover and signatureHelp)
		cmp_enabled = true, -- enable completion at start
		autopairs_enabled = true, -- enable autopairs at start
		diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
		icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available)
		ui_notifications_enabled = true, -- disable notifications when toggling UI elements
		loaded_netrw = false,
		loaded_netrwPlugin = false,
	},
	t = { bufs = vim.api.nvim_list_bufs() }, -- initialize buffers for the current tab
}

for scope, table in pairs(options) do
	for setting, value in pairs(table) do
		vim[scope][setting] = value
	end
end

vim.g.editorconfig = true
