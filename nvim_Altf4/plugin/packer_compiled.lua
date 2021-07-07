-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/bam/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/bam/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/bam/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/bam/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/bam/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["auto-session"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\25plugins.auto_session\frequire\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/auto-session"
  },
  fzf = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\21plugins.gitsigns\frequire\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["indent-blankline.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  ["lsp-rooter.nvim"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/lsp-rooter.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lspcontainers.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\22plugins.lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/lspcontainers.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\20plugins.lualine\frequire\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  nerdcommenter = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.autopairs\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n^\0\0\3\0\4\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\20plugins.lspkind\tinit\18plugins.compe\frequire\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\nâ\1\0\0\4\0\v\0\0176\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0'\2\1\0B\0\2\0029\0\a\0009\0\b\0'\1\n\0=\1\t\0K\0\1\0\01750vsplit new\21terminal_win_cmd\rfallback\rdefaults\1\0\4\nnumhl\5\ttext\bï—£\vlinehl\5\vtexthl\28LspDiagnosticsSignError\18DapBreakpoint\16sign_define\afn\bvim\bdap\frequire\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\21plugins.nvimtree\frequire\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\23plugins.treesitter\frequire\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context"
  },
  ["nvim-ts-autotag"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["session-lens"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/session-lens"
  },
  ["symbols-outline.nvim"] = {
    commands = { "SymbolsOutline" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/symbols-outline.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    after = { "nvim-autopairs" },
    loaded = true,
    only_config = true
  },
  ["tmux-complete.vim"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/tmux-complete.vim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\23plugins.tokyonight\frequire\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/trouble.nvim"
  },
  ["vim-css-color"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/vim-css-color"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\21plugins.floaterm\frequire\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-multiple-cursors"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/vim-multiple-cursors"
  },
  ["vim-protobuf"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/vim-protobuf"
  },
  ["vim-protolint"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/vim-protolint"
  },
  ["vim-sanegx"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/vim-sanegx"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-zettel"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\19plugins.zettel\frequire\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/vim-zettel"
  },
  vimwiki = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/vimwiki"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: indent-blankline.nvim
time([[Setup for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nã\2\0\0\2\0\v\0\0256\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0006\0\0\0009\0\1\0005\1\b\0=\1\a\0006\0\0\0009\0\1\0+\1\1\0=\1\t\0006\0\0\0009\0\1\0+\1\2\0=\1\n\0K\0\1\0-indent_blankline_show_first_indent_level4indent_blankline_show_trailing_blankline_indent\1\2\0\0\rterminal%indent_blankline_buftype_exclude\1\4\0\0\thelp\rterminal\14dashboard&indent_blankline_filetype_exclude\bâ–\26indent_blankline_char\23indentLine_enabled\6g\bvim\0", "setup", "indent-blankline.nvim")
time([[Setup for indent-blankline.nvim]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\21plugins.floaterm\frequire\0", "config", "vim-floaterm")
time([[Config for vim-floaterm]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\n^\0\0\3\0\4\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\20plugins.lspkind\tinit\18plugins.compe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: vim-zettel
time([[Config for vim-zettel]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\19plugins.zettel\frequire\0", "config", "vim-zettel")
time([[Config for vim-zettel]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\nâ\1\0\0\4\0\v\0\0176\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0'\2\1\0B\0\2\0029\0\a\0009\0\b\0'\1\n\0=\1\t\0K\0\1\0\01750vsplit new\21terminal_win_cmd\rfallback\rdefaults\1\0\4\nnumhl\5\ttext\bï—£\vlinehl\5\vtexthl\28LspDiagnosticsSignError\18DapBreakpoint\16sign_define\afn\bvim\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\22plugins.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: lspcontainers.nvim
time([[Config for lspcontainers.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\22plugins.lspconfig\frequire\0", "config", "lspcontainers.nvim")
time([[Config for lspcontainers.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\23plugins.tokyonight\frequire\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\21plugins.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\21plugins.nvimtree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\20plugins.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\25plugins.auto_session\frequire\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\23plugins.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file SymbolsOutline lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutline", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType typescript.tsx ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "typescript.tsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript.jsx ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "javascript.jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'vim-sanegx', 'indent-blankline.nvim', 'telescope-fzy-native.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs', 'nvim-ts-autotag'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: ".v:exception | echom "Please check your config for correctness" | echohl None')
end
