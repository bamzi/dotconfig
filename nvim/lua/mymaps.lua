local M = {}

local map = vim.api.nvim_set_keymap
local options = { noremap = true }

M.start = function()
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
  map('n', '<leader>ff', ':Telescope find_files hidden=true<CR>', teleOptions)
  map('n', '<C-f>', ':Telescope git_files hidden=true<CR>', teleOptions) -- 
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





end

return M