CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"

local plugins = require "plugins"
local plugin_loader = require("plugin-loader").init()
plugin_loader:load { plugins }

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
require("core.compe").config()
require("core.dap").config()
-- require("core.terminal").config()
require("core.telescope").config()
require("core.treesitter").config()
require("core.nvimtree").config()
require("core.project").config()
require("core.bufferline").config()
require("core.autopairs").config()
require("core.comment").config()

require("lspconfigx")
require("lsp").config()
require("lsp").setup("go")
require("lsp").setup("javascript")
require("lsp").setup("typescript")
require("lsp").setup("html")
require("lsp").setup("css")
require("lsp").setup("json")
require("lsp").setup("docker")
require("lsp").setup("yaml")
require("lsp").setup("sh")
-- require("lsp").setup("zsh")
require("lsp").setup("lua")
require("lsp").setup("svelte")
require("lsp").setup("terraform")