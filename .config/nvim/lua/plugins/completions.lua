return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        -- Configure snippet expansion behavior
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        -- Configure theme for completion and documentation windows
        window = {
          completion = cmp.config.window.bordered({
            border = "",
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:Search",
          }),

          documentation = cmp.config.window.bordered({
            border = "",
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:Search",
          }),
        },

        -- Key mappings for the completion actions
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),

        -- Define the sources for autocompletion
        sources = cmp.config.sources({
          { name = "treesitter" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
