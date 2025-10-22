return {
  servers = {
    {
      name = "lua_ls",
      opts = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      },
    },
  },
  formatters = {
    lua = { "stylua" },
  },
}
