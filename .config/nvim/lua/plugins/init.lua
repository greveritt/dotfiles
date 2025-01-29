return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
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
        "solargraph", "sqlls", "rust-analyzer"
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
      matchup = {
        enable = true
      },
  	},
    dependencies = {
      {
        "andymass/vim-matchup",
        config = function()
          vim.g.matchup_matchparen_offscreen = { method = 'popup' }
        end
      }
    }
  },

  {
    'github/copilot.vim',
    enabled = false,
    event = 'User FilePost'
  },

  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'Gedit', 'Gsplit', 'Gread', 'Gwrite', 'GMove', 'GDelete', 'GBrowse' }
  },

  {
    'vim-test/vim-test',
    init = function()
      vim.g['test#strategy'] = 'neovim'
      vim.g['test#neovim#term_position'] = 'vert'
      vim.g['test#neovim_sticky#reopen_window'] = 1
    end,
    cmd = { 'TestFile', 'TestNearest', 'TestLast', 'TestSuite', 'TestVisit' }
  },

  {
    "folke/which-key.nvim",
    optional = true,
    -- Ensures that we can use WhickKey >3.0 w/ leader after launch
    event = "VeryLazy"
  },

  {
     "windwp/nvim-autopairs",
    optional = true,
    config = function(_, opts)
      -- Copies the config function from NvChad plugin's own config function, expands the rules
      local npairs = require("nvim-autopairs")
      npairs.setup(opts)

      -- setup cmp for autopairs
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())

      npairs.add_rules(require('nvim-autopairs.rules.endwise-elixir'))
      npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
      npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
    end
  },

  {
    "mfussenegger/nvim-dap",
    enabled = false,
    dependencies = {
      "suketa/nvim-dap-ruby"
    },
    event = 'User FilePost',
    config = function()
      require("dap-ruby").setup()
    end
  },

  {
    'easymotion/vim-easymotion',
    event = 'User FilePost'
  }

  -- {
  --   'smoka7/hop.nvim',
  --   version = "*",
  --   event = 'User FilePost',
  --   opts = {
  --       keys = 'etovxqpdygfblzhckisuran'
  --   }
  -- }
}
