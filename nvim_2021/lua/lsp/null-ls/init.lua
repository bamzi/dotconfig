--local M = {}
--local lsp_cfg = require("lsp.config")
--
--
--local Log = require "core.log"
--
--function M:setup()
--	local status_ok, null_ls = pcall(require, "null-ls")
--	if not status_ok then
--		Log:error "Missing null-ls dependency"
--		return
--	end
--
--	null_ls.config(lsp_cfg.null_ls.config)
--	local default_opts = require("lsp").get_common_opts()
--
--	if vim.tbl_isempty(lsp_cfg.null_ls.setup or {}) then
--		lsp_cfg.null_ls.setup = default_opts
--	end
--
--	require("lspconfig")["null-ls"].setup(lsp_cfg.null_ls.setup)
--end
--
--return M

local M = {}

local Log = require "core.log"

function M:setup()
  local status_ok, null_ls = pcall(require, "null-ls")
  if not status_ok then
    Log:error "Missing null-ls dependency"
    return
  end

  local default_opts = require("lsp").get_common_opts()
  null_ls.setup(vim.tbl_deep_extend("force", default_opts, lsp.null_ls.setup))
end

return M
