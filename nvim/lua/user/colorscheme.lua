vim.cmd [[
try
  colorscheme bamzi
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme darkplus
  set background=dark
endtry
]]
