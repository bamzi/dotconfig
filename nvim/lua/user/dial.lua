local status_ok, dial_config = pcall(require, "dial.config")
if not status_ok then
  return
end

local augend = require "dial.augend"
dial_config.augends:register_group {
  default = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.date.alias["%Y/%m/%d"],
  },
  typescript = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.constant.new { elements = { "let", "const" } },
  },
  visual = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.date.alias["%Y/%m/%d"],
    augend.constant.alias.alpha,
    augend.constant.alias.Alpha,
  },
  mygroup = {
    augend.constant.new {
      elements = { "and", "or" },
      word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
      cyclic = true, -- "or" is incremented into "and".
    },
    augend.constant.new {
      elements = { "True", "False" },
      word = true,
      cyclic = true,
    },
    augend.constant.new {
      elements = { "public", "private" },
      word = true,
      cyclic = true,
    },
    augend.constant.new {
      elements = { "&&", "||" },
      word = false,
      cyclic = true,
    },
    augend.date.alias["%m/%d/%Y"], -- date (02/19/2022, etc.)
    augend.constant.alias.bool, -- boolean value (true <-> false)
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.semver.alias.semver
  },
}

local map = require "dial.map"

-- change augends in VISUAL mode
vim.api.nvim_set_keymap("n", "<C-a>", map.inc_normal "mygroup", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-x>", map.dec_normal "mygroup", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-a>", map.inc_normal "visual", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-x>", map.dec_normal "visual", { noremap = true })

vim.cmd [[
  " enable only for specific FileType
  autocmd FileType typescript,javascript lua vim.api.nvim_buf_set_keymap(0, "n", "<C-a>", require("dial.map").inc_normal("typescript"), {noremap = true})
]]

-- local status_ok, dial = pcall(require, "dial")
-- if not status_ok then
-- 	return
-- end
--
-- vim.cmd([[
--   nmap <C-a> <Plug>(dial-increment)
--   nmap <C-x> <Plug>(dial-decrement)
--   vmap <C-a> <Plug>(dial-increment)
--   vmap <C-x> <Plug>(dial-decrement)
--   vmap g<C-a> <Plug>(dial-increment-additional)
--   vmap g<C-x> <Plug>(dial-decrement-additional)
--   ]])
--
-- dial.augends["custom#boolean"] = dial.common.enum_cyclic({
-- 	name = "boolean",
-- 	strlist = { "true", "false" },
-- })
-- table.insert(dial.config.searchlist.normal, "custom#boolean")
--
-- -- For Languages which prefer True/False, e.g. python.
-- dial.augends["custom#Boolean"] = dial.common.enum_cyclic({
-- 	name = "Boolean",
-- 	strlist = { "True", "False" },
-- })
-- table.insert(dial.config.searchlist.normal, "custom#Boolean")
