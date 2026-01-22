local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  local blink = require("blink.cmp")

  local capabilities = blink.get_lsp_capabilities()

  local servers = {
    pyright = {
      settings = {
        pyright = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = "workspace",
          },
        },
      },
      on_init = function(client)
        -- This finds the 'python' executable in the current $PATH (Nix shell/Poetry)
        -- and tells the LSP to use it for imports.
        local python_path = vim.fn.exepath("python")
        if client.config.settings then
          client.config.settings.python = { pythonPath = python_path }
        else
          client.config.settings = { python = { pythonPath = python_path } }
        end
        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        return true
      end,
    },

    -- --- LUA ---
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    },

    -- --- C / C++ ---
    clangd = {},

    -- --- WEB (JS/TS/HTML/CSS) ---
    ts_ls = {}, -- For TypeScript/JavaScript
    html = {},
    cssls = {},
    jsonls = {},

    -- --- JAVA ---
    -- Note: Java is complex. If this simple setup fails, you might need 'nvim-jdtls' plugin.
    jdtls = {},
  }

  -- Loop through the servers and set them up
  for name, config in pairs(servers) do
    -- Merge the blink capabilities into the server config
    config.capabilities = vim.tbl_deep_extend("force", capabilities, config.capabilities or {})

    -- actually setup the server
    lspconfig[name].setup(config)
  end
end

return M
