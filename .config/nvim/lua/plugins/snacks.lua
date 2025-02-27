return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  --@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        { section = "keys",   gap = 1, padding = 1 },
        { section = "startup" },
        {
          section = "terminal",
          cmd = "ascii-image-converter ~/.config/nvim/lua/settings/logo.png -C -c", --for color add -C c as "... -C c"
          random = 10,
          pane = 2,
          indent = 4,
          height = 30,
        },
      },
    },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
