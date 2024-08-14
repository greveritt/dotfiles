:se nu
:set ruler
:syntax on
:set expandtab
:set tabstop=2
:set shiftwidth=2
:set mouse=a
:let mapleader=","

" NetRW options
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_browse_split = 4

nnoremap <F3> :Vexplore<Return>

filetype plugin indent on

" Split
noremap <Leader>h :<C-u>split<CR> <C-w>j
noremap <Leader>v :<C-u>vsplit<CR> <C-w>l

" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

" Close buffer
noremap <leader>c :bd<CR>

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

