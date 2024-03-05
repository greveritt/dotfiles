local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
return require('lazy').setup({
  'neovim/nvim-lspconfig',
  {
      'nvim-treesitter/nvim-treesitter',
      build = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
      config = function(plugin)
        require'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all"
        ensure_installed = { "lua", "ruby", "json", "javascript", "yaml", "sql" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        -- List of parsers to ignore installing (for "all")
        -- ignore_install = { "javascript" },

        ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
        -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

        highlight = {
          -- `false` will disable the whole extension
          enable = true,

          -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
          -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
          -- the name of the parser)
          -- list of language that will be disabled
          -- disable = { "c", "rust" },
          -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
          -- disable = function(lang, buf)
          --     local max_filesize = 100 * 1024 -- 100 KB
          --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          --     if ok and stats and stats.size > max_filesize then
          --         return true
          --     end
          -- end,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      }
    end
  },
  'mileszs/ack.vim',
  'editorconfig/editorconfig-vim',
  -- use {
  --   'junegunn/fzf.vim',
  --   dependencies = { 'junegunn/fzf', build = function() vim.fn['fzf#install'](0) end }
  -- }
  'tpope/vim-commentary',
  {
    'tpope/vim-endwise',
    ft = { 'make' }
  },
  {
    'RRethy/nvim-treesitter-endwise',
    config = function()
      require('nvim-treesitter.configs').setup {
          endwise = {
              enable = true,
          },
      }
    end,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = { 'vim', 'lua', 'sh', 'bash', 'zsh', 'ruby' }
  },
  'tpope/vim-fugitive',
  {
    'lewis6991/gitsigns.nvim',
    -- version = 'release',
    -- dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'alampros/vim-styled-jsx',
    ft = { 'javascriptreact', 'typescriptreact' }
  },
  'vim-test/vim-test',
  {
    'jparise/vim-graphql',
    ft = 'graphql'
  },
  -- use {
  --   'phaazon/hop.nvim',
  --   branch = 'v2', -- optional but strongly recommended
  --   config = function()
  --     -- you can configure Hop the way you like here; see :h hop-config
  --     require'hop'.init { keys = 'etovxqpdygfblzhckisuran' }
  --   end
  -- }
  -- use 'easymotion/vim-easymotion',
   -- use {
   --   'nvim-treesitter/nvim-treesitter',
   --   build = ':TSUpdate',
   -- }
  'github/copilot.vim',
  {
    'nvim-telescope/telescope.nvim', version = '0.1.5',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  }, 
  {
    'sudormrfbin/cheatsheet.nvim',
    dependencies = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
  },
})
