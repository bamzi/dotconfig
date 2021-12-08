CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"


local init_path = debug.getinfo(1, "S").source:sub(2)
local base_dir = init_path:match("(.*[/\\])"):sub(1, -2)
require("bootstrap"):init(base_dir)

require("impatient").setup {
  path = vim.fn.stdpath "cache" .. "/my_nvim_cache",
  enable_profiling = true,
}

local plugins = require "plugins"
local plugin_loader = require("plugin-loader").init()
plugin_loader:load { plugins }


local function set(key, value)
  if value == true or value == nil then
    vim.cmd(string.format('set %s', key))
  elseif value == false then
    vim.cmd(string.format('set no%s', key))
  else
    vim.cmd(string.format('set %s=%s', key, value))
  end
end

mykeys = {}
require("keymappings").setup()
require("mymaps").start()

whichkeys = {}

local autocmds = require "core.autocmds"
require("settings").load_options()

color_theme = "bamzi"
vim.cmd("colorscheme " .. color_theme)

require("core.which-key").config()   
require "core.status_colors"  
require("core.gitsigns").config()
-- require("core.compe").config()
require("core.cmp").config()
require("core.dap").config()
-- require("core.terminal").config()
require("core.telescope").config()
require("core.treesitter").config()
require("core.nvimtree").setup()
require("core.project").config()
require("core.bufferline").config()
require("core.autopairs").config()
require("core.comment").config()
require("core.lualine").setup()
-- require("core.navigator")

local lspcfg = require("lspconfigx")
require("lsp").setup()
-- require("lsp").setup("go")
require("lsp.manager").setup("gopls", lspcfg.lang.go )
-- require("lsp.manager").setup("javascript", lspcfg.lang.javascript )
require("lsp.manager").setup("tsserver", lspcfg.lang.tsserver )
-- require("lsp.manager").setup("tsx", lspcfg.lang.typescriptreact )
-- require("lsp").setup("javascript")
-- require("lsp").setup("typescript")
-- require("lsp").setup("html")
-- require("lsp").setup("css")
-- require("lsp").setup("json")
-- require("lsp").setup("docker")
-- require("lsp").setup("yaml")
-- require("lsp").setup("sh")
-- -- require("lsp").setup("zsh")
-- require("lsp").setup("lua")
-- require("lsp").setup("svelte")
-- require("lsp").setup("terraform")


  -- Necessary to work
  set 'hidden'
  set 'wrap'
  set 'autoread'
  set 'undofile'
  set ('swapfile', false)
  set ('backup', false)
  set ('completeopt', 'menu,menuone,noselect')

  -- Tabs configuration
  set ('tabstop', 3)
  set ('softtabstop', 3)
  set ('shiftwidth', 3)
  set ('expandtab', false)
  set 'autoindent'
  set 'cindent'

  -- Search configuration
  set ('hlsearch', false)
  set 'ignorecase'
  set 'smarttab'
  set 'smartcase'
  set 'smartindent'
  set 'cursorline'
  set ('inccommand', 'split') -- prev nosplit
  set 'incsearch'

  -- Looks and feels
  set ('cmdheight', 2)
  set 'number'
  set 'relativenumber'
  set 'splitright'
  set 'splitbelow'
  set ('updatetime', '1000')
  set 'showcmd'
  set 'ruler'
  set 'incsearch'
  set ('showmode', false)
  set ('colorcolumn', '99')
  set ('signcolumn', 'yes')
  set ('mouse', 'a')
  set ('updatetime', 50)
  set 'hlsearch'
  -- Other
  set ('clipboard', 'unnamedplus')
  set ('fileencoding', 'utf-8')
  set ('foldmethod', 'manual')
  set ('foldexpr', '')
  set ('guifont', 'monospace:h17')
  set ('conceallevel', 0)
  set ('pumheight', 12)
  set ('showtabline', 2)
  set ('scrolloff', 8)
  set ('sidescrolloff', 8)
  set ('spelllang', 'en')
  set ('spell', false)