-- local M = {}
-- local comm_config = {}
-- function M.config()
--   comm_config = {
--     active = true,
--     -- Linters prefer comment and line to have a space in between markers
--     marker_padding = true,
--     -- should comment out empty or whitespace only lines
--     comment_empty = false,
--     -- Should key mappings be created
--     create_mappings = true,
--     -- Normal mode mapping left hand side
--     line_mapping = "gcc",
--     -- Visual/Operator mapping left hand side
--     operator_mapping = "gc",
--     -- Hook function to call before commenting takes place
--     hook = nil,
--   }
-- end

-- function M.setup()
--   require("nvim_comment").setup(comm_config)
-- end

-- return M

local M = {}
local comm_config = {}
function M.config()
  local pre_hook = nil
    pre_hook = function(_ctx)
      return require("ts_context_commentstring.internal").calculate_commentstring()
    end
  comm_config = {
    active = true,
    on_config_done = nil,
    ---Add a space b/w comment and the line
    ---@type boolean
    padding = true,

    ---Lines to be ignored while comment/uncomment.
    ---Could be a regex string or a function that returns a regex string.
    ---Example: Use '^$' to ignore empty lines
    ---@type string|function
    ignore = "^$",

    ---Whether to create basic (operator-pending) and extra mappings for NORMAL/VISUAL mode
    ---@type table
    mappings = {
      ---operator-pending mapping
      ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
      basic = true,
      ---extended mapping
      ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
      extra = false,
    },

    ---LHS of line and block comment toggle mapping in NORMAL/VISUAL mode
    ---@type table
    toggler = {
      ---line-comment toggle
      line = "gcc",
      ---block-comment toggle
      block = "gbc",
    },

    ---LHS of line and block comment operator-mode mapping in NORMAL/VISUAL mode
    ---@type table
    opleader = {
      ---line-comment opfunc mapping
      line = "gc",
      ---block-comment opfunc mapping
      block = "gb",
    },

    ---Pre-hook, called before commenting the line
    ---@type function|nil
    pre_hook = pre_hook,

    ---Post-hook, called after commenting is done
    ---@type function|nil
    post_hook = nil,
  }
end

function M.setup()
  local nvim_comment = require "Comment"

  nvim_comment.setup(comm_config)
  if comm_config.on_config_done then
    comm_config.on_config_done(nvim_comment)
  end
end

return M
