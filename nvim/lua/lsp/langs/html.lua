local M = {}

function M.setup(capabilities)
  local lspconfig = require("lspconfig")

  lspconfig.html.setup({
    capabilities = capabilities,
  })
end

return M
