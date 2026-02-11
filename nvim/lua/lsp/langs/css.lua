local M = {}

function M.setup(capabilities)
  local lspconfig = require("lspconfig")

  lspconfig.cssls.setup({
    capabilities = capabilities,
  })
end

return M
