local opts = { noremap = true, silent = true }

-- Modes
-- - normal_mode = "n",
-- - insert_mode = "i",
-- - visual_mode = "v",
-- - visual_block_mode = "x",
-- - term_mode = "t",
-- - command_mode = "c",

-- Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- No highlight
vim.keymap.set("n", "<A-l>", ":noh<CR>", opts)

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Delete buffer
vim.keymap.set("n", "<C-q>", ":bd!<CR>", opts)

-- Navigation within insert mode
vim.keymap.set("i", "<C-h>", "<Left>", opts)
vim.keymap.set("i", "<C-l>", "<Right>", opts)
vim.keymap.set("i", "<C-k>", "<Up>", opts)
vim.keymap.set("i", "<C-j>", "<Down>", opts)
vim.keymap.set("i", "<C-e>", "<End>", opts)
vim.keymap.set("i", "<C-a>", "<ESC>^i", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Don't copy the replaced text after pasting in visual mode
vim.keymap.set("v", "p", '"_dP', opts)

-- Don't yank text on cut ( x )
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("v", "x", '"_x', opts)

-- Don't yank text on delete ( d | dd )
vim.keymap.set("n", "dd", '"_dd', opts)
vim.keymap.set("v", "d", '"_d', opts)

-- Stay selected on visual mode
vim.keymap.set("v", "y", "ygv", opts)

-- Select all
vim.keymap.set("n", "yg", "ggVG", opts)

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)

-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Text selection
vim.keymap.set("n", "<leader>x", "viw", opts)
vim.keymap.set("n", "<leader>'", "vi'", opts)
vim.keymap.set("n", '<leader>"', 'vi"', opts)
vim.keymap.set("n", "<leader>`", "vi`", opts)
vim.keymap.set("n", "<leader>(", "vi(", opts)
vim.keymap.set("n", "<leader>{", "vi{", opts)
vim.keymap.set("n", "<leader>[", "vi[", opts)

-- Jump words on insert mode
vim.keymap.set("i", "<C-w>", "<C-\\><C-O>w", opts)
vim.keymap.set("i", "<C-b>", "<C-\\><C-O>b", opts)

-- Navigate without leave command mode
vim.cmd("cnoremap <C-H> <Left>")
vim.cmd("cnoremap <C-L> <Right>")
vim.cmd("cnoremap <C-A> <S-Left>")
vim.cmd("cnoremap <C-E> <S-Right>")

-- Display search result in center of the screen
vim.keymap.set("n", "n", "nzz", opts)

-- Buffer stuff
vim.keymap.set("n", "<C-a>", ":%y+<CR>", opts) -- copy whole file content
vim.keymap.set("n", "<C-c>", ":<C-f>", opts)   -- see cmd history
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)   -- ctrl + s to save file

-- Get out of terminal mode
vim.keymap.set("t", "jk", "<C-\\><C-n>", { silent = true })

-- Open terminals
vim.keymap.set("n", "<leader>h", ":execute 13 .. 'new +terminal' | let b:term_type = 'hori' | startinsert <CR>", opts)
vim.keymap.set("n", "<leader>v", ":execute 'vnew +terminal' | let b:term_type = 'vert' | startinsert <CR>", opts)
vim.keymap.set("n", "<leader>t", ":execute 'terminal' | let b:term_type = 'wind' | startinsert <CR>", opts)

if vim.lsp.inlay_hint then
    vim.keymap.set("n", "<C-i>", function()
        vim.lsp.inlay_hint(0, nil)
    end, {
        desc = "Toggle Inlay Hints",
    })
end
