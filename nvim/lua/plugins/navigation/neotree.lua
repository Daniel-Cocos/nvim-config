return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      local devicons = require("nvim-web-devicons")

      devicons.setup {
        default = true,
        override = {},
      }
      devicons.refresh()

      vim.cmd([[ highlight link NeoTreeFileIcon DevIconDefault ]])

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "neo-tree",
        callback = function()
          devicons.refresh()
        end,
      })

      require("neo-tree").setup({
        default_component_configs = {
          icon = {
            highlight = "NeoTreeFileIcon",
          },
        },
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
        event_handlers = {
          {
            event = "neo_tree_buffer_enter",
            handler = function()
              vim.wo.number = true
              vim.wo.relativenumber = true
            end,
          },
        },
      })
      local function openNeotreeAndEnableTransparent()
        vim.cmd("Neotree filesystem reveal left")
        vim.cmd("TransparentEnable")
        vim.opt.laststatus = 0
      end
      vim.keymap.set("n", "<Leader>n", openNeotreeAndEnableTransparent)
    end,
  },
}

