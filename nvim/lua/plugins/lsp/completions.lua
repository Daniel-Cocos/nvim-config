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
        -- configure snippet expansion behavior
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        -- configure theme for completion and documentation windows
        window = {
          completion = cmp.config.window.bordered({
            border = "rounded",
            scrollbar   = false,
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CmpCursorLine,Search:Search"
          }),

          documentation = cmp.config.window.bordered({
            border = "rounded",
            scrollbar   = false,
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CmpCursorLine,Search:Search"
          }),
        },

        -- key mappings for completion actions
        mapping = cmp.mapping.preset.insert({
                  ["<C-k>"] = cmp.mapping.select_prev_item(),
                  ["<C-j>"] = cmp.mapping.select_next_item(),
                  ["<C-Space>"] = cmp.mapping.complete(),
                  ["<C-e>"] = cmp.mapping.abort(),
                  ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),

        -- define the sources for autocompletion
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
