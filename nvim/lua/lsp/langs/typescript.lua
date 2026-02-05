local M = {}

function M.setup(capabilities)
  local lspconfig = require("lspconfig")

  lspconfig.ts_ls.setup({
    capabilities = capabilities,
  })
end

return M
