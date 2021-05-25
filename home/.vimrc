"
"~/.vimrc
"
"package manager
call plug#begin()
"better defaults
Plug 'tpope/vim-sensible'
"file manager
Plug 'scrooloose/nerdtree'
"vim css color support
Plug 'ap/vim-css-color'
"flake8 on F7
Plug 'nvie/vim-flake8'
"jedi-vim
Plug 'davidhalter/jedi-vim'
"spacemacs theme
Plug 'colepeters/spacemacs-theme.vim'
"substrata
Plug 'arzg/vim-substrata'
call plug#end()

let $RC="$HOME/.vimrc"

"if (has("termguicolors"))
"  set termguicolors
"endif
"set background=dark
"colorscheme spacemacs-theme
colorscheme substrata

"basic syntax highlight
syntax on

"change font
"set guifont=SF\ Mono\ Medium\ 12

"remove menubar
set guioptions-=m

"remove toolbar
set guioptions-=T

"remove scrollbars
set guioptions-=r
set guioptions-=l
set guioptions-=b
set guioptions-=L
set guioptions-=R


"show tabs as 4 spaces
set tabstop=4

"when indenting with < > use 4 spaces
set shiftwidth=4

"insert 4 spaces when you press tab
set expandtab

"ability to copy to the system clipbord using the + register
set clipboard=unnamedplus

"disable line wrapping
set nowrap

"always displays sign column
set signcolumn=yes

"makes cmd bigger to avoid hit-enter prompts
set cmdheight=2

"no swap files
set noswapfile

"longer update time leads to noticeable delays
set updatetime=50

"show search results in search mode
set is

"ignore case
set ic

"smartcase overrides ingore case when search contains a capital letter
set scs

"highlight search results
set hlsearch

"splits open at the bottom and right
set splitbelow splitright

"shows key presses
set showcmd

"show line numbers
set nu

"set filetype, filetype plugin and filetype indent on
filetype plugin indent on

"statusline always active
set laststatus=2

"auto reload whenever file changes on disk
set autoread

"gives the ability to move your cursor with a mouse
set mouse=a

"map H, V to horizontal split, vertical split respectively
command H sp
command V vs

"set leader to space
nnoremap <SPACE> <Nop>
let mapleader=" "

"replace all occurences on S
nnoremap S :%s//g<Left><Left>

"ctags leader-e to jump to definition, leader-q to go back
map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <leader>e <C-]>
nnoremap <leader>q <C-t>

"fast save on leader w
noremap <Leader>w :update<CR>

"double caps/esc to quit highlight mode
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

"removes all trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

"run python on f9
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
