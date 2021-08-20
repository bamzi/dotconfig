CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
USER = vim.fn.expand "$USER"
TERMINAL = vim.fn.expand "$TERMINAL"

local map = vim.api.nvim_set_keymap
local options = { noremap = true }

O = {
  keys = {
    leader_key = "space",
  },
  colorscheme = "bamzi",
  line_wrap_cursor_movement = true,
  transparent_window = false,
  format_on_save = true,
  lint_on_save = true,
  vsnip_dir = os.getenv "HOME" .. "/.config/snippets",

  default_options = {
    backup = false, -- creates a backup file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 2, -- more space in the neovim command line for displaying messages
    colorcolumn = "99999", -- fixes indentline for now
    completeopt = { "menuone", "noselect" },
    conceallevel = 0, -- so that `` is visible in markdown files
    fileencoding = "utf-8", -- the encoding written to a file
    foldmethod = "manual", -- folding, set to "expr" for treesitter based foloding
    foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
    guifont = "monospace:h17", -- the font used in graphical neovim applications
    hidden = true, -- required to keep multiple buffers and open multiple buffers
    hlsearch = true, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2, -- always show tabs
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    termguicolors = true, -- set term gui colors (most terminals support this)
    timeoutlen = 100, -- time to wait for a mapped sequence to complete (in milliseconds)
    title = true, -- set the title of window to the value of the titlestring
    -- opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
    undodir = CACHE_PATH .. "/undo", -- set an undo directory
    undofile = true, -- enable persisten undo
    updatetime = 300, -- faster completion
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = false, -- convert tabs to spaces
    shiftwidth = 2, -- the number of spaces inserted for each indentation
    tabstop = 2, -- insert 2 spaces for a tab
    cursorline = true, -- highlight the current line
    number = true, -- set numbered lines
    relativenumber = true, -- set relative numbered lines
    numberwidth = 4, -- set number column width to 2 {default 4}
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    wrap = true, -- display lines as one long line
    spell = false,
    spelllang = "en",
    scrolloff = 8, -- is one of my fav
    sidescrolloff = 8,
  },

  lsp = {
    diagnostics = {
      virtual_text = {
        prefix = "",
        spacing = 0,
      },
      signs = true,
      underline = true,
    },
    document_highlight = true,
    popup_border = "single",
    default_keybinds = true,
    on_attach_callback = nil,
  },

  disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin", -- 'man',
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    -- 'matchit', 'matchparen', 'shada_plugin',
  },

  plugin = {
    lspinstall = {active = true},
    telescope = {active = true},
    compe = {active = true},
    autopairs = {active = true},
    treesitter = {active = true},
    formatter = {active = true},
    lint = {active = true},
    nvimtree = {active = true},
    gitsigns = {active = true},
    which_key = {active = true},
    comment = {active = true},
    rooter = {active = true},
    galaxyline = {active = true},
    bufferline = {active = true},
    dap = {active = true},
    dashboard = {},
    terminal = {},
    zen = {active = true},
  },

  -- TODO: refactor for tree
  auto_close_tree = 0,
  nvim_tree_disable_netrw = 0,

  database = { save_location = "~/.config/nvim_db", auto_execute = 1 },

  -- TODO: just using mappings (leader mappings)
  user_which_key = {
    m = {
      name = "FloaTerm",
      b = {"<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 btm<CR>", "BTM"},
      d = {"<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazydocker<CR>", "Lazydocker"},
      g = {"<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazygit<CR>", "Lazygit"},
      n = {"<CMD>FloatermNew --autoclose=2 --height=0.5 --width=0.5 nnn -Hde<CR>", "NNN"},
      z = {"<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 zsh<CR>", "ZSH Terminal"},
      t = {"<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 taskwarrior-tui<CR>", "Taskwarrior"},
      m = {"<CMD>HopChar1<CR>", "Hop Char 1"},
      M = {"<CMD>HopChar2<CR>", "Hop Char 2"},
      p = {"<CMD>HopPattern<CR>", "Hop Pattern"},
      l = {"<CMD>HopLine<CR>", "Hop Line"},
      w = {"<CMD>HopWord<CR>", "Hop Word"}
    },
  },

  user_plugins = {
    {
      "voldikss/vim-floaterm",
      -- config = function()
      --   require("my-floatterm")
      -- end,
    },
    {"nvim-telescope/telescope-fzy-native.nvim"},
    {"nvim-telescope/telescope-project.nvim"},
    {"nvim-lua/completion-nvim"},
    {"tpope/vim-surround"},
    {"terryma/vim-multiple-cursors"},
    {"mhinz/vim-startify"},
    {"https://github.com/ap/vim-css-color"},
    {"gruvbox-community/gruvbox"},
    {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("lsp_signature").on_attach()
      end,
      event = "InsertEnter",
    },
    {
      "unblevable/quick-scope",
      config = function()
        vim.cmd [[
        let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
        ]]
      end,
    },
  
    {
      "ruifm/gitlinker.nvim",
      event = "BufRead",
      config = function()
        require("gitlinker").setup {
          opts = {
            -- remote = 'github', -- force the use of a specific remote
            -- adds current line nr in the url for normal mode
            add_current_line_on_normal_mode = true,
            -- callback for what to do with the url
            action_callback = require("gitlinker.actions").open_in_browser,
            -- print the url after performing the action
            print_url = false,
            -- mapping to call url generation
            mappings = "<leader>gy",
          },
        }
      end,
      requires = "nvim-lua/plenary.nvim",
    },
    {
      "phaazon/hop.nvim",
      event = "BufRead",
      config = function()
        require("hop").setup()
      end,
    },
    {
      "mattn/vim-gist",
      event = "BufRead",
      requires = "mattn/webapi-vim",
    },
    {
      "andymass/vim-matchup",
      event = "CursorMoved",
      config = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end,
    },
    {
      "nacro90/numb.nvim",
      event = "BufRead",
      config = function()
        require("numb").setup {
          show_numbers = true, -- Enable 'number' for the window while peeking
          show_cursorline = true, -- Enable 'cursorline' for the window while peeking
        }
      end,
    },
    {
      "kevinhwang91/nvim-bqf",
      event = "BufRead",
    },
    {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      ft = "markdown",
    },
    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup({ "*" }, {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions
          hsl_fn = true, -- CSS hsl() and hsla() functions
          css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        })
      end,
    },
    {
      "nvim-treesitter/playground",
      event = "BufRead",
    },
    {
      "windwp/nvim-ts-autotag",
      event = "InsertEnter",
    },
    {
      "sindrets/diffview.nvim",
      event = "BufRead",
    },
  },

  user_autocommands = {
    { "FileType", "qf", "set nobuflisted" },
  },

  formatters = {
    filetype = {},
  },
  treesitter = {
    ensure_installed = "all",
    ignore_install = { "haskell" },
    highlight = { enabled = true },
    -- The below are for treesitter-textobjects plugin
    textobj_prefixes = {
      goto_next = "]", -- Go to next
      goto_previous = "[", -- Go to previous
      inner = "i", -- Select inside
      outer = "a", -- Selct around
      swap = "<leader>a", -- Swap with next
    },
    textobj_suffixes = {
      -- Start and End respectively for the goto keys
      -- for other keys it only uses the first
      ["function"] = { "f", "F" },
      ["class"] = { "m", "M" },
      ["parameter"] = { "a", "A" },
      ["block"] = { "k", "K" },
      ["conditional"] = { "i", "I" },
      ["call"] = { "c", "C" },
      ["loop"] = { "l", "L" },
      ["statement"] = { "s", "S" },
      ["comment"] = { "/", "?" },
    },
    -- The below is for treesitter hint textobjects plugin
    hint_labels = { "h", "j", "f", "d", "n", "v", "s", "l", "a" },
  },
  -- TODO move all of this into lang specific files, only require when using
  lang = {
    efm = {},
    emmet = { active = false },
    tailwindcss = {
      active = true,
      filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "svelte",
      },
    },
    json = {
      active = true,
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
    },
    tsserver = {
      active = true,
      -- @usage can be 'eslint' or 'eslint_d'
      linter = "",
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      formatter = {
        exe = "prettier",
        args = {},
      },
    },
    sh = {
      -- @usage can be 'shellcheck'
      linter = "",
      -- @usage can be 'shfmt'
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
    },
    go = {active = true},
    terraform = {active = true},
    yaml = {active = true},
    elixir = {active = true},
    svelte = {active = true},
    html = {active = true},
    docker = {active = true},
    css = {active = true},
    }
}

require "core.status_colors"
require("core.gitsigns").config()
require("core.compe").config()
require("core.dashboard").config()
require("core.dap").config()
require("core.terminal").config()
require("core.zen").config()
require("core.telescope").config()
require("core.treesitter").config()
require("core.which-key").config()
require("core.nvimtree").config()

require("lang.clang").config()
require("lang.clojure").config()
require("lang.cmake").config()
require("lang.cs").config()
require("lang.css").config()
require("lang.dart").config()
require("lang.dockerfile").config()
require("lang.elixir").config()
require("lang.elm").config()
require("lang.go").config()
require("lang.graphql").config()
require("lang.html").config()
require("lang.java").config()
require("lang.json").config()
require("lang.julia").config()
require("lang.kotlin").config()
require("lang.lua").config()
require("lang.php").config()
require("lang.python").config()
require("lang.r").config()
require("lang.ruby").config()
require("lang.rust").config()
require("lang.sh").config()
require("lang.scala").config()
require("lang.svelte").config()
require("lang.swift").config()
require("lang.terraform").config()
require("lang.tex").config()
require("lang.vim").config()
require("lang.vue").config()
require("lang.yaml").config()
require("lang.zig").config()
require("lang.zsh").config()

require('telescope').load_extension('fzy_native')
require'telescope'.load_extension('project')

map('n', '<leader>mb', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 btm<CR>', options) -- Bottom app (brew install clementtsang/bottom/bottom)
map('n', '<leader>md', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazydocker<CR>', options)
map('n', '<leader>mg', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazygit<CR>', options)
map('n', '<leader>mn', '<CMD>FloatermNew --autoclose=2 --height=0.5 --width=0.5 nnn -Hde<CR>', options) --- like ranger for directory brow
map('n', '<leader>mz', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 zsh<CR>', options)
map('n', '<leader>mt', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 tannskwarrior-tui<CR>', options)


-- vim.api.nvim_set_keymap("n", "<leader>s1", ":HopChar2<cr>", { silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>s2", ":HopWord<cr>", { silent = true })
map('n', '<leader>m1', ':HopChar1<CR>', { silent = true })
map('n', '<leader>m2', ':HopChar2<CR>', { silent = true })
map('n', '<leader>mp', ':HopPattern<CR>', { silent = true })
map('n', '<leader>ml', ':HopLine<CR>', { silent = true })
map('n', '<leader>mw', ':HopWord<CR>', { silent = true })

local teleOptions = { noremap = true, silent = true }
-- Builtin
map('n', '<leader>fe', ':Telescope file_browser cwd=vim.fn.expand("%:p:h")<CR>', teleOptions)
map('n', '<leader>fg', ':Telescope git_files<CR>', teleOptions)
map('n', '<C-f>', ':Telescope find_files hidden=true<CR>', teleOptions) -- 
map('n', '<leader>fl', ':Telescope live_grep<CR>', teleOptions)
map('n', '<leader>fb', ':Telescope buffers<CR>', teleOptions)
map('n', '<leader>fh', ':Telescope help_tags<CR>', teleOptions)
map('n', '<leader>fd', ':Telescope lsp_workspace_diagnostics<CR>', teleOptions)

-- no hl
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':set hlsearch!<CR>', {noremap = true, silent = true})

vim.cmd([[
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  inoremap <C-h> <C-\><C-N><C-w>h
  inoremap <C-j> <C-\><C-N><C-w>j
  inoremap <C-k> <C-\><C-N><C-w>k
  inoremap <C-l> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>
  ]])

  vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
  vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
  vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
  vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

  vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', {silent = true})
  vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', {silent = true})
  vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', {silent = true})
  vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', {silent = true})

  vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

  vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

  vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

  vim.cmd('vnoremap p "0p')
  vim.cmd('vnoremap P "0P')

  vim.api.nvim_set_keymap("n", "<leader>bd", ":bd<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>bD", ":bd!<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>bA", ":bufdo! bd<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>bn", ":bnext<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>bv", ":bprevious<CR>", {noremap = true, silent = true})
  -- Toggle the QuickFix window
  vim.api.nvim_set_keymap('', '<C-q>', ':call QuickFixToggle()<CR>', {noremap = true, silent = true})

  vim.api.nvim_set_keymap("n", "Y", "y$", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "n", "nzzzv", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "N", "Nzzzv", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "J", "mzJ`z", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", ",", ",<c-g>u", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", ".", ".<c-g>u", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "!", "!<c-g>u", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "?", "?<c-g>u", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "[", "[<c-g>u", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "{", "{<c-g>u", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "(", "(<c-g>u", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "_", "_<c-g>u", {noremap = true, silent = true})

vim.api.nvim_set_keymap("v", "J", ":m \'>+1<CR>gv=gv", {noremap = true})
vim.api.nvim_set_keymap("v", "K", ":m \'<-2<CR>gv=gv", {noremap = true})
vim.api.nvim_set_keymap("i", "<C-j>", "<esc>:m .+1<CR>==", {noremap = true})
vim.api.nvim_set_keymap("i", "<C-k>", "<esc>:m .-2<CR>==", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>j", ":m .+1<CR>==", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>k", ":m .-2<CR>==", {noremap = true})
