require("settings.options")
require("settings.keybinds")
require("settings.autocmds")

require("lazy")
require("settings.tabline")

pcall(vim.cmd, "colorscheme cottoncandy")
