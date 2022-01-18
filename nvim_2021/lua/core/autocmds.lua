local M = {}
local Log = require "core.log"

local format_on_save = {
  ---@usage pattern string pattern used for the autocommand (Default: '*')
  pattern = "*",
  ---@usage timeout number timeout in ms for the format request (Default: 1000)
  timeout = 1000,
}
--- Load the default set of autogroups and autocommands.
function M.load_augroups()
  local user_config_file = require("config"):get_user_config_path()

  if vim.loop.os_uname().version:match "Windows" then
    -- autocmds require forward slashes even on windows
    user_config_file = user_config_file:gsub("\\", "/")
  end

  return {
    _general_settings = {
      { "FileType", "qf,help,man", "nnoremap <silent> <buffer> q :close<CR>" },
      {
        "TextYankPost",
        "*",
        "lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})",
      },
      {
        "BufWinEnter",
        "dashboard",
        "setlocal cursorline signcolumn=yes cursorcolumn number",
      },
      { "BufWritePost", user_config_file, "lua require('config'):reload()" },
      { "FileType", "qf", "set nobuflisted" },
      -- { "VimLeavePre", "*", "set title set titleold=" },
    },
    _formatoptions = {
      {
        "BufWinEnter,BufRead,BufNewFile",
        "*",
        "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
      },
    },
    _filetypechanges = {
      { "BufWinEnter", ".tf", "setlocal filetype=terraform" },
      { "BufRead", "*.tf", "setlocal filetype=terraform" },
      { "BufNewFile", "*.tf", "setlocal filetype=terraform" },
      { "BufWinEnter", ".zsh", "setlocal filetype=sh" },
      { "BufRead", "*.zsh", "setlocal filetype=sh" },
      { "BufNewFile", "*.zsh", "setlocal filetype=sh" },
    },
    _git = {
      { "FileType", "gitcommit", "setlocal wrap" },
      { "FileType", "gitcommit", "setlocal spell" },
    },
    _markdown = {
      { "FileType", "markdown", "setlocal wrap" },
      { "FileType", "markdown", "setlocal spell" },
    },
    _buffer_bindings = {
      { "FileType", "floaterm", "nnoremap <silent> <buffer> q :q<CR>" },
    },
    _auto_resize = {
      -- will cause split windows to be resized evenly if main window is resized
      { "VimResized", "*", "tabdo wincmd =" },
    },
    _general_lsp = {
      { "FileType", "lspinfo,lsp-installer,null-ls-info", "nnoremap <silent> <buffer> q :close<CR>" },
    },
    custom_groups = {},
  }
end

local get_format_on_save_opts = function()
  return {
    format_on_save
  }
end

function M.enable_format_on_save(opts)
  local fmd_cmd = string.format(":silent lua vim.lsp.buf.formatting_sync({}, %s)", opts.timeout_ms)
  M.define_augroups {
    format_on_save = { { "BufWritePre", opts.pattern, fmd_cmd } },
  }
  Log:debug "enabled format-on-save"
end

function M.disable_format_on_save()
  M.remove_augroup "format_on_save"
  Log:debug "disabled format-on-save"
end

function M.configure_format_on_save()
  if format_on_save then
    if vim.fn.exists "#format_on_save#BufWritePre" == 1 then
      M.remove_augroup "format_on_save"
      Log:debug "reloading format-on-save configuration"
    end
    local opts = get_format_on_save_opts()
    M.enable_format_on_save(opts)
  else
    M.disable_format_on_save()
  end
end

function M.toggle_format_on_save()
  if vim.fn.exists "#format_on_save#BufWritePre" == 0 then
    local opts = get_format_on_save_opts()
    M.enable_format_on_save(opts)
  else
    M.disable_format_on_save()
  end
end

function M.remove_augroup(name)
  if vim.fn.exists("#" .. name) == 1 then
    vim.cmd("au! " .. name)
  end
end

function M.define_augroups(definitions) -- {{{1
  -- Create autocommand groups based on the passed definitions
  --
  -- The key will be the name of the group, and each definition
  -- within the group should have:
  --    1. Trigger
  --    2. Pattern
  --    3. Text
  -- just like how they would normally be defined from Vim itself
  for group_name, definition in pairs(definitions) do
    vim.cmd("augroup " .. group_name)
    vim.cmd "autocmd!"

    for _, def in pairs(definition) do
      local command = table.concat(vim.tbl_flatten { "autocmd", def }, " ")
      vim.cmd(command)
    end

    vim.cmd "augroup END"
  end
end

return M


-- local autocommands =  {
--   _general_settings = {
--     {
--       "Filetype",
--       "*",
--       "lua require('utils.ft').do_filetype(vim.fn.expand(\"<amatch>\"))",
--     },
--     {
--       "TextYankPost",
--       "*",
--       "lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})",
--     },
--     {
--       "BufWinEnter",
--       "*",
--       "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
--     },
--     {
--       "BufWinEnter",
--       "dashboard",
--       "setlocal cursorline signcolumn=yes cursorcolumn number",
--     },
--     {
--       "BufRead",
--       "*",
--       "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
--     },
--     {
--       "BufNewFile",
--       "*",
--       "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
--     },
--     { "BufWritePost", USER_CONFIG_PATH, "lua require('utils').reload_lv_config()" },
--     {
--       "FileType",
--       "qf",
--       "set nobuflisted",
--     },
--     -- { "VimLeavePre", "*", "set title set titleold=" },
--   },
--   _filetypechanges = {
--     { "BufWinEnter", ".tf", "setlocal filetype=terraform" },
--     { "BufRead", "*.tf", "setlocal filetype=terraform" },
--     { "BufNewFile", "*.tf", "setlocal filetype=terraform" },
--     { "BufWinEnter", ".zsh", "setlocal filetype=sh" },
--     { "BufRead", "*.zsh", "setlocal filetype=sh" },
--     { "BufNewFile", "*.zsh", "setlocal filetype=sh" },
--   },
--   -- _solidity = {
--   --     {'BufWinEnter', '.sol', 'setlocal filetype=solidity'}, {'BufRead', '*.sol', 'setlocal filetype=solidity'},
--   --     {'BufNewFile', '*.sol', 'setlocal filetype=solidity'}
--   -- },
--   -- _gemini = {
--   --     {'BufWinEnter', '.gmi', 'setlocal filetype=markdown'}, {'BufRead', '*.gmi', 'setlocal filetype=markdown'},
--   --     {'BufNewFile', '*.gmi', 'setlocal filetype=markdown'}
--   -- },
--   _git = {
--     { "FileType", "gitcommit", "setlocal wrap" },
--     { "FileType", "gitcommit", "setlocal spell" },
--   },
--   _markdown = {
--     { "FileType", "markdown", "setlocal wrap" },
--     { "FileType", "markdown", "setlocal spell" },
--   },
--   _buffer_bindings = {
--     { "FileType", "floaterm", "nnoremap <silent> <buffer> q :q<CR>" },
--   },
--   _auto_resize = {
--     -- will cause split windows to be resized evenly if main window is resized
--     { "VimResized", "*", "wincmd =" },
--   },
--   _packer_compile = {
--     -- will run PackerCompile after writing plugins.lua
--     { "BufWritePost", "plugins.lua", "PackerCompile" },
--   },
--   _general_lsp = {
--     { "FileType", "lspinfo", "nnoremap <silent> <buffer> q :q<CR>" },
--   },

--   -- _fterm_lazygit = {
--   --   -- will cause esc key to exit lazy git
--   --   {"TermEnter", "*", "call LazyGitNativation()"}
--   -- },
--   -- _mode_switching = {
--   --   -- will switch between absolute and relative line numbers depending on mode
--   --   {'InsertEnter', '*', 'if &relativenumber | let g:ms_relativenumberoff = 1 | setlocal number norelativenumber | endif'},
--   --   {'InsertLeave', '*', 'if exists("g:ms_relativenumberoff") | setlocal relativenumber | endif'},
--   --   {'InsertEnter', '*', 'if &cursorline | let g:ms_cursorlineoff = 1 | setlocal nocursorline | endif'},
--   --   {'InsertLeave', '*', 'if exists("g:ms_cursorlineoff") | setlocal cursorline | endif'},
--   -- },
--   custom_groups = {},
-- }

-- function autocommands.define_augroups(definitions) -- {{{1
--   -- Create autocommand groups based on the passed definitions
--   --
--   -- The key will be the name of the group, and each definition
--   -- within the group should have:
--   --    1. Trigger
--   --    2. Pattern
--   --    3. Text
--   -- just like how they would normally be defined from Vim itself
--   for group_name, definition in pairs(definitions) do
--     vim.cmd("augroup " .. group_name)
--     vim.cmd "autocmd!"

--     for _, def in pairs(definition) do
--       local command = table.concat(vim.tbl_flatten { "autocmd", def }, " ")
--       vim.cmd(command)
--     end

--     vim.cmd "augroup END"
--   end
-- end

-- return autocommands
