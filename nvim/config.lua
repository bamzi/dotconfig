CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"
USER = vim.fn.expand "$USER"
vim.cmd [[ set spellfile=~/.config/nvim/spell/en.utf-8.add ]]

lvim = {
  leader = "space",
  colorscheme = "bamzi",
  line_wrap_cursor_movement = true,
  transparent_window = false,
  format_on_save = true,
  lint_on_save = true,
  vsnip_dir = os.getenv "HOME" .. "/.config/snippets",
  database = { save_location = "~/.config/mynvim_db", auto_execute = 1 },
  keys = {
    normal_mode ={
      ["<C-s>"] = ":w<cr>",
    },
  },

  -- TODO why do we need this?
  builtin = {
    -- lspinstall = {},
    -- telescope = {},
    -- compe = {},
    -- autopairs = {},
    -- treesitter = {},
    -- nvimtree = {},
    -- gitsigns = {},
    -- which_key = {},
    -- comment = {},
    -- project = {},
    -- galaxyline = {},
    -- bufferline = {},
    -- dap = {},
    -- dashboard = {},
    -- terminal = {},
    lspinstall = {active = true},
    telescope = {
      active = true, 
      defaults = {
        layout_config = {
          width = 0.95,
          preview_cutoff = 75,
        },
      },
    },
    compe = {active = true,autocomplete = true},
    autopairs = {active = true},
    treesitter = {active = true},
    formatter = {active = true},
    lint = {active = true},
    nvimtree = {active = true},
    gitsigns = {active = true},
    which_key = {
      active = true,
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
    comment = {active = true},
    rooter = {active = true},
    galaxyline = {active = true},
    bufferline = {active = true},
    dap = {active = true},
    dashboard = {},
    terminal = {},
    zen = {active = true},
  },

  log = {
    ---@usage can be { "trace", "debug", "info", "warn", "error", "fatal" },
    level = "warn",
    viewer = {
      ---@usage this will fallback on "less +F" if not found
      cmd = "lnav",
      layout_config = {
        ---@usage direction = 'vertical' | 'horizontal' | 'window' | 'float',
        direction = "horizontal",
        open_mapping = "",
        size = 40,
        float_opts = {},
      },
    },
  },

  lsp = {
    completion = {
      item_kind = {
        "   (Text) ",
        "   (Method)",
        "   (Function)",
        "   (Constructor)",
        " ﴲ  (Field)",
        "[] (Variable)",
        "   (Class)",
        " ﰮ  (Interface)",
        "   (Module)",
        " 襁 (Property)",
        "   (Unit)",
        "   (Value)",
        " 練 (Enum)",
        "   (Keyword)",
        "   (Snippet)",
        "   (Color)",
        "   (File)",
        "   (Reference)",
        "   (Folder)",
        "   (EnumMember)",
        " ﲀ  (Constant)",
        " ﳤ  (Struct)",
        "   (Event)",
        "   (Operator)",
        "   (TypeParameter)",
      },
    },
    diagnostics = {
      signs = {
        active = true,
        values = {
          { name = "LspDiagnosticsSignError", text = "" },
          { name = "LspDiagnosticsSignWarning", text = "" },
          { name = "LspDiagnosticsSignHint", text = "" },
          { name = "LspDiagnosticsSignInformation", text = "" },
        },
      },
      virtual_text = {
        prefix = "",
        spacing = 0,
      },
      underline = true,
      severity_sort = true,
    },
    override = {},
    document_highlight = true,
    popup_border = "single",
    on_attach_callback = nil,
    on_init_callback = nil,
    null_ls = {
      setup = {},
    },
  },

  plugins = {
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

  autocommands = {
    -- { "FileType", "qf", "set nobuflisted" },
  },
}

local schemas = nil
local lsp = require "lsp"
local common_on_attach = lsp.common_on_attach
local common_capabilities = lsp.common_capabilities()
local common_on_init = lsp.common_on_init
local status_ok, jsonls_settings = pcall(require, "nlspsettings.jsonls")
if status_ok then
  schemas = jsonls_settings.get_default_schemas()
end

-- TODO move all of this into lang specific files, only require when using
lvim.lang = {
  asm = {
    formatters = {
      -- {
      --   exe = "asmfmt",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "",
      setup = {},
    },
  },
  beancount = {
    formatters = {
      -- {
      --   exe = "bean_format",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "beancount",
      setup = {
        cmd = { "beancount-langserver" },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  c = {
    formatters = {
      -- {
      --   exe = "clang_format",
      --   args = {},
      -- },
      -- {
      --   exe = "uncrustify",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "clangd",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/cpp/clangd/bin/clangd",
          "--background-index",
          "--header-insertion=never",
          "--cross-file-rename",
          "--clang-tidy",
          "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  cpp = {
    formatters = {
      -- {
      --   exe = "clang_format",
      --   args = {},
      -- },
      -- {
      --   exe = "uncrustify",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "clangd",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/cpp/clangd/bin/clangd",
          "--background-index",
          "--header-insertion=never",
          "--cross-file-rename",
          "--clang-tidy",
          "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  crystal = {
    formatters = {
      -- {
      --   exe = "crystal_format",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "crystalline",
      setup = {
        cmd = { "crystalline" },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  cs = {
    formatters = {
      -- {
      --   exe = "clang_format ",
      --   args = {},
      -- },
      -- {
      --   exe = "uncrustify",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "omnisharp",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/csharp/omnisharp/run",
          "--languageserver",
          "--hostPID",
          tostring(vim.fn.getpid()),
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  cmake = {
    formatters = {
      -- {
      --   exe = "cmake_format",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "cmake",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/cmake/venv/bin/cmake-language-server",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  clojure = {
    formatters = {},
    linters = {},
    lsp = {
      provider = "clojure_lsp",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/clojure/clojure-lsp",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  css = {
    formatters = {
      -- {
      --   exe = "prettier",
      --   args = {},
      -- },
      -- {
      --   exe = "prettierd",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "cssls",
      setup = {
        cmd = {
          "node",
          DATA_PATH .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
          "--stdio",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  less = {
    formatters = {
      -- {
      --   exe = "prettier",
      --   args = {},
      -- },
      -- {
      --   exe = "prettierd",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "cssls",
      setup = {
        cmd = {
          "node",
          DATA_PATH .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
          "--stdio",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  d = {
    formatters = {
      -- {
      --   exe = "dfmt",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "serve_d",
      setup = {
        cmd = { "serve-d" },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  dart = {
    formatters = {
      -- {
      --   exe = "dart_format",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "dartls",
      setup = {
        cmd = {
          "dart",
          "/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot",
          "--lsp",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  docker = {
    formatters = {},
    linters = {},
    lsp = {
      provider = "dockerls",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/dockerfile/node_modules/.bin/docker-langserver",
          "--stdio",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  elixir = {
    formatters = {
      -- {
      --   exe = "mix",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "elixirls",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/elixir/elixir-ls/language_server.sh",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  elm = {
    formatters = {
      -- {
      --   exe = "elm_format",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "elmls",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/elm/node_modules/.bin/elm-language-server",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        -- init_options = {
        -- elmAnalyseTrigger = "change",
        -- elmFormatPath = DATA_PATH .. "/lspinstall/elm/node_modules/.bin/elm-format",
        -- elmPath = DATA_PATH .. "/lspinstall/elm/node_modules/.bin/",
        -- elmTestPath = DATA_PATH .. "/lspinstall/elm/node_modules/.bin/elm-test",
        -- },
      },
    },
  },
  erlang = {
    formatters = {
      -- {
      --   exe = "erlfmt",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "erlangls",
      setup = {
        cmd = {
          "erlang_ls",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  emmet = { active = false },
  fish = {
    formatters = {
      -- {
      --   exe = "fish_indent",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "",
      setup = {
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  fortran = {
    formatters = {},
    linters = {},
    lsp = {
      provider = "fortls",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/fortran/venv/bin/fortls",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  go = {
    formatters = {
      -- {
      --   exe = "gofmt",
      --   args = {},
      -- },
      -- {
      --   exe = "goimports",
      --   args = {},
      -- },
      -- {
      --   exe = "gofumpt",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "gopls",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/go/gopls",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  graphql = {
    formatters = {},
    linters = {},
    lsp = {
      provider = "graphql",
      setup = {
        cmd = {
          "graphql-lsp",
          "server",
          "-m",
          "stream",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  haskell = {
    formatters = {},
    linters = {},
    lsp = {
      provider = "hls",
      setup = {
        cmd = { DATA_PATH .. "/lspinstall/haskell/hls" },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  html = {
    formatters = {
      -- {
      --   exe = "prettier",
      --   args = {},
      -- },
      -- {
      --   exe = "prettierd",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "html",
      setup = {
        cmd = {
          "node",
          DATA_PATH .. "/lspinstall/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js",
          "--stdio",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  java = {
    formatters = {
      -- {
      --   exe = "clang_format",
      --   args = {},
      -- },
      -- {
      --   exe = "uncrustify",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "jdtls",
      setup = {
        cmd = { DATA_PATH .. "/lspinstall/java/jdtls.sh" },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  json = {
    formatters = {
      -- {
      --   exe = "json_tool",
      --   args = {},
      -- },
      -- {
      --   exe = "prettier",
      --   args = {},
      -- },
      -- {
      --   exe = "prettierd",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "jsonls",
      setup = {
        cmd = {
          "node",
          DATA_PATH .. "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
          "--stdio",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
        settings = {
          json = {
            schemas = schemas,
            --   = {
            --   {
            --     fileMatch = { "package.json" },
            --     url = "https://json.schemastore.org/package.json",
            --   },
            -- },
          },
        },
        commands = {
          Format = {
            function()
              vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
            end,
          },
        },
      },
    },
  },
  julia = {
    formatters = {},
    linters = {},
    lsp = {
      provider = "julials",
      setup = {
        {
          "julia",
          "--startup-file=no",
          "--history-file=no",
          -- vim.fn.expand "~/.config/nvim/lua/lsp/julia/run.jl",
          CONFIG_PATH .. "/utils/julia/run.jl",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  kotlin = {
    formatters = {},
    linters = {},
    lsp = {
      provider = "kotlin_language_server",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/kotlin/server/bin/kotlin-language-server",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        root_dir = function(fname)
          local util = require "lspconfig/util"

          local root_files = {
            "settings.gradle", -- Gradle (multi-project)
            "settings.gradle.kts", -- Gradle (multi-project)
            "build.xml", -- Ant
            "pom.xml", -- Maven
          }

          local fallback_root_files = {
            "build.gradle", -- Gradle
            "build.gradle.kts", -- Gradle
          }
          return util.root_pattern(unpack(root_files))(fname) or util.root_pattern(unpack(fallback_root_files))(fname)
        end,
      },
    },
  },
  lua = {
    formatters = {
      -- {
      --   exe = "stylua",
      --   args = {},
      -- },
      -- {
      --   exe = "lua_format",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "sumneko_lua",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/lua/sumneko-lua-language-server",
          "-E",
          DATA_PATH .. "/lspinstall/lua/main.lua",
        },
        capabilities = common_capabilities,
        on_attach = common_on_attach,
        on_init = common_on_init,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
              -- Setup your lua path
              path = vim.split(package.path, ";"),
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim", "lvim" },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = {
                [vim.fn.expand "~/.config/nvim/lua"] = true,
                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
              },
              maxPreload = 100000,
              preloadFileSize = 1000,
            },
          },
        },
      },
    },
  },
  nginx = {
    formatters = {
      -- {
      --   exe = "nginx_beautifier",
      --   args = {
      --     provider = "",
      --     setup = {},
      --   },
      -- },
    },
    linters = {},
    lsp = {},
  },
  perl = {
    formatters = {
      -- {
      --   exe = "perltidy",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "",
      setup = {},
    },
  },
  sql = {
    formatters = {
      -- {
      --   exe = "sqlformat",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "sqls",
      setup = {
        cmd = { "sqls" },
      },
    },
  },
  php = {
    formatters = {
      -- {
      --   exe = "phpcbf",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "intelephense",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/php/node_modules/.bin/intelephense",
          "--stdio",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        filetypes = { "php", "phtml" },
        settings = {
          intelephense = {
            environment = {
              phpVersion = "7.4",
            },
          },
        },
      },
    },
  },
  puppet = {
    formatters = {},
    linters = {},
    lsp = {
      provider = "puppet",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/puppet/puppet-editor-services/puppet-languageserver",
          "--stdio",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  javascript = {
    formatters = {
      -- {
      --   exe = "prettier",
      --   args = {},
      -- },
      -- {
      --   exe = "prettier_d_slim",
      --   args = {},
      -- },
      -- {
      --   exe = "prettierd",
      --   args = {},
      -- },
    },
    -- @usage can be {"eslint"} or {"eslint_d"}
    linters = {},
    lsp = {
      provider = "tsserver",
      setup = {
        cmd = {
          -- TODO:
          DATA_PATH .. "/lspinstall/typescript/node_modules/.bin/typescript-language-server",
          "--stdio",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  javascriptreact = {
    formatters = {
      -- {
      --   exe = "prettier",
      --   args = {},
      -- },
      -- {
      --   exe = "prettier_d_slim",
      --   args = {},
      -- },
      -- {
      --   exe = "prettierd",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "tsserver",
      setup = {
        cmd = {
          -- TODO:
          DATA_PATH .. "/lspinstall/typescript/node_modules/.bin/typescript-language-server",
          "--stdio",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  python = {
    formatters = {
      -- {
      --   exe = "yapf",
      --   args = {},
      -- },
      -- {
      --   exe = "isort",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "pyright",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver",
          "--stdio",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  -- R -e 'install.packages("formatR",repos = "http://cran.us.r-project.org")'
  -- R -e 'install.packages("readr",repos = "http://cran.us.r-project.org")'
  r = {
    formatters = {
      -- {
      --   exe = "format_r",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "r_language_server",
      setup = {
        cmd = {
          "R",
          "--slave",
          "-e",
          "languageserver::run()",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  ruby = {
    formatters = {
      -- {
      --   exe = "rufo",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "solargraph",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/ruby/solargraph/solargraph",
          "stdio",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
        filetypes = { "ruby" },
        init_options = {
          formatting = true,
        },
        root_dir = function(fname)
          local util = require("lspconfig").util
          return util.root_pattern("Gemfile", ".git")(fname)
        end,
        settings = {
          solargraph = {
            diagnostics = true,
          },
        },
      },
    },
  },
  rust = {
    formatters = {
      -- {
      --   exe = "rustfmt",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "rust_analyzer",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/rust/rust-analyzer",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  scala = {
    formatters = {
      -- {
      --   exe = "scalafmt",
      --   args = {},
      -- },
    },
    linters = { "" },
    lsp = {
      provider = "metals",
      setup = {
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  sh = {
    formatters = {
      -- {
      --   exe = "shfmt",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "bashls",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/bash/node_modules/.bin/bash-language-server",
          "start",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  svelte = {
    formatters = {},
    linters = {},
    lsp = {
      provider = "svelte",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/svelte/node_modules/.bin/svelteserver",
          "--stdio",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  swift = {
    formatters = {
      -- {
      --   exe = "swiftformat",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "sourcekit",
      setup = {
        cmd = {
          "xcrun",
          "sourcekit-lsp",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
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
  terraform = {
    formatters = {
      -- {
      --   exe = "terraform_fmt",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "terraformls",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/terraform/terraform-ls",
          "serve",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  tex = {
    formatters = {},
    linters = {},
    lsp = {
      provider = "texlab",
      setup = {
        cmd = { DATA_PATH .. "/lspinstall/latex/texlab" },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  typescript = {
    formatters = {
      -- {
      --   exe = "prettier",
      --   args = {},
      -- },
      -- {
      --   exe = "prettierd",
      --   args = {},
      -- },
      -- {
      --   exe = "prettier_d_slim",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "tsserver",
      setup = {
        cmd = {
          -- TODO:
          DATA_PATH .. "/lspinstall/typescript/node_modules/.bin/typescript-language-server",
          "--stdio",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  typescriptreact = {
    formatters = {
      -- {
      --   exe = "prettier",
      --   args = {},
      -- },
      -- {
      --   exe = "prettierd",
      --   args = {},
      -- },
      -- {
      --   exe = "prettier_d_slim",
      --   args = {},
      -- },
    },
    -- @usage can be {"eslint"} or {"eslint_d"}
    linters = {},
    lsp = {
      provider = "tsserver",
      setup = {
        cmd = {
          -- TODO:
          DATA_PATH .. "/lspinstall/typescript/node_modules/.bin/typescript-language-server",
          "--stdio",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  vim = {
    formatters = {},
    linters = {},
    lsp = {
      provider = "vimls",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/vim/node_modules/.bin/vim-language-server",
          "--stdio",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  vue = {
    formatters = {
      -- {
      --   exe = "prettier",
      --   args = {},
      -- },
      -- {
      --   exe = "prettierd",
      --   args = {},
      -- },
      -- {
      --   exe = "prettier_d_slim",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "vuels",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/vue/node_modules/.bin/vls",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  yaml = {
    formatters = {
      -- {
      --   exe = "prettier",
      --   args = {},
      -- },
      -- {
      --   exe = "prettierd",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "yamlls",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/yaml/node_modules/.bin/yaml-language-server",
          "--stdio",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  zig = {
    formatters = {},
    linters = {},
    lsp = {
      provider = "zls",
      setup = {
        cmd = {
          "zls",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  gdscript = {
    formatters = {},
    linters = {},
    lsp = {
      provider = "gdscript",
      setup = {
        cmd = {
          "nc",
          "localhost",
          "6008",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  ps1 = {
    formatters = {},
    linters = {},
    lsp = {
      provider = "powershell_es",
      setup = {
        bundle_path = "",
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  nix = {
    formatters = {
      -- {
      --   exe = "nixfmt",
      --   args = {},
      -- },
    },
    linters = {},
    lsp = {
      provider = "rnix",
      setup = {
        cmd = { "rnix-lsp" },
        filetypes = { "nix" },
        init_options = {},
        settings = {},
        root_dir = function(fname)
          local util = require "lspconfig/util"
          return util.root_pattern ".git"(fname) or vim.fn.getcwd()
        end,
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
}

require("keymappings").config()
require("core.which-key").config()
require "core.status_colors"
require("core.gitsigns").config()
require("core.compe").config()
require("core.dashboard").config()
require("core.dap").config()
require("core.terminal").config()
require("core.telescope").config()
require("core.treesitter").config()
require("core.nvimtree").config()
require("core.project").config()
require("core.bufferline").config()
require("core.autopairs").config()
require("core.comment").config()