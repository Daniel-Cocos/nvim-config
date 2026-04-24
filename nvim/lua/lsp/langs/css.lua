local M = {}

function M.setup()
  vim.lsp.config('cssls', {})
  vim.lsp.enable('cssls')
end

return M
