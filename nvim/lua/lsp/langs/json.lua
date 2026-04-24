local M = {}

function M.setup()
  vim.lsp.config('jsonls', {})
  vim.lsp.enable('jsonls')
end

return M
