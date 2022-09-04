-- Highlight on yank
vim.api.nvim_exec(
	[[
      augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
      augroup end
    ]],
	false
)

-- Use relative & absolute line numbers in 'n' & 'i' modes respectively
vim.cmd([[ au InsertEnter * set norelativenumber ]])
vim.cmd([[ au InsertLeave * set relativenumber ]])

-- Don't show any numbers inside terminals
vim.cmd(
	[[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]
)

-- Open a file from its last left off position
vim.cmd(
	[[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
)

-- Setting highlights to some filetypes
vim.cmd([[au BufNewFile,BufRead *.sequelizerc set filetype=javascript]])
vim.cmd([[au BufNewFile,BufRead *.fish set filetype=fish]])
