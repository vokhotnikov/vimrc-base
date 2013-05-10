set nocompatible                " choose no compatibility with legacy vi

let g:CommandTNeverShowDotFiles = 1

let s:vimrcBase=expand("<sfile>:h")

call pathogen#infect(s:vimrcBase . '/{}')

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set textwidth=130               " do auto-wrap at 130 chars
set list listchars=tab:▸\ ,trail:·

set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
set laststatus=2

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set wildignore=.git,*.class,*/target/**,project/target/**

set background=light
let g:solarized_termcolors=256
colorscheme solarized

set number
set numberwidth=5

if has("gui_running")
  set guifont=Menlo\ Bold:h12

  set guioptions-=T " hide toolbar
endif

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

augroup comment_settings
  au!
  au BufEnter * setlocal commentstring=/*\ %s\ */
  au BufEnter *.scala setlocal commentstring=//\ %s
augroup END

"" Remove trailing whitespaces for those file types
autocmd FileType c,cpp,java,php,ruby,python,scala,javascript,css autocmd BufWritePre <buffer> :%s/\s\+$//e

nmap <C-f> :CommandT<cr>
nmap <C-p> :CommandTTag<cr>
nmap <C-\> :CommandTBuffer<cr>

cmap w!! %!sudo tee > /dev/null %
