local function init()
  require'nvim-treesitter.configs'.setup{
    -- ensure_installed = {
    --   'bash',
    --   'css',
    --   'dockerfile',
    --   'go',
    --   'gomod',
    --   'graphql',
    --   'html',
    --   'javascript',
    --   'jsdoc',
    --   'json',
    --   'lua',
    --   'python',
    --   'rust',
    --   'svelte',
    --   'tsx',
    --   'typescript',
    --   'yaml',
    --   -- 'terraform',
    --   -- 'tailwindcss'
    -- },
    ensure_installed = "all",
    ignore_install = { "haskell" },
    highlight = {
      enable = true
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    indent = {
      enable = true
    },
    rainbow = {
      enable = true,
      extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
      max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    },
  }

  --vim.cmd[[set foldmethod=expr]]
  --vim.cmd[[set foldexpr=nvim_treesitter#foldexpr()]]
end

return {
  init = init
}
