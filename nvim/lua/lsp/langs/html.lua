local M = {}

function M.setup()
  vim.lsp.config('html', {})
  vim.lsp.enable('html')
end

return M
