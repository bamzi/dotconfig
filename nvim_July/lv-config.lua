CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"

O = {
  format_on_save = true,
  auto_close_tree = 0,
  auto_complete = true,
  colorscheme = "gruvbox",
  hidden_files = true,
  wrap_lines = true,
  number = true,
  relative_number = true,
  cursorline = true,
  shell = "bash",
  timeoutlen = 100,
  nvim_tree_disable_netrw = 0,
  ignore_case = true,
  smart_case = true,
  lushmode = false,
  hl_search = true,
  transparent_window = false,
  leader_key = "space",
  vnsip_dir = vim.fn.stdpath "config" .. "/snippets",

  -- @usage pass a table with your desired languages
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

  lsp = {
    popup_border = "single",
  },

  database = { save_location = "~/.config/nvcode_db", auto_execute = 1 },

  plugin = {
    -- Builtins
    dashboard = { active = false },
    colorizer = { active = true },
    zen = { active = true },
    ts_playground = { active = false },
    ts_context_commentstring = { active = true },
    ts_hintobjects = { active = true },
    ts_autotag = { active = true },
    ts_rainbow = { active = true },
    ts_textobjects = { active = true },
    ts_textsubjects = { active = true },
    telescope_fzy = { active = true },
    telescope_project = { active = true },
    indent_line = { active = true },
    symbol_outline = { active = true },
    debug = { active = true },
    dap_install = { active = true },
    lush = { active = false },
    diffview = { active = true },
    floatterm = { active = false },
    trouble = { active = true },
    sanegx = { active = true },
  },

  user_which_key = {
    m = {
      name = "FloaTerm",
      b = {"<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 btm<CR>", "BTM"},
      d = {"<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazydocker<CR>", "Lazydocker"},
      g = {"<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazygit<CR>", "Lazygit"},
      n = {"<CMD>FloatermNew --autoclose=2 --height=0.5 --width=0.5 nnn -Hde<CR>", "NNN"},
      z = {"<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 zsh<CR>", "ZSH Terminal"},
      t = {"<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 taskwarrior-tui<CR>", "Taskwarrior"}
    },
  },

  user_plugins = {
    {
      "voldikss/vim-floaterm",
      -- config = function()
      --   require("my-floatterm")
      -- end,
    },
    {"mhinz/vim-startify"},
    {"https://github.com/ap/vim-css-color"},
    {"gruvbox-community/gruvbox"}

  },

  user_autocommands = {
    { "FileType", "qf", "set nobuflisted" },
  },

  lang = {
    python = {
      linter = "",
      isort = false,
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      analysis = {
        type_checking = "basic",
        auto_search_paths = true,
        use_library_code_types = true,
      },
    },
    dart = {
      sdk_path = "/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot",
    },
    lua = {
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
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
    tsserver = {
      -- @usage can be 'eslint'
      linter = "",
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
    },
    json = {
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
    },
    tailwindcss = {
      active = false,
      filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
    },
    clang = {
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      cross_file_rename = true,
      header_insertion = "never",
    },
    ruby = {
      diagnostics = {
        virtualtext = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      filetypes = { "rb", "erb", "rakefile", "ruby" },
    },
    go = {},
    elixir = {},
    vim = {},
    yaml = {},
    terraform = {},
    rust = {
      rust_tools = {
        active = false,
      },
      linter = "",
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
    },
    svelte = {},

    php = {
      format = {
        format = {
          default = "psr12",
        },
      },
      environment = {
        php_version = "7.4",
      },
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      filetypes = { "php", "phtml" },
    },
    latex = {},
    kotlin = {},
    html = {},
    elm = {},
    emmet = { active = true },
    graphql = {},
    efm = {},
    docker = {},
    cmake = {},
    java = {},
    css = {
      virtual_text = true,
    },
  },

  dashboard = {

    custom_header = {
    },
    footer = { "BAM" },
  },
}

vim.cmd('let g:gruvbox_contrast_dark="hard"')
vim.cmd('let g:gruvbox_bold=0')
vim.cmd('let g:gruvbox_invert_selection=0')
vim.cmd('highlight ColorColumn ctermbg=0 guibg=lightgrey')

vim.cmd('colorscheme gruvbox')
vim.cmd('set background=dark')


local map = vim.api.nvim_set_keymap
local options = { noremap = true }

--vim.api.nvim_command([[
  --tnoremap <ESC> <C-\><C-n>
--]])

map('n', '<leader>mb', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 btm<CR>', options) -- Bottom app (brew install clementtsang/bottom/bottom)
map('n', '<leader>md', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazydocker<CR>', options)
map('n', '<leader>mg', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazygit<CR>', options)
map('n', '<leader>mn', '<CMD>FloatermNew --autoclose=2 --height=0.5 --width=0.5 nnn -Hde<CR>', options) --- like ranger for directory brow
map('n', '<leader>mz', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 zsh<CR>', options)
map('n', '<leader>mt', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 tannskwarrior-tui<CR>', options)