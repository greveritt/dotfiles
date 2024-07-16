" :let mapleader=","

" commentary
" filetype plugin indent on
" autocmd FileType ruby setlocal commentstring=#\ %s
" autocmd FileType haml setlocal commentstring=\-#\ %s
" autocmd FileType zsh setlocal commentstring=#\ %s
" autocmd FileType yaml setlocal commentstring=#\ %s
" autocmd FileType haml setlocal commentstring=#\ %s
" autocmd FileType vim setlocal commentstring=\"\ %s

" test.vim options
if has('nvim')
  " let test#strategy = "neovim"
  let test#strategy = "basic"
else
  let test#strategy = "vimterminal"
endif
"let test#ruby#use_spring_binstub = 1

"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
