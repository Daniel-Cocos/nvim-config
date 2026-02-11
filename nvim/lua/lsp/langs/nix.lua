local M = {}

function M.setup(capabilities)
  local lspconfig = require("lspconfig")

  lspconfig.nixd.setup({
    capabilities = capabilities,
  })
end

return M
