require("settings.options")
require("settings.keybinds")
require("settings.autocmds")

require("config.lazy")

require("lsp").setup()

require("settings.tabline")

pcall(vim.cmd, "colorscheme cottoncandy")
