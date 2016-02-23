set nocompatible                " choose no compatibility with legacy vi
filetype off

set encoding=utf-8

let s:vimrcBase=expand("<sfile>:h")
let s:vundleBase=s:vimrcBase . "/bundles/Vundle.vim"

if empty(&rtp)
  let &rtp=s:vundleBase
else
  let &rtp=&rtp.','.s:vundleBase
endif

call vundle#begin(s:vimrcBase . "/bundles")

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list=1

" temporary include command-T until there is better option
Plugin 'wincent/command-t'

Plugin 'altercation/vim-colors-solarized'

"" language-specific
" haskell
Plugin 'dag/vim2hs'
Plugin 'bitc/vim-hdevtools'

" scala
Plugin 'derekwyatt/vim-scala'

call vundle#end()

filetype plugin indent on  

set showcmd                     " display incomplete commands

"" Unfold by default
set foldlevel=99

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)

"" Searching
set hlsearch                    " highlight matches
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" layout/font/colors

set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
set laststatus=2

set number
set numberwidth=5

if has("gui_running")
  if exists("g:force_guifont")
    let &guifont=g:force_guifont
  else
    set guifont=Monaco\ Regular:h11
  endif
  if has("gui_macvim")
    set macligatures
  endif

  if has("gui_gtk2")
    set guiheadroom=0
  endif

  set guioptions-=T " hide toolbar
  set guioptions-=r " hide right scrollbar
endif

"" Solarized

set background=light
let g:solarized_termcolors=256

if !has('gui_running')
" Compatibility for Terminal
  let g:solarized_termtrans=1

  if (&t_Co >= 256 || $TERM == 'xterm-256color')
    " Do nothing, it handles itself.
  else
    " Make Solarized use 16 colors for Terminal support
    let g:solarized_termcolors=16
  endif
endif

colorscheme solarized

"" map ;; to ESC to save some pinky stretching
imap ;; <ESC>

"" help when forget to do sudo
cmap w!! %!sudo tee > /dev/null %

"let g:CommandTNeverShowDotFiles = 1
"
""" Scala plugin options
"let g:scala_sort_across_groups=1
"let g:scala_first_party_namespaces='\(controllers\|views\|models\|util\|net.vokhot\)'
"
"
"set wildignore=.git,*.class,*/target/**,project/target/**
"
"let g:vim_markdown_initial_foldlevel=5
"
"augroup comment_settings
"  au!
"  au BufEnter * setlocal commentstring=/*\ %s\ */
"  au BufEnter *.scala setlocal commentstring=//\ %s
"augroup END
"
""" Remove trailing whitespaces for those file types
"autocmd FileType c,cpp,java,php,ruby,python,scala,javascript,css autocmd BufWritePre <buffer> :%s/\s\+$//e
"
"autocmd FileType scala nmap <buffer> <C-_> :SortScalaImports<cr>

nmap <C-f> :CommandT<cr>
nmap <C-p> :CommandTTag<cr>
nmap <C-\> :CommandTBuffer<cr>

autocmd BufEnter *.hs set formatprg=pointfree

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
