local function init()
  require('lualine').setup {
    options = {
      extensions = { 'fzf', 'quickfix' },
      theme = 'gruvbox'
    }
  }
end

return {
  init = init
}
