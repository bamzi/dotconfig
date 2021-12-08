local M = {}

local Log = require "core.log"
local myvim_lsp_utils = require "lsp.utils"
local lspconf = require("lspconfigx")

function M.init_defaults(languages)
  for _, entry in ipairs(languages) do
    if not lspconf.lang[entry] then
      lspconf.lang[entry] = {
        formatters = {},
        linters = {},
        lsp = {},
      }
    end
  end
end

---Resolve the configuration for a server based on both common and user configuration
---@param name string
---@param user_config table [optional]
---@return table
local function resolve_config(name, user_config)
  local config = {
    on_attach = require("lsp").common_on_attach,
    on_init = require("lsp").common_on_init,
    capabilities = require("lsp").common_capabilities(),
  }

  local has_custom_provider, custom_config = pcall(require, "lsp/providers/" .. name)
  if has_custom_provider then
    Log:debug("Using custom configuration for requested server: " .. name)
    config = vim.tbl_deep_extend("force", config, custom_config)
  end

  if user_config then
    config = vim.tbl_deep_extend("force", config, user_config)
  end

  return config
end

-- manually start the server and don't wait for the usual filetype trigger from lspconfig
local function buf_try_add(server_name, bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  require("lspconfig")[server_name].manager.try_add_wrapper(bufnr)
end

---Setup a language server by providing a name
---@param server_name string name of the language server
---@param user_config table [optional] when available it will take predence over any default configurations
function M.setup(server_name, user_config)
  vim.validate { name = { server_name, "string" } }

  if myvim_lsp_utils.is_client_active(server_name) then
    return
  end

  local config = resolve_config(server_name, user_config)

  local servers = require "nvim-lsp-installer.servers"
  local server_available, requested_server = servers.get_server(server_name)

  local is_overridden = vim.tbl_contains(lspconf.lsp.override, server_name)

  if not server_available or is_overridden then
    pcall(function()
      require("lspconfig")[server_name].setup(config)
      buf_try_add(server_name)
    end)
    return
  end

  local install_notification = false

  if not requested_server:is_installed() then
    if lspconf.lsp.automatic_servers_installation then
      Log:debug "Automatic server installation detected"
      requested_server:install()
      install_notification = true
    else
      Log:debug(requested_server.name .. " is not managed by the automatic installer")
    end
  end

  requested_server:on_ready(function()
    if install_notification then
      vim.notify(string.format("Installation complete for [%s] server", requested_server.name), vim.log.levels.WARN)
    end
    install_notification = false
    requested_server:setup(config)
  end)
end

return M
