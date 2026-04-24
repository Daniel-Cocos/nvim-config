local M = {}

function M.setup()
  vim.lsp.config('jdtls', {})
  vim.lsp.enable('jdtls')
end

return M
