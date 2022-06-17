local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smarttab = true, -- smart tab
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 100, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = false, -- convert tabs to spaces
	shiftwidth = 3, -- the number of spaces inserted for each indentation
	-- softtabstop = 3,                         -- the number of spaces inserted for each indentation
	tabstop = 3, -- insert 32 spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	laststatus = 3,
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = true, -- display lines as one long line
	autoread = true, -- automatically read files when they are opened
	scrolloff = 8, -- is one of my fav
	sidescrolloff = 8,
	guifont = "monospace:h17", -- the font used in graphical neovim applications
	autoindent = true, -- auto indent
	cindent = true, -- auto indent
	showcmd = true, -- show the command line
	ruler = true, -- show the ruler
	incsearch = true, -- show incremental search
	colorcolumn = "99", -- highlight the column 80
	mousemodel = "extend", -- extend the mouse
	foldmethod = "manual", -- fold
	foldexpr = "", -- fold
	-- conceallevel  = 2,
	spelllang = "en",
	spell = false,
}

vim.opt.fillchars.eob = " "
vim.opt.shortmess:append "c"

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd "set noswapfile"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

vim.filetype.add({
	extension = {
		conf = "dosini",
	},
})


-----
-- Default options:
require('kanagawa').setup({
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	variablebuiltinStyle = { italic = true },
	specialReturn = true, -- special highlight for the return keyword
	specialException = true, -- special highlight for exception handling keywords
	transparent = false, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	globalStatus = false, -- adjust window separators highlight for laststatus=3
	colors = {},
	overrides = {},
})

-- setup must be called before loading
-- vim.cmd("colorscheme kanagawa")


-- NEO ZOOM
require('neo-zoom').setup {}
