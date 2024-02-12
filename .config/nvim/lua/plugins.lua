return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
      config = function()
        require'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all"
        ensure_installed = { "lua", "ruby", "typescript", "json", "javascript", "yaml", "sql" },

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
  }
  use 'mileszs/ack.vim'
  use 'editorconfig/editorconfig-vim'
  -- use {
  --   'junegunn/fzf.vim',
  --   requires = { 'junegunn/fzf', run = function() vim.fn['fzf#install'](0) end }
  -- }
  use 'tpope/vim-commentary'
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release',
    -- requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  use 'alampros/vim-styled-jsx'
  use 'vim-test/vim-test'
  use 'jparise/vim-graphql'
  -- use {
  --   'phaazon/hop.nvim',
  --   branch = 'v2', -- optional but strongly recommended
  --   config = function()
  --     -- you can configure Hop the way you like here; see :h hop-config
  --     require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  --   end
  -- }
  -- use 'easymotion/vim-easymotion'
   -- use {
   --   'nvim-treesitter/nvim-treesitter',
   --   run = ':TSUpdate'
   -- }
  use 'github/copilot.vim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  } 
  use {
    'sudormrfbin/cheatsheet.nvim',
    requires = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
  }
end)
