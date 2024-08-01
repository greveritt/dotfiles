return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier",
        "solargraph", "sqlls", "ruby-lsp",
        "rust-analyzer"
  		},
  	},
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css", "ruby",
        "json", "javascript", "yaml",
        "sql", "bash", "rust"
  		},
      endwise = {
        enable = true,
      },
  	},
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
    }
  },

  {
    'github/copilot.vim',
    event = 'User FilePost'
  },

  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'Gedit', 'Gsplit', 'Gread', 'Gwrite', 'GMove', 'GDelete', 'GBrowse' }
  },

  {
    'vim-test/vim-test',
    init = function()
      vim.g['test#strategy'] = 'basic'
    end,
    cmd = { 'TestFile', 'TestNearest', 'TestLast', 'TestSuite', 'TestVisit' }
  },

  {
    "folke/which-key.nvim",
    -- Ensures that we can use WhickKey >3.0 w/ leader after launch
    event = "VeryLazy"
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "suketa/nvim-dap-ruby"
    },
    event = 'User FilePost',
    config = function()
      require("dap-ruby").setup()
    end
  }
}
