:se nu
:set ruler
:syntax on
:set expandtab
:set tabstop=2
:set shiftwidth=2
:set mouse=a
:let mapleader=","
if executable('rg')
	let g:ackprg = 'rg --vimgrep'
elseif executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

" NetRW options
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_browse_split = 4

autocmd FileType ruby setlocal commentstring=#\ %s
autocmd FileType zsh setlocal commentstring=#\ %s
autocmd FileType yaml setlocal commentstring=#\ %s
autocmd FileType haml setlocal commentstring=#\ %s
autocmd FileType vim setlocal commentstring=\"\ %s

" Add FZF to &runtimepath so that the plugin fzf.vim will have access to the latest library from
" Homebrew
set rtp+=/usr/local/opt/fzf

" test.vim options
if has('nvim')
  let test#strategy = "neovim"
else
  let test#strategy = "vimterminal"
endif

" Finding files
nnoremap <F3> :Vexplore<Return>
noremap <Leader>e :Files<CR>

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR> <C-w>l

" Git
noremap <Leader>gs :Git<CR>
noremap <Leader>gc :Git commit<CR>
noremap <Leader>gb :Git blame<CR>

" test.vim mappings
map <Leader>t :TestFile<CR>
map <Leader>s :TestNearest<CR>
map <Leader>l :TestLast<CR>
map <Leader>a :TestSuite<CR>

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
