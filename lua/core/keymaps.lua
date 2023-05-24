OPTS = { noremap = true, silent = true }

-- Shorten function name
KEYMAP = vim.keymap.set

-- Remap space as leader key
KEYMAP("", "<Space>", "<Nop>", OPTS)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
-- - normal_mode = "n",
-- - insert_mode = "i",
-- - visual_mode = "v",
-- - visual_block_mode = "x",
-- - term_mode = "t",
-- - command_mode = "c",

-- Normal --
-- Better window navigation
KEYMAP("n", "<C-h>", "<C-w>h", OPTS)
KEYMAP("n", "<C-j>", "<C-w>j", OPTS)
KEYMAP("n", "<C-k>", "<C-w>k", OPTS)
KEYMAP("n", "<C-l>", "<C-w>l", OPTS)

-- Resize with arrows
KEYMAP("n", "<C-Up>", ":resize +2<CR>", OPTS)
KEYMAP("n", "<C-Down>", ":resize -2<CR>", OPTS)
KEYMAP("n", "<C-Left>", ":vertical resize -2<CR>", OPTS)
KEYMAP("n", "<C-Right>", ":vertical resize +2<CR>", OPTS)

-- No highlight
KEYMAP("n", "<A-l>", ":noh<CR>", OPTS)

-- Navigate buffers
KEYMAP("n", "<S-l>", ":bnext<CR>", OPTS)
KEYMAP("n", "<S-h>", ":bprevious<CR>", OPTS)

-- Navigation within insert mode
KEYMAP("i", "<C-h>", "<Left>", OPTS)
KEYMAP("i", "<C-l>", "<Right>", OPTS)
KEYMAP("i", "<C-k>", "<Up>", OPTS)
KEYMAP("i", "<C-j>", "<Down>", OPTS)
KEYMAP("i", "<C-e>", "<End>", OPTS)
KEYMAP("i", "<C-a>", "<ESC>^i", OPTS)

-- Stay in indent mode
KEYMAP("v", "<", "<gv", OPTS)
KEYMAP("v", ">", ">gv", OPTS)

-- Don't copy the replaced text after pasting in visual mode
KEYMAP("v", "p", '"_dP', OPTS)

-- Don't yank text on cut ( x )
KEYMAP("n", "x", '"_x', OPTS)
KEYMAP("v", "x", '"_x', OPTS)

-- Don't yank text on delete ( d | dd )
KEYMAP("n", "dd", '"_dd', OPTS)
KEYMAP("v", "d", '"_d', OPTS)

-- Stay selected on visual mode
KEYMAP("v", "y", "ygv", OPTS)

-- Select all
KEYMAP("n", "yg", "ggVG", OPTS)

-- Move text up and down
KEYMAP("v", "<A-j>", ":m .+1<CR>==", OPTS)
KEYMAP("n", "<A-j>", ":m .+1<CR>==", OPTS)
KEYMAP("v", "<A-k>", ":m .-2<CR>==", OPTS)
KEYMAP("n", "<A-k>", ":m .-2<CR>==", OPTS)

-- Move text up and down
KEYMAP("x", "J", ":move '>+1<CR>gv-gv", OPTS)
KEYMAP("x", "K", ":move '<-2<CR>gv-gv", OPTS)
KEYMAP("x", "<A-j>", ":move '>+1<CR>gv-gv", OPTS)
KEYMAP("x", "<A-k>", ":move '<-2<CR>gv-gv", OPTS)

-- Text selection
KEYMAP("n", "<leader>x", "viw", OPTS)
KEYMAP("n", "<leader>'", "vi'", OPTS)
KEYMAP("n", '<leader>"', 'vi"', OPTS)
KEYMAP("n", "<leader>`", "vi`", OPTS)
KEYMAP("n", "<leader>(", "vi(", OPTS)
KEYMAP("n", "<leader>{", "vi{", OPTS)
KEYMAP("n", "<leader>[", "vi[", OPTS)

-- Jump words on insert mode
KEYMAP("i", "<C-w>", "<C-\\><C-O>w", OPTS)
KEYMAP("i", "<C-b>", "<C-\\><C-O>b", OPTS)

-- Navigate without leave command mode
vim.cmd("cnoremap <C-H> <Left>")
vim.cmd("cnoremap <C-L> <Right>")
vim.cmd("cnoremap <C-A> <S-Left>")
vim.cmd("cnoremap <C-E> <S-Right>")

-- Display search result in center of the screen
KEYMAP("n", "n", "nzz", OPTS)

-- Buffer stuff
KEYMAP("n", "<C-a>", ":%y+<CR>", OPTS) -- copy whole file content
KEYMAP("n", "<C-c>", ":<C-f>", OPTS) -- see cmd history
KEYMAP("n", "<C-s>", ":w<CR>", OPTS) -- ctrl + s to save file

-- KEYMAP("n", ";", "A;<Esc>", OPTS) -- Insert semicolon
-- KEYMAP("n", ",", "A,<Esc>", OPTS) -- Insert comma

-- Get out of terminal mode
KEYMAP("t", "jk", "<C-\\><C-n>", { silent = true })

-- Open terminals
KEYMAP(
	"n",
	"<leader>h",
	":execute 13 .. 'new +terminal' | let b:term_type = 'hori' | startinsert <CR>",
	OPTS
)
KEYMAP(
	"n",
	"<leader>v",
	":execute 'vnew +terminal' | let b:term_type = 'vert' | startinsert <CR>",
	OPTS
)
KEYMAP(
	"n",
	"<leader>t",
	":execute 'terminal' | let b:term_type = 'wind' | startinsert <CR>",
	OPTS
)
