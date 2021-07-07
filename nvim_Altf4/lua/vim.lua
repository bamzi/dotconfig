local function set_augroup()
  vim.api.nvim_command("augroup WrapInMarkdown")
  vim.api.nvim_command("autocmd!")
  vim.api.nvim_command("autocmd FileType markdown setlocal wrap")
  vim.api.nvim_command("augroup END")
end

local function set_vim_g()
  vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
  vim.g.mapleader = ' '
end

local function set_vim_o()
  local settings = {
    backup = false,
    errorbells = false,
    expandtab = false,
    hidden = true,
    scrolloff = 3,
    softtabstop = 2,
    showmode = true,
    termguicolors = true,
    mouse = "a"
  }


  -- Generic vim.o
  for k, v in pairs(settings) do
    vim.o[k] = v
  end
  vim.cmd('set sw=2') -- Change the number of space characters inserted for indentation
  vim.cmd('set noexpandtab')
  vim.cmd('filetype plugin on')

  vim.o.guifont = "MesloLGM Nerd Font:h17"
  vim.g.nvim_tree_disable_netrw = true
  -- Custom vim.o
  vim.o.clipboard = 'unnamedplus'
  vim.o.shortmess = vim.o.shortmess .. 'c'
  vim.o.splitbelow = true -- Horizontal splits will automatically be below
  -- vim.o.termguicolors = true -- set term gui colors most terminals support this
  vim.o.splitright = true -- Vertical splits will automatically be to the right
  -- vim.o.t_Co = "256" -- Support 256 colors
  vim.o.conceallevel = 0 -- So that I can see `` in markdown files
  vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
  vim.o.cmdheight = 2
  vim.o.pumheight = 10 -- Makes popup menu smaller
  vim.o.fileencoding = "utf-8"
  -- Not yet in vim.o
  vim.cmd('set encoding=utf8')
  vim.cmd('set nowritebackup')
  vim.cmd('set shiftwidth=2')
  vim.cmd('set secure')
  vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
  vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
  vim.cmd('set inccommand=split') -- Make substitution work in realtime
  -- vim.cmd('set splitright')
  vim.cmd('set tabstop=2')
  vim.cmd('set updatetime=300')

  vim.cmd('set completeopt=menuone,noselect')
  vim.cmd('set colorcolumn=88') 
  vim.cmd('set wrap') 
  vim.cmd('set linebreak') 
  vim.cmd('set tw=110') 

  vim.cmd('let g:gruvbox_contrast_dark="hard"')
  vim.cmd('let g:gruvbox_bold=0')
  vim.cmd('let g:gruvbox_invert_selection=0')
  vim.cmd('highlight ColorColumn ctermbg=0 guibg=lightgrey')

  vim.cmd('colorscheme gruvbox')
  vim.cmd('set background=dark')

  vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
  vim.cmd('syntax on') -- syntax highlighting
end

local function set_vim_wo()
  vim.wo.number = true
  vim.wo.relativenumber = true
  vim.wo.wrap = false
end

local function set_keymaps()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = false }

  

-- no hl
  vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':set hlsearch!<CR>', {noremap = true, silent = true})

-- explorer
  vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

  vim.api.nvim_set_keymap('n', '-', ':RnvimrToggle<CR>', {noremap = true, silent = true})

  vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
  vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
  vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
  vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

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

  vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', {silent = true})
  vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', {silent = true})
  vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', {silent = true})
  vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', {silent = true})

  -- better indenting
  vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

  -- I hate escape
  vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})

  -- Tab switch buffer
  vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

  -- Move selected line / block of text in visual mode
  vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

  -- Better nav for omnicomplete
  vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
  vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

  -- fix to get netrw's gx command to work correctly
  -- vim.api.nvim_set_keymap('n', 'gx', ":call netrw#BrowseX(expand((exists('g:netrw_gx')? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())<cr>", {noremap = true, silent = true})

  vim.cmd('vnoremap p "0p')
  vim.cmd('vnoremap P "0P')

  vim.api.nvim_set_keymap("n", "<leader>bd", ":bd<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>bD", ":bd!<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>bA", ":bufdo! bd<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>bn", ":bnext<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>bv", ":bprevious<CR>", {noremap = true, silent = true})
  -- Toggle the QuickFix window
  vim.api.nvim_set_keymap('', '<C-q>', ':call QuickFixToggle()<CR>', {noremap = true, silent = true})

  -- vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {noremap = true, silent = true, expr = true})
  -- vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {noremap = true, silent = true, expr = true})
  -- vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {noremap = true, silent = true, expr = true})
  -- vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {noremap = true, silent = true, expr = true})
  -- vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {noremap = true, silent = true, expr = true})

  ---
  vim.g.matchup_matchparen_offscreen = {method = 'popup'}
end


local function init()
  set_augroup()
  set_vim_g()
  set_vim_o()
  set_vim_wo()
  set_keymaps()
end

return {
  init = init
}
