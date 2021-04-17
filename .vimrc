" package manager
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'vimsence/vimsence'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'vim-airline/vim-airline'
Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'
call plug#end()

colorscheme dracula

syntax on

"splits open at the bottom and right
set splitbelow splitright

"shows key presses
set showcmd

# show line numbers
set nu

filetype plugin indent on

# statusline always active
set laststatus=2

"auto reload whenever file changes on disk
set autoread

"gives the ability to move your cursor with a mouse
set mouse=a

"runs python on F9
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"removes all trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e
