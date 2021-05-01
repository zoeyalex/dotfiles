"
"~/.vimrc
"
"package manager
call plug#begin()
"better defaults
Plug 'tpope/vim-sensible'
"file manager
Plug 'scrooloose/nerdtree'
"rich presence
Plug 'vimsence/vimsence'
"dracula theme
Plug 'dracula/vim', {'as': 'dracula'}
"statusline
Plug 'vim-airline/vim-airline'
"python autocomplete
Plug 'davidhalter/jedi-vim'
"flake8 on F7
Plug 'nvie/vim-flake8'
call plug#end()

let $RC="$HOME/.vimrc"

"colorscheme
colorscheme dracula

"basic syntax highlight
syntax on

"disable line wrapping
set nowrap

"always displays sign column
set signcolumn=yes

"makes cmd bigger to avoid hit-enter prompts
set cmdheight=2

" disable defualt mode indication
set noshowmode

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

"change bg color to terminal 0
highlight Normal ctermbg=0

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

"set leader to space
nnoremap <SPACE> <Nop>
let mapleader=" "

"replace all occurences on S
nnoremap S :%s//g<Left><Left>

"double caps/esc to quit highlight mode
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

"removes all trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e
