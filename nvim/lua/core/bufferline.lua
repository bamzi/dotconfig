local M = {}
local bufferline_config = {}
M.config = function()
  bufferline_config = {
    active = true,
    keymap = {
      normal_mode = {
        ["<S-l>"] = ":BufferNext<CR>",
        ["<S-h>"] = ":BufferPrevious<CR>",
      },
    },
  }
end

M.setup = function()
  local keymap = require "keymappings"
  keymap.append_to_defaults(bufferline_config.keymap)
end

return M
