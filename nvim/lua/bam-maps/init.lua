local map = vim.api.nvim_set_keymap
local options = { noremap = true }

-- HOP
require('hop').setup{}
map('n', ';1', '<CMD>HopChar1<CR>', options)
map('n', ';2', '<CMD>HopChar2<CR>', options)
map('n', ';p', '<CMD>HopPattern<CR>', options)
map('n', ';l', '<CMD>HopLine<CR>', options)
map('n', ';w', '<CMD>HopWord<CR>', options)

-- TELESCOPE
-- Key Maps
local teleOptions = { noremap = true, silent = true }
-- Builtin
map('n', '<leader>fe', ':Telescope file_browser cwd=vim.fn.expand("%:p:h")<CR>', teleOptions)
map('n', '<leader>fg', ':Telescope git_files<CR>', teleOptions)
map('n', '<leader>ff', ':Telescope find_files hidden=true<CR>', teleOptions) -- 
map('n', '<leader>fl', ':Telescope live_grep<CR>', teleOptions)
map('n', '<leader>fb', ':Telescope buffers<CR>', teleOptions)
map('n', '<leader>fh', ':Telescope help_tags<CR>', teleOptions)
map('n', '<leader>fd', ':Telescope lsp_workspace_diagnostics<CR>', teleOptions)

-- Extensions
map('n', '<leader>fs', ':lua require("telescope").extensions["session-lens"].search_session<CR>', teleOptions)
map('n', '<leader>fw', ':lua require("telescope").extensions.git_worktree.git_worktrees<CR>', teleOptions)

local gwOptions = { noremap = true, silent = true }

-- Git Worktree
map('n', '<leader>wc', '<CMD>lua require("git-worktree").create_worktree(vim.fn.input("Worktree name > "), vim.fn.input("Worktree upstream > "))<CR>', options)
  map('n', '<leader>ws', '<CMD>lua require("git-worktree").switch_worktree(vim.fn.input("Worktree name > "))<CR>', options)
  map('n', '<leader>wd', '<CMD>lua require("git-worktree").delete_worktree(vim.fn.input("Worktree name > "))<CR>', options)