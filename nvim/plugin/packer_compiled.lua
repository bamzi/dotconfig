-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n~\0\0\3\0\6\0\0156\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0009\0\5\0\15\0\0\0X\1\5€6\0\2\0009\0\3\0009\0\4\0009\0\5\0B\0\1\1K\0\1\0\19on_config_done\15bufferline\vplugin\6O\20core.bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/barbar.nvim"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["diffview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/diffview.nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\nˆ\1\0\0\5\0\6\0\0186\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0009\0\5\0\15\0\0\0X\1\b€6\0\2\0009\0\3\0009\0\4\0009\0\5\0006\2\0\0'\4\4\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\14formatter\vplugin\6O\19core.formatter\frequire\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\nŠ\1\0\0\5\0\6\0\0186\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0009\0\5\0\15\0\0\0X\1\b€6\0\2\0009\0\3\0009\0\4\0009\0\5\0006\2\0\0'\4\4\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\15galaxyline\vplugin\6O\20core.galaxyline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/galaxyline.nvim"
  },
  ["gitlinker.nvim"] = {
    config = { "\27LJ\2\nÔ\1\0\0\a\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\6\3=\3\b\2B\0\2\1K\0\1\0\topts\1\0\0\20action_callback\20open_in_browser\22gitlinker.actions\1\0\3$add_current_line_on_normal_mode\2\14print_url\1\rmappings\15<leader>gy\nsetup\14gitlinker\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n”\1\0\0\5\0\a\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b€6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\5\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\rgitsigns\vplugin\6O\nsetup\18core.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bhop\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/hop.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14on_attach\18lsp_signature\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["numb.nvim"] = {
    config = { "\27LJ\2\nX\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\20show_cursorline\2\17show_numbers\2\nsetup\tnumb\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/numb.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n—\1\0\0\5\0\a\0\0186\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0009\0\5\0\15\0\0\0X\1\b€6\0\2\0009\0\3\0009\0\4\0009\0\5\0006\2\0\0'\4\6\0B\2\2\0A\0\0\1K\0\1\0\19nvim-autopairs\19on_config_done\14autopairs\vplugin\6O\19core.autopairs\frequire\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/nvim-bqf"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n|\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\a\bcss\2\vcss_fn\2\vhsl_fn\2\vrgb_fn\2\rRRGGBBAA\2\vRRGGBB\2\bRGB\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\n \1\0\0\5\0\b\0\0226\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0009\2\3\1B\2\1\0016\2\4\0009\2\5\0029\2\6\0029\2\a\2\15\0\2\0X\3\6€6\2\4\0009\2\5\0029\2\6\0029\2\a\2\18\4\1\0B\2\2\1K\0\1\0\19on_config_done\fcomment\vplugin\6O\nsetup\17nvim_comment\frequire\npcall\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/nvim-comment"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\nŽ\1\0\0\5\0\a\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b€6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\5\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\ncompe\vplugin\6O\nsetup\15core.compe\frequire\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lint"] = {
    config = { "\27LJ\2\nŽ\1\0\0\5\0\a\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b€6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\5\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\tlint\vplugin\6O\nsetup\16core.linter\frequire\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/nvim-lint"
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
  ["nvim-lspinstall"] = {
    config = { "\27LJ\2\n€\1\0\0\4\0\6\0\0186\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\3\0009\1\4\0019\1\1\0019\1\5\1\15\0\1\0X\2\6€6\1\3\0009\1\4\0019\1\1\0019\1\5\1\18\3\0\0B\1\2\1K\0\1\0\19on_config_done\vplugin\6O\nsetup\15lspinstall\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n¥\1\0\0\5\0\b\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b€6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\a\0B\2\2\0A\0\0\1K\0\1\0\21nvim-tree.config\19on_config_done\rnvimtree\vplugin\6O\nsetup\18core.nvimtree\frequire\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n°\1\0\0\5\0\b\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b€6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\a\0B\2\2\0A\0\0\1K\0\1\0\28nvim-treesitter.configs\19on_config_done\15treesitter\vplugin\6O\nsetup\20core.treesitter\frequire\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    config = { "\27LJ\2\nf\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0G        let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']\n        \bcmd\bvim\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n–\1\0\0\5\0\a\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b€6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\5\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\14telescope\vplugin\6O\nsetup\19core.telescope\frequire\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-css-color"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/vim-css-color"
  },
  ["vim-elixir"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/vim-elixir"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-gist"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/vim-gist"
  },
  ["vim-matchup"] = {
    after_files = { "/Users/bam/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    config = { "\27LJ\2\nN\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-multiple-cursors"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/vim-multiple-cursors"
  },
  ["vim-rooter"] = {
    config = { "\27LJ\2\n€\1\0\0\2\0\a\0\0166\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\5€6\0\3\0009\0\4\0009\0\5\0009\0\6\0B\0\1\1K\0\1\0\19on_config_done\vrooter\vplugin\6O\24rooter_silent_chdir\6g\bvim\0" },
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/vimtex"
  },
  ["webapi-vim"] = {
    loaded = true,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/start/webapi-vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n \1\0\0\5\0\b\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b€6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\a\0B\2\2\0A\0\0\1K\0\1\0\14which-key\19on_config_done\14which_key\vplugin\6O\nsetup\19core.which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/bam/.local/share/nvim/site/pack/packer/opt/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\nŽ\1\0\0\5\0\a\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b€6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\5\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\ncompe\vplugin\6O\nsetup\15core.compe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n–\1\0\0\5\0\a\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b€6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\5\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\14telescope\vplugin\6O\nsetup\19core.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\nˆ\1\0\0\5\0\6\0\0186\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0009\0\5\0\15\0\0\0X\1\b€6\0\2\0009\0\3\0009\0\4\0009\0\5\0006\2\0\0'\4\4\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\14formatter\vplugin\6O\19core.formatter\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: vim-rooter
time([[Config for vim-rooter]], true)
try_loadstring("\27LJ\2\n€\1\0\0\2\0\a\0\0166\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\5€6\0\3\0009\0\4\0009\0\5\0009\0\6\0B\0\1\1K\0\1\0\19on_config_done\vrooter\vplugin\6O\24rooter_silent_chdir\6g\bvim\0", "config", "vim-rooter")
time([[Config for vim-rooter]], false)
-- Config for: nvim-lint
time([[Config for nvim-lint]], true)
try_loadstring("\27LJ\2\nŽ\1\0\0\5\0\a\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b€6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\5\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\tlint\vplugin\6O\nsetup\16core.linter\frequire\0", "config", "nvim-lint")
time([[Config for nvim-lint]], false)
-- Config for: quick-scope
time([[Config for quick-scope]], true)
try_loadstring("\27LJ\2\nf\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0G        let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']\n        \bcmd\bvim\0", "config", "quick-scope")
time([[Config for quick-scope]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n|\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\a\bcss\2\vcss_fn\2\vhsl_fn\2\vrgb_fn\2\rRRGGBBAA\2\vRRGGBB\2\bRGB\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n°\1\0\0\5\0\b\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b€6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\a\0B\2\2\0A\0\0\1K\0\1\0\28nvim-treesitter.configs\19on_config_done\15treesitter\vplugin\6O\nsetup\20core.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n¥\1\0\0\5\0\b\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b€6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\a\0B\2\2\0A\0\0\1K\0\1\0\21nvim-tree.config\19on_config_done\rnvimtree\vplugin\6O\nsetup\18core.nvimtree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n—\1\0\0\5\0\a\0\0186\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0009\0\5\0\15\0\0\0X\1\b€6\0\2\0009\0\3\0009\0\4\0009\0\5\0006\2\0\0'\4\6\0B\2\2\0A\0\0\1K\0\1\0\19nvim-autopairs\19on_config_done\14autopairs\vplugin\6O\19core.autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType typescript.tsx ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "typescript.tsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType elixir ++once lua require("packer.load")({'vim-elixir'}, { ft = "elixir" }, _G.packer_plugins)]]
vim.cmd [[au FileType euphoria3 ++once lua require("packer.load")({'vim-elixir'}, { ft = "euphoria3" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript.jsx ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "javascript.jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType eelixir ++once lua require("packer.load")({'vim-elixir'}, { ft = "eelixir" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'vim-vsnip', 'nvim-ts-autotag', 'friendly-snippets', 'lsp_signature.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-comment', 'playground', 'numb.nvim', 'gitlinker.nvim', 'diffview.nvim', 'nvim-bqf', 'vim-gist', 'hop.nvim', 'gitsigns.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'nvim-lspinstall'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'vim-matchup'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'barbar.nvim', 'which-key.nvim', 'galaxyline.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/bam/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /Users/bam/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /Users/bam/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /Users/bam/.local/share/nvim/site/pack/packer/opt/vim-elixir/ftdetect/elixir.vim]], true)
vim.cmd [[source /Users/bam/.local/share/nvim/site/pack/packer/opt/vim-elixir/ftdetect/elixir.vim]]
time([[Sourcing ftdetect script at: /Users/bam/.local/share/nvim/site/pack/packer/opt/vim-elixir/ftdetect/elixir.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
