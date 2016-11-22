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

"" swap colon and comma re: https://konfekt.github.io/blog/2016/10/03/get-the-leader-right
nnoremap : ,
xnoremap : ,
onoremap : ,

nnoremap , :
xnoremap , :
onoremap , :

nnoremap g: g,
nnoremap g, <NOP>

nnoremap @, @:
nnoremap @: <NOP>

" NOTE: Causes lag when 'q' is hit, for example when
" - stopping to record a macro or
" - exiting a buffer by a custom mapping to 'q'.
nnoremap q, q:
xnoremap q, q:

nnoremap q: <NOP>
xnoremap q: <NOP>

""" split window switch
noremap g<space> <C-w>w
"

"" Syntastic
"noremap <Leader>s :SyntasticToggleMode<CR>
"
"" ghc-mod
"noremap <silent> tw :GhcModTypeInsert<CR>
"noremap <silent> ts :GhcModSplitFunCase<CR>
"noremap <silent> tq :GhcModType<CR>
"noremap <silent> te :GhcModTypeClear<CR>
"
"" supertab
"let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
"
"if has("gui_running")
"  inoremap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
"else " no gui
"  if has("unix")
"    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
"  endif
"endif
"
"" tabularize
"let g:haskell_tabular = 1
"
"" Ctrl+P
"noremap <silent> <Leader>t :CtrlP()<CR>
"noremap <leader>b<space> :CtrlPBuffer<cr>
"
"" NERDTree
"noremap <Leader>n :NERDTreeToggle<CR>
"

command! -nargs=* Make make <args> | vert copen 50

" Aliases
function! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunction

Alias w!! write\ !sudo\ tee\ >\ /dev/null\ %
Alias f find\ *<c-r>=Eatchar("\ ")<cr>

Alias mm Make<cr>

Alias tb TagbarToggle<cr>
Alias tsm SyntasticToggleMode<cr>

" filetype-specifics
augroup mkdmaps
  autocmd!

  autocmd FileType markdown :onoremap ih :<C-u>execute "normal! ?^[=-][=-]\\+$\r:nohlsearch\rkvg_"<cr>
  autocmd FileType markdown :onoremap ah :<C-u>execute "normal! ?^[=-][=-]\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END


augroup haskellmaps
  autocmd!

  autocmd FileType haskell setlocal makeprg=stack\ test
augroup END

"" abbreviations
iabbrev @-- Regards, Vladimir Okhotnikov
iabbrev @--r С уважением, Владимир Охотников

