local opts = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "nvim" },
      },
      workspace = {
        library = {
          [require("utils").join_paths(get_runtime_dir(), "nvim", "lua")] = true,
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}
return opts