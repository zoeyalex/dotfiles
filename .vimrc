" package manager
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'vimsence/vimsence'
Plug 'vim-airline/vim-airline'
call plug#end()

colorscheme ice_cold

syntax on

set nu rnu

filetype plugin indent on

set laststatus=2

"running python on F9
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"auto reload whenever file changes on disk
set autoread

set mouse=a
