return {
  -- Mason Setup
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- mason-null-ls Setup (Ensure it's installed before configuring)
  {
    "jay-babu/mason-null-ls.nvim",  -- Make sure you use the correct plugin name
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "stylelint",  -- CSS linter
          "clang-format",  -- C/C++ formatter
          "black",  -- Python formatter
          "isort",  -- Python import sorter
          "pylint",  -- Python linter
          "stylua",  -- Lua formatter
        },
      })
    end,
  },

  -- Mason LSP Config
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "cssls",
          "html",
          "jdtls",
          "jsonls",
          "lua_ls",
          "marksman",
          "pyright",
          "sqls",
          "ts_ls",
          "quick_lint_js",
          "yamlls",
        },
      })
    end,
  },

  -- Neovim LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- List of LSP servers
      local servers = {
        "clangd",
        "cssls",
        "html",
        "jdtls",
        "jsonls",
        "lua_ls",
        "marksman",
        "pyright",
        "sqls",
        "ts_ls",
        "quick_lint_js",
        "yamlls",
      }

      -- Loop through each server and configure it
      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end
    end,
  },

  -- Null-LS configuration for linters and formatters
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- Formatting
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.stylua,

          -- Diagnostics (Linter)
          null_ls.builtins.diagnostics.mypy,
          null_ls.builtins.diagnostics.pylint,
          null_ls.builtins.diagnostics.stylelint,
        },
      })
    end,
  },
}
