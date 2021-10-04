local M = {}
local Log = require "core.log"
local tree_config = {}
function M.config()
  tree_config = {
    active = true,
    on_config_done = nil,
    setup = {
      auto_open = 0,
      auto_close = 1,
      tab_open = 0,
      update_focused_file = {
        enable = 1,
      },
      lsp_diagnostics = 1,
      view = {
        width = 30,
        side = "left",
        auto_resize = false,
        mappings = {
          custom_only = false,
        },
      },
    },
    show_icons = {
      git = 1,
      folders = 1,
      files = 1,
      folder_arrows = 1,
      tree_width = 30,
    },
    ignore = { ".git", "node_modules", ".cache" },
    quit_on_open = 0,
    hide_dotfiles = 1,
    git_hl = 1,
    root_folder_modifier = ":t",
    allow_resize = 1,
    auto_ignore_ft = { "startify", "dashboard" },
    icons = {
      default = "",
      symlink = "",
      git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌",
      },
      folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
      },
    },
  }
end

function M.setup()
  local status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
  if not status_ok then
    Log:error "Failed to load nvim-tree.config"
    return
  end
  local g = vim.g

  for opt, val in pairs(tree_config) do
    g["nvim_tree_" .. opt] = val
  end

  -- Implicitly update nvim-tree when project module is active
  tree_config.respect_buf_cwd = 1
  tree_config.setup.update_cwd = 1
  tree_config.setup.disable_netrw = 0
  tree_config.setup.hijack_netrw = 0
  vim.g.netrw_banner = 0

  local tree_cb = nvim_tree_config.nvim_tree_callback

  if not tree_config.setup.view.mappings.list then
    tree_config.setup.view.mappings.list = {
      { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
      { key = "h", cb = tree_cb "close_node" },
      { key = "v", cb = tree_cb "vsplit" },
    }
  end

  -- which_key.mappings["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" }

  local tree_view = require "nvim-tree.view"

  -- Add nvim_tree open callback
  local open = tree_view.open
  tree_view.open = function()
    M.on_open()
    open()
  end

  vim.cmd "au WinClosed * lua require('core.nvimtree').on_close()"

  if tree_config.on_config_done then
    tree_config.on_config_done(nvim_tree_config)
  end
  require("nvim-tree").setup(tree_config.setup)
end

function M.on_open()
  if package.loaded["bufferline.state"] and tree_config.setup.view.side == "left" then
    require("bufferline.state").set_offset(tree_config.setup.view.width + 1, "")
  end
end

function M.on_close()
  local buf = tonumber(vim.fn.expand "<abuf>")
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")
  if ft == "NvimTree" and package.loaded["bufferline.state"] then
    require("bufferline.state").set_offset(0)
  end
end

function M.change_tree_dir(dir)
  local lib_status_ok, lib = pcall(require, "nvim-tree.lib")
  if lib_status_ok then
    lib.change_dir(dir)
  end
end

return M


-- local M = {}
-- local Log = require "core.log"
-- --
-- local tree_config = {}
-- M.config = function()
--   tree_config = {
--     active = true,
--     side = "left",
--     width = 30,
--     show_icons = {
--       git = 1,
--       folders = 1,
--       files = 1,
--       folder_arrows = 1,
--       tree_width = 30,
--     },
--     ignore = { ".git", "node_modules", ".cache" },
--     auto_open = 0,
--     auto_close = 1,
--     quit_on_open = 0,
--     follow = 1,
--     hide_dotfiles = 1,
--     git_hl = 1,
--     root_folder_modifier = ":t",
--     tab_open = 0,
--     allow_resize = 1,
--     lsp_diagnostics = 1,
--     auto_ignore_ft = { "startify", "dashboard" },
--     icons = {
--       default = "",
--       symlink = "",
--       git = {
--         unstaged = "",
--         staged = "S",
--         unmerged = "",
--         renamed = "➜",
--         deleted = "",
--         untracked = "U",
--         ignored = "◌",
--       },
--       folder = {
--         default = "",
--         open = "",
--         empty = "",
--         empty_open = "",
--         symlink = "",
--       },
--     },
--   }
-- end
-- --
-- M.setup = function()
--   local status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
--   if not status_ok then
--     Log:get_default().error "Failed to load nvim-tree.config"
--     return
--   end
--   local g = vim.g

--   for opt, val in pairs(tree_config) do
--     g["nvim_tree_" .. opt] = val
--   end

--   -- Implicitly update nvim-tree when project module is active
--     vim.g.nvim_tree_update_cwd = 1
--     vim.g.nvim_tree_respect_buf_cwd = 1

--   local tree_cb = nvim_tree_config.nvim_tree_callback

--   if not g.nvim_tree_bindings then
--     g.nvim_tree_bindings = {
--       { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
--       { key = "h", cb = tree_cb "close_node" },
--       { key = "v", cb = tree_cb "vsplit" },
--       { key = "q", cb = ":lua require('core.nvimtree').toggle_tree()<cr>" },
--     }
--   end
-- end
-- --
-- M.focus_or_close = function()
--   local view_status_ok, view = pcall(require, "nvim-tree.view")
--   if not view_status_ok then
--     return
--   end
--   local a = vim.api

--   local curwin = a.nvim_get_current_win()
--   local curbuf = a.nvim_win_get_buf(curwin)
--   local bufnr = view.View.bufnr
--   local winnr = view.get_winnr()

--   if view.win_open() then
--     if curwin == winnr and curbuf == bufnr then
--       view.close()
--       if package.loaded["bufferline.state"] then
--         require("bufferline.state").set_offset(0)
--       end
--     else
--       view.focus()
--     end
--   else
--     view.open()
--     if package.loaded["bufferline.state"] and tree_config.side == "left" then
--       -- require'bufferline.state'.set_offset(tree_config.width + 1, 'File Explorer')
--       require("bufferline.state").set_offset(tree_config.width + 1, "")
--     end
--   end
-- end
-- --
-- M.toggle_tree = function()
--   local view_status_ok, view = pcall(require, "nvim-tree.view")
--   if not view_status_ok then
--     return
--   end
--   if view.win_open() then
--     require("nvim-tree").close()
--     if package.loaded["bufferline.state"] then
--       require("bufferline.state").set_offset(0)
--     end
--   else
--     if package.loaded["bufferline.state"] and tree_config.side == "left" then
--       -- require'bufferline.state'.set_offset(tree_config.width + 1, 'File Explorer')
--       require("bufferline.state").set_offset(tree_config.width + 1, "")
--     end
--     require("nvim-tree").toggle()
--   end
-- end
-- --
-- function M.change_tree_dir(dir)
--   if vim.g.loaded_tree then
--     require("nvim-tree.lib").change_dir(dir)
--   end
-- end
-- --
-- return M
