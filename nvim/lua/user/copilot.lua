-- vim.g.copilot_filetypes = {
-- 	["*"] = false,
--  }
 
 vim.cmd [[
	imap <silent><script><expr> <C-v> copilot#Accept("\<CR>")
	let g:copilot_no_tab_map = v:true
 ]]
 