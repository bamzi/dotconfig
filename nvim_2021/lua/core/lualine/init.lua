local M = {}
local lualine_cfg = require "core.lualine.cfg"


M.setup = function()
  require("core.lualine.styles").update()
  require("core.lualine.utils").validate_theme()

  local lualine = require "lualine"
  lualine.setup(lualine_cfg)

  if lualine_cfg.on_config_done then
    lualine_cfg.on_config_done(lualine)
  end
end

return M
