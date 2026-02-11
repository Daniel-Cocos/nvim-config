local M = {}

function M.setup(capabilities)
  local lspconfig = require("lspconfig")

  lspconfig.jsonls.setup({
    capabilities = capabilities,
  })
end

return M
