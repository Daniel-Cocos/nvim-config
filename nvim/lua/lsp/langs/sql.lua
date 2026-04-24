local M = {}

function M.setup()
  vim.lsp.config('sqls', {
    root_markers = { ".sqls.yml", ".git" },
  })
  vim.lsp.enable('sqls')
end

return M
