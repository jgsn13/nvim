OPTS = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
KEYMAP = vim.api.nvim_set_keymap

--Remap space as leader key
KEYMAP("", "<Space>", "<Nop>", OPTS)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
KEYMAP("n", "<C-h>", "<C-w>h", OPTS)
KEYMAP("n", "<C-j>", "<C-w>j", OPTS)
KEYMAP("n", "<C-k>", "<C-w>k", OPTS)
KEYMAP("n", "<C-l>", "<C-w>l", OPTS)

-- KEYMAP("n", "<leader>e", ":Lex 30<cr>", OPTS)

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
KEYMAP("i", "<C-e>", "<End>", OPTS)
KEYMAP("i", "<C-l>", "<Right>", OPTS)
KEYMAP("i", "<C-k>", "<Up>", OPTS)
KEYMAP("i", "<C-j>", "<Down>", OPTS)
KEYMAP("i", "<C-a>", "<ESC>^i", OPTS)

-- Insert --
-- Press jk fast to enter
KEYMAP("i", "jk", "<ESC>", OPTS)

-- Visual --
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

-- Visual Block --
-- Move text up and down
KEYMAP("x", "J", ":move '>+1<CR>gv-gv", OPTS)
KEYMAP("x", "K", ":move '<-2<CR>gv-gv", OPTS)
KEYMAP("x", "<A-j>", ":move '>+1<CR>gv-gv", OPTS)
KEYMAP("x", "<A-k>", ":move '<-2<CR>gv-gv", OPTS)

-- Text selection
KEYMAP("n", "<Leader>x", "viw", OPTS)
KEYMAP("n", "<Leader>'", "vi'", OPTS)
KEYMAP("n", '<Leader>"', 'vi"', OPTS)
KEYMAP("n", "<Leader>`", "vi`", OPTS)
KEYMAP("n", "<Leader>(", "vi(", OPTS)
KEYMAP("n", "<Leader>{", "vi{", OPTS)
KEYMAP("n", "<Leader>[", "vi[", OPTS)

-- Jump words on insert mode
KEYMAP("i", "<C-w>", "<C-\\><C-O>w", OPTS)
KEYMAP("i", "<C-b>", "<C-\\><C-O>b", OPTS)

-- Navigate without leave command mode
KEYMAP("c", "<C-h>", "<Left>", OPTS)
KEYMAP("c", "<C-l>", "<Right>", OPTS)

-- Open and close fold
-- TODO use different mapping to avoid conflicts
-- KEYMAP("n", "<C-h>", ":foldclose<CR>", OPTS)
-- KEYMAP("n", "<C-f>", ":foldopen<CR>", OPTS)
-- KEYMAP("v", "<C-h>", "<cmd>foldclose<CR><Esc>", OPTS)
-- KEYMAP("v", "<C-f>", "<cmd>foldopen<CR><Esc>", OPTS)

-- Display search result in center of the screen
KEYMAP("n", "n", "nzz", OPTS)

-- Buffer stuff
KEYMAP("n", "<C-a>", ":%y+<CR>", OPTS) -- copy whole file content
KEYMAP("n", "<C-c>", ":<C-f>", OPTS) -- see cmd history
KEYMAP("n", "<C-s>", ":w<CR>", OPTS) -- ctrl + s to save file
KEYMAP("n", "<C-q>", ":bd<cr>", OPTS) -- close buffer

KEYMAP("n", ";", "A;<Esc>", OPTS) -- Insert semicolon
KEYMAP("n", ",", "A,<Esc>", OPTS) -- Insert comma

-- Terminal --
-- Better terminal navigation
KEYMAP("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
KEYMAP("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
KEYMAP("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
KEYMAP("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Get out of terminal mode
KEYMAP("t", "jk", "<C-\\><C-n>", term_opts)

-- Open terminals
KEYMAP(
	"n",
	"<Leader>h",
	":execute 15 .. 'new +terminal' | let b:term_type = 'hori' | startinsert <CR>",
	OPTS
)
KEYMAP(
	"n",
	"<Leader>v",
	":execute 'vnew +terminal' | let b:term_type = 'vert' | startinsert <CR>",
	OPTS
)
KEYMAP(
	"n",
	"<Leader>t",
	":execute 'terminal' | let b:term_type = 'wind' | startinsert <CR>",
	OPTS
)
