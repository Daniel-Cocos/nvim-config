local M = {}

function M.setup()
  vim.lsp.config('nixd', {})
  vim.lsp.enable('nixd')
end

return M
