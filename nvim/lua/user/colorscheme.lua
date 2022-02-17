-- vim.cmd [[
-- try
--   colorscheme bamzi
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme darkplus
--   set background=dark
-- endtry
-- ]]

local colorscheme = "bamzi"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end