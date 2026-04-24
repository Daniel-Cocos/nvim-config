local M = {}

function M.setup()
  vim.lsp.config('clangd', {})
  vim.lsp.enable('clangd')
end

return M
