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
        -- List of tools to ensure are installed
        ensure_installed = {
          "biome",  -- JavaScript/TypeScript
          "black",  -- Python
          "clang-format", -- C/C++
          "isort",  -- Python
          "markuplint", -- HTML
          "pylint", -- Python
          "stylelint",  -- CSS
          "stylua", -- Lua
        },
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- List of LSP Servers to ensure are installed
        ensure_installed = {
          "clangd", -- C/C++
          "cssls",  -- CSS
          "gopls",  -- GO
          "html",   -- HTML
          "jdtls",  -- Java
          "jsonls", -- JSON
          "lua_ls", -- Lua
          "marksman", -- MarkDown
          "pyright",  -- Python
          "rust_analyzer",  -- Rust
          "sqls", -- SQL
          "ts_ls", -- JavaScript/TypeScript
          "yamlls", -- YAML
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- List of LSP servers to be set up
      local servers = {
        "clangd", -- C/C++
        "cssls",  -- CSS
        "html",   -- HTML
        "jdtls",  -- Java
        "jsonls", -- JSON
        "lua_ls", -- Lua
        "marksman", -- MarkDown
        "pyright",  -- Python
        "rust_analyzer", -- Rust
        "sqls", -- SQL
        "ts_ls", -- JavaScript/TypeScript
        "yamlls", -- YAML
      }

      -- Loop through each server and set it up
      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
          settings = {
            telemetry = {
              enable = false,
            }
          }
        })
      end
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      -- Set up every linter and formatter
      null_ls.setup({
        sources = {
          -- Formatters
          null_ls.builtins.formatting.biome,   -- Formatter/Linter: JavaScript/TypeScript
          null_ls.builtins.formatting.black,   -- Formatter: Python
          null_ls.builtins.formatting.clang_format, -- Formatter: C/C++
          null_ls.builtins.formatting.isort,   -- Formatter: Python (for libarries)
          null_ls.builtins.formatting.stylua,  -- Formatter: Lua
          -- Linters
          null_ls.builtins.diagnostics.markuplint,   -- Linter: HTML
          null_ls.builtins.diagnostics.pylint,   -- Linter: Python
          null_ls.builtins.diagnostics.stylelint, -- Linter: CSS
        },
      })
    end,
  },
}
