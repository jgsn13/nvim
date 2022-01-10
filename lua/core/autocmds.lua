-- uncomment this if you want to open nvim with a dir
-- vim.cmd [[ autocmd BufEnter * if &buftype != "terminal" | lcd %:p:h | endif ]]

-- Use relative & absolute line numbers in 'n' & 'i' modes respectively
vim.cmd [[ au InsertEnter * set norelativenumber ]]
vim.cmd [[ au InsertLeave * set relativenumber ]]

-- Don't show any numbers inside terminals
vim.cmd [[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]

--auto close file exploer when quiting incase a single buffer is left
vim.cmd([[ autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'nvimtree') | q | endif ]])

-- Open a file from its last left off position
vim.cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]

-- Remove statusline in NvimTree
vim.api.nvim_exec(
    [[
function! DisableST()
  return " "
endfunction
au BufEnter NvimTree setlocal statusline=%!DisableST()
]],
    false
)

-- Setting highlights to some filetypes
vim.cmd [[au BufNewFile,BufRead *.sequelizerc set filetype=javascript]]
vim.cmd [[au BufNewFile,BufRead *.fish set filetype=fish]]

-- Running and/or making files
--vim.cmd [[autocmd filetype javascript nnoremap <F8> :exec '!node '.shellescape('%')<CR>]]
vim.cmd [[autocmd filetype python nnoremap <F8> :exec '!python '.shellescape('%')<CR>]]
vim.cmd [[autocmd filetype javascript nnoremap <F8> :!node shellescape('%')<CR>]]
-- vim.cmd [[autocmd filetype java nnoremap <F8> :!java % && rm %<.class<CR>]]
vim.cmd [[autocmd filetype java nnoremap <F8> :!java %<CR>]]
vim.cmd [[autocmd filetype typescript nnoremap <F8> :exec '!ts-node-transpile-only '.shellescape('%')<CR>]]
-- vim.cmd [[autocmd filetype rust nnoremap <F8> :!rustc % && % && rm %<<CR>]]
vim.cmd [[autocmd filetype rust nnoremap <F8> :!cargo run<CR>]]
vim.cmd [[autocmd filetype c nnoremap <F8> :!gcc -lm % -o %< && ./%< && rm %<<CR>]]
vim.cmd [[autocmd filetype h nnoremap <F8> :exec '!gcc -lm '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('%:r').' && rm '.shellescape('%:r')<CR>]]
vim.cmd [[autocmd filetype cpp nnoremap <F8> :exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('%:r').' && rm '.shellescape('%:r')<CR>]]
vim.cmd [[autocmd filetype hpp nnoremap <F8> :exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('%:r').' && rm '.shellescape('%:r')<CR>]]
