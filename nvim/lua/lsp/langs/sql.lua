local M = {}

function M.setup(capabilities)
  local lspconfig = require("lspconfig")
  local util = require("lspconfig.util")

  lspconfig.sqls.setup({
    capabilities = capabilities,
    root_dir = function(fname)
      return util.root_pattern(".sqls.yml", ".git")(fname) or util.path.dirname(fname)
    end,
  })
end

return M
