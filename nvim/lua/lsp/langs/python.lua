local M = {}

local function get_poetry_venv()
  local handle = io.popen("poetry env info -p 2>/dev/null")
  if handle then
    local result = handle:read("*a")
    handle:close()
    result = result:gsub("%s+$", "")
    if result ~= "" then
      return result
    end
  end
  return nil
end

function M.setup(capabilities)
  local lspconfig = require("lspconfig")

  lspconfig.pyright.setup({
    capabilities = capabilities,
    before_init = function(_, config)
      local venv = get_poetry_venv()
      if venv then
        config.settings.python.pythonPath = venv .. "/bin/python"
        config.settings.python.venvPath = vim.fn.fnamemodify(venv, ":h")
        config.settings.python.venv = vim.fn.fnamemodify(venv, ":t")
      end
    end,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace",
          typeCheckingMode = "basic",
        },
      },
    },
  })
end

return M
