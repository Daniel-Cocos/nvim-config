local M = {}

function M.lang_server()
  local t = {
    servers = {},
    formatters = {},
    linters = {},
  }

  function t:add_server(name, opts)
    table.insert(self.servers, { name = name, opts = opts or {} })
  end

  function t:set_formatters(fts, tools)
    for _, ft in ipairs(fts or {}) do
      self.formatters[ft] = tools
    end
  end

  function t:set_linters(fts, tools)
    for _, ft in ipairs(fts or {}) do
      self.linters[ft] = tools
    end
  end

  function t:get()
    return {
      servers = self.servers,
      formatters = self.formatters,
      linters = self.linters,
    }
  end

  return t
end

return M

