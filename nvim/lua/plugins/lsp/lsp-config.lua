-- lsp-config.lua
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "biome", "black", "clang-format", "isort",
          "markuplint", "pylint", "stylelint", "stylua",
        },
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd", "cssls", "gopls", "html", "jdtls",
          "jsonls", "lua_ls", "marksman", "pyright",
          "rust_analyzer", "sqls", "tsserver", "yamlls",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- get cmp capabilities
      local ok, cmp_cap = pcall(require, "cmp_nvim_lsp")
      local capabilities = {}
      if ok and cmp_cap and cmp_cap.default_capabilities then
        capabilities = cmp_cap.default_capabilities()
      end

      local servers = {
        "clangd", "cssls", "html", "jdtls", "jsonls",
        "marksman", "pyright", "rust_analyzer", "sqls",
        "tsserver",
        "yamlls",
      }

      -- common config used for all servers
      local base_config = {
        capabilities = capabilities,
        settings = {
          telemetry = { enable = false },
        },
      }

      for _, srv in ipairs(servers) do
        vim.lsp.config(srv, vim.tbl_deep_extend("force", {}, base_config))
        vim.lsp.enable(srv)
      end
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    config = function()
      local ok, none_ls = pcall(require, "none-ls")
      if not ok then
        -- fall back or log an error
        return
      end

      none_ls.setup({
        sources = {
          none_ls.formatting.biome,
          none_ls.formatting.black,
          none_ls.formatting.clang_format,
          none_ls.formatting.isort,
          none_ls.formatting.stylua,
        },
      })
    end,
  },
}

