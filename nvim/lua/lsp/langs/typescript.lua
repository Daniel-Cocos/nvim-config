local M = {}

function M.setup()
  vim.lsp.config('ts_ls', {})
  vim.lsp.enable('ts_ls')
end

return M
