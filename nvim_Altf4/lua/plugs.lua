local cmd = vim.api.nvim_command
local fn = vim.fn
local packer = nil

local function packer_verify()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    cmd 'packadd packer.nvim'
  end
end

local function packer_startup()
  if packer ==  nil then
    packer = require'packer'
    packer.init()
  end

  local use = packer.use
  packer.reset()

  -- Packer
  use 'wbthomason/packer.nvim'

  -- Language Servers
  use {
    'lspcontainers/lspcontainers.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'nvim-lua/lsp_extensions.nvim',
    },
    config = function ()
      require'plugins.lspconfig'.init()
    end
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = 'TSUpdate',
    config = function ()
      require'plugins.treesitter'.init()
    end,
  }

  -- Completion
  use {
    'hrsh7th/nvim-compe',
    requires = {
      -- {
      --   'erkrnt/compe-tabnine',
      --   run = './install.sh'
      -- },
      'wellle/tmux-complete.vim',
      'L3MON4D3/LuaSnip',
      'onsails/lspkind-nvim'
    },
    config = function ()
      require'plugins.compe'.init()
      -- require'plugins.compe_tabnine'.init()
      require'plugins.lspkind'.init()
    end
  }

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'rmagatti/session-lens',
    config = function ()
      require'plugins.telescope'.init()
    end
  }

  -- Themes
  use {
    'folke/tokyonight.nvim',
    config = function ()
      require'plugins.tokyonight'.init()
    end
  }

  -- Git Support
  use 'rhysd/git-messenger.vim'
  use {
    'lewis6991/gitsigns.nvim',
    config = function ()
      require'plugins.gitsigns'.init()
    end
  }

  -- Sessions
  use {
    'rmagatti/auto-session',
    config = function ()
      require'plugins.auto_session'.init()
    end
  }

  -- Utilities
  use {
    'hoob3rt/lualine.nvim',
    config = function ()
      require'plugins.lualine'.init()
    end
  }
  use 'preservim/nerdcommenter'
  use 'romgrk/nvim-treesitter-context'
  use 'kyazdani42/nvim-web-devicons'
  use {
    'voldikss/vim-floaterm',
    config = function ()
      require'plugins.floaterm'.init()
    end
  }
  -- use {
  --   'takac/vim-hardtime', -- see http://vimcasts.org/blog/2013/02/habit-breaking-habit-making
  --   config = function ()
  --     require'plugins.hardtime'.init()
  --   end
  -- }

  -- VimWiki + Zettelkasten
  use {
    'michal-h21/vim-zettel',
    requires = {
      {
        'junegunn/fzf',
        run = function () vim.fn['fzf#install']() end
      },
      'junegunn/fzf.vim',
      'vimwiki/vimwiki'
    },
    config = function ()
      require'plugins.zettel'.init()
    end
  }

  use {
    "kyazdani42/nvim-tree.lua",
    -- cmd = "NvimTreeToggle",
    config = function()
      require("plugins.nvimtree").config()
    end,
  }

  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    after = { "telescope.nvim" },
    config = function()
      require "plugins.autopairs"
    end,
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"

      vim.g.indent_blankline_filetype_exclude = {
        "help",
        "terminal",
        "dashboard",
      }
      vim.g.indent_blankline_buftype_exclude = { "terminal" }

      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = true
    end
  }

  use {"gruvbox-community/gruvbox"}

  use {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline"
  }
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle" 
  }
  use {
    "mfussenegger/nvim-dap",
    config = function()
      require "dap"
      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "LspDiagnosticsSignError",
        linehl = "",
        numhl = "",
      })
      require("dap").defaults.fallback.terminal_win_cmd = "50vsplit new"
    end
  }

  use {
    "nvim-telescope/telescope-fzy-native.nvim",
    event = "BufRead"
  }

  use {
    "felipec/vim-sanegx",
    event = "BufRead"
  }

  use {
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    ft = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
  }

  use {
    "p00f/nvim-ts-rainbow",
  }

  use {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
  }

  use { "sbdchd/neoformat" }

  -- treesitter
  use {'andymass/vim-matchup'}

  use {"ahmedkhalf/lsp-rooter.nvim"}

  use {"mhinz/vim-startify"}

  use {"uarun/vim-protobuf"}
  use {"yoheimuta/vim-protolint"}

  use {"terryma/vim-multiple-cursors"}

  use {"tpope/vim-surround"}

  use {"RRethy/vim-illuminate"}

  use {"https://github.com/ap/vim-css-color"}

  use {
    "folke/which-key.nvim",
    config = function()
      require'plugins.whichkey'
    end,
  }

end

local function init()
  packer_verify()
  packer_startup()
end

return {
  init = init
}
