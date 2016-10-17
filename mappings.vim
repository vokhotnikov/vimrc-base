"" map jk to ESC to save some pinky stretching
inoremap jk <ESC>
vnoremap jk <ESC>

"" unmap esc and arrows to break the habit of using them
inoremap <ESC> <NOP>
vnoremap <ESC> <NOP>

inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>


"" help when forget to do sudo
cmap w!! %!sudo tee > /dev/null %

"" split window switch
noremap <leader><space> <C-w>w

" Syntastic
noremap <Leader>s :SyntasticToggleMode<CR>

" ghc-mod
noremap <silent> tw :GhcModTypeInsert<CR>
noremap <silent> ts :GhcModSplitFunCase<CR>
noremap <silent> tq :GhcModType<CR>
noremap <silent> te :GhcModTypeClear<CR>

" supertab
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  inoremap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

" tabularize
let g:haskell_tabular = 1

" Ctrl+P
noremap <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>

" NERDTree
noremap <Leader>n :NERDTreeToggle<CR>

"" abbreviations
iabbrev @-- Regards, Vladimir Okhotnikov
iabbrev @--r С уважением, Владимир Охотников

