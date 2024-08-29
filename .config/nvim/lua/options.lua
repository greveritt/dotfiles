require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.foldmethod = 'expr'
o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
o.foldenable = false -- Open buffers unfolded
