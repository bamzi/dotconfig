local map = vim.api.nvim_set_keymap

local mapOpts = { noremap = true }

local opts = {
  auto_session_enabled = true,
  auto_save_enabled = false,
  auto_restore_enabled = true,
  auto_session_enable_last_session=true,
}

require'auto-session'.setup(opts)

map('n', '<leader>ss', '<CMD>SaveSession<CR>', mapOpts)
map('n', '<leader>se', '<CMD>RestoreSession<CR>', mapOpts)
map('n', '<leader>sx', '<CMD>DeleteSession<CR>', mapOpts)

require'session-lens'.setup{
  shorten_path = false,
  -- theme_conf = { border = false },
  prompt_title = 'SESSIONS',
  previewer = true
}
map('n', '<leader>sh', '<CMD>Telescope session-lens search_session<CR>', mapOpts)
map('n', '<leader>sa', '<CMD>SearchSession<CR>', mapOpts)