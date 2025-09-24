-- in some lsp config file, e.g. lua/lsp/lua_ls.lua (or wherever your runtimepath includes)
vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },  -- remove trailing space
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      -- optionally other workspace settings, e.g.
      workspace = {
        library = {
          vim.fn.stdpath('config'),  -- for Neovim config
          vim.env.VIMRUNTIME,
        },
        checkThirdParty = false,
      },
    }
  }
})

-- then later in your startup (init.lua or a file that is sourced after that config)
vim.lsp.enable('lua_ls')

