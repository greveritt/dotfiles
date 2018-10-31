nnoremap <leader>fu  :FZF<cr>
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
let g:deoplete#enable_at_startup = 1
