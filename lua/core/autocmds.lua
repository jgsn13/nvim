-- Highlight on yank
EXEC(
	[[
      augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
      augroup end
    ]],
	false
)

-- Don't show any numbers inside terminals
vim.cmd(
	[[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]
)

-- Open a file from its last left off position
vim.cmd(
	[[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
)
