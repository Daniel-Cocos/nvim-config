return {
  servers = {
    {
      name = "pyright",
      opts = {
        settings = {
          pyright = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
            },
          },
        },
        -- This function runs when the LSP attaches to a buffer
        on_init = function(client)
          -- Force the LSP to use the python executable from current $PATH
          -- This allows it to see libraries from Nix shells or Poetry environments
          local python_path = vim.fn.exepath("python")
          if client.config.settings then
             client.config.settings.python = { pythonPath = python_path }
          else
             client.config.settings = { python = { pythonPath = python_path } }
          end
          -- Notify the server of the configuration change
          client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
          return true
        end,
      },
    },
  },
  formatters = {
    python = { "isort", "black" }, -- or "ruff_format" I'll do some more research
  },
  linters = {
    python = { "ruff" },
  },
}
