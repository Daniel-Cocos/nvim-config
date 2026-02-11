local M = {}

function M.setup(capabilities)
  local lspconfig = require("lspconfig")

  lspconfig.jdtls.setup({
    capabilities = capabilities,
  })
end

return M
