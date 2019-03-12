set nocompatible                " choose no compatibility with legacy vi
filetype off

set encoding=utf-8

syntax enable
filetype plugin indent on

" the following 2 statements provide basic find functionality
set path+=**

set wildmenu
set wildmode=longest:full

"suffixes?
"wildignore?

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" show invisibles
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

set tags=./tags;$HOME

let s:vimrcBase=expand("<sfile>:h")

" based on https://github.com/VundleVim/Vundle.vim/issues/769
" START - Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1

let s:bundlesDir=s:vimrcBase . "/bundles"
let s:vundleBase=s:bundlesDir . "/Vundle.vim"
let vundle_readme=expand(s:vundleBase . '/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent execute("!mkdir -p " . s:bundlesDir)
  silent execute("!git clone https://github.com/VundleVim/Vundle.vim.git " . s:vundleBase)
  let iCanHazVundle=0
endif

if empty(&rtp)
  let &rtp=s:vundleBase
else
  let &rtp=&rtp.','.s:vundleBase
endif

call vundle#begin(s:bundlesDir)

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-vinegar'

" ag integration
Plugin 'rking/ag.vim'
Plugin 'Chun-Yang/vim-action-ag'

Plugin 'Konfekt/vim-alias'

Plugin 'vim-airline/vim-airline'

Plugin 'https://github.com/Shougo/vimproc.vim.git'

Plugin 'majutsushi/tagbar'
Plugin 'https://github.com/scrooloose/syntastic.git'
Plugin 'keith/investigate.vim'
Plugin 'https://github.com/godlygeek/tabular.git'
Plugin 'https://github.com/ervandew/supertab.git'

Plugin 'altercation/vim-colors-solarized'

"" language-specific
" haskell
Plugin 'https://github.com/eagletmt/ghcmod-vim.git'
Plugin 'https://github.com/eagletmt/neco-ghc'

Plugin 'dag/vim2hs'
Plugin 'bitc/vim-hdevtools'

" scala
" Plugin 'derekwyatt/vim-scala'

" Plugin 'https://github.com/ctrlpvim/ctrlp.vim.git'
" Plugin 'https://github.com/tomtom/tlib_vim.git'
" Plugin 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
" Plugin 'https://github.com/garbas/vim-snipmate.git'
" Plugin 'https://github.com/scrooloose/nerdtree.git'
" Plugin 'https://github.com/scrooloose/nerdcommenter.git'
" Plugin 'https://github.com/Shougo/neocomplete.vim.git'

" powershell
Plugin 'PProvost/vim-ps1'
call vundle#end()

" html
Plugin 'mattn/emmet-vim'

"""" Vundle integration below
if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall
endif
" END - Setting up Vundle - the vim plugin bundler

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

set relativenumber
set numberwidth=4

set smartindent

set clipboard=unnamed,unnamedplus

"set completeopt=menuone,menu,longest
"
"set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.hg,target,.cabal-sandbox
"set wildmode=longest,list,full
"set completeopt+=longest
"
set cmdheight=1

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
  set guioptions-=m " hide menu
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
"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:haskellmode_completion_ghc = 1

" supertab
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

"" tabularize
let g:haskell_tabular = 1

" investigate
let g:investigate_use_dash = 1

"" Ctrl+P
"let g:ctrlp_custom_ignore = '\v[\/]dist$'
"

if executable('fast-tags')
    let g:tagbar_type_haskell = {
        \ 'ctagsbin' : 'fast-tags',
        \ 'ctagsargs' : '-o -',
        \ 'kinds' : [
            \ 'm:module:0',
            \ 't:types:0',
            \ 'c:classes:0',
            \ 'C:constructors:0',
            \ 'f:functions:0',
            \ 'o:operators:0',
            \ 'p:patterns:0',
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 'C' : 'constructor',
            \ 'c' : 'class',
            \ 't' : 'type'
        \ },
        \ 'scope2kind' : {
            \ 'constructor' : 'C',
            \ 'class' : 'c',
            \ 'type' : 't'
        \ }
    \ }
endif

let s:mappings_path=s:vimrcBase . "/mappings.vim"

" quick mapping file edit
execute "nnoremap <leader>evm :vsplit " . fnameescape(s:mappings_path) . "<cr>G"
" ... and source
execute "nnoremap <leader>evs :source " . fnameescape(s:mappings_path) . "<cr>"

if exists('s:loaded_vimafter')
  silent doautocmd VimAfter VimEnter *
else
  let s:loaded_vimafter = 1
  augroup VimAfter
    autocmd!
    autocmd VimEnter * execute "source " .fnameescape(s:mappings_path)
  augroup END
endif
