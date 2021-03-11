:se nu
:set ruler
:syntax on
:set expandtab
:set tabstop=2
:set shiftwidth=2
:let mapleader=","
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif
:nnoremap <Leader>e :Vexplore<Return>

" NetRW options
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_browse_split = 4

autocmd FileType ruby setlocal commentstring=#\ %s
autocmd FileType zsh setlocal commentstring=#\ %s

let g:rspec_command = "!bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm"

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSPecs()<CR>
