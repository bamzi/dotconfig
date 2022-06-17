-- lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- lspconfig.gopls.setup {
return {
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	-- on_attach = on_attach,
	settings = {
		gopls = {
			usePlaceholders = true,
			analyses = {
				nilness = true,
				shadow = true,
				unusedparams = true,
				unusedwrite = true,
			},
			staticcheck = true,
			-- local	= "goimports -local"
		},
		-- document_formatting = true,
	},
}
