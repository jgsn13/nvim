" Enable Mouse
set mouse=a

" Window Opacity
GuiWindowOpacity 0.95

" Font Ligatures
GuiRenderLigatures 1

" Disable GUI Tabline
GuiTabline 0

" Disable GUI Popupmenu
GuiPopupmenu 0

" Disable GUI ScrollBar
GuiScrollBar 0

set guifont=FiraCode\ NF:h10
set guifontwide=Noto\ Color\ Emoji

let s:fontsize = 10
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  execute join(['set guifont=', 'FiraCode', '\ NF:h', s:fontsize], '')
endfunction

noremap <silent><C-=> :call AdjustFontSize(1)<CR>
noremap <silent><C--> :call AdjustFontSize(-1)<CR>
inoremap <silent><C-=> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <silent><C--> <Esc>:call AdjustFontSize(-1)<CR>a

" Right Click Context Menu (Copy-Cut-Paste)
"nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
"inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
"xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
"snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

" Paste with <Shift> + <Insert>
imap <S-Insert> <C-R>*
tmap <S-Insert> <C-R>*
