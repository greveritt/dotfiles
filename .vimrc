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

" This uses Spring for RSpec tests if there is a spring shim in the project bin/ of your current
" working directory. Please note that the working directory is based on where you invoke Vim, not
" the directory of the file that is currently open or even any path supplied as a command line
" argument to Vim.
if filereadable('bin/spring')
  let g:rspec_command = "!bundle exec spring rspec {spec}"
else
  let g:rspec_command = "!bundle exec rspec {spec}"
endif
let g:rspec_runner = "os_x_iterm"

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
