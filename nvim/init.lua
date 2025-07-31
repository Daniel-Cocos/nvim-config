local vim = vim

-- Path to the file where we will store the last used color scheme
local color_scheme_file = vim.fn.stdpath("config") .. "/lua/settings/last_colorscheme"

-- Path to the file where we will store the last used color scheme
local cfg = vim.fn.stdpath("config")
local settings_dir = cfg .. "/lua/settings"
local color_scheme_file = settings_dir .. "/last_colorscheme"

-- Ensure the settings directory exists
if vim.fn.isdirectory(settings_dir) == 0 then
  vim.fn.mkdir(settings_dir, "p")
end

-- Save on every ColorScheme change, catching errors
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local ok, err = pcall(vim.fn.writefile, { vim.g.colors_name }, color_scheme_file)
    if not ok then
      vim.notify("Could not save last colorscheme (" .. vim.g.colors_name .. "):\n" .. err, vim.log.levels.ERROR)
    end
  end,
})

-- Set up lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Load settings and plugins
require("settings.options")
require("settings.keybinds")
require("lazy").setup({
  { import = "plugins/appearance" },
  { import = "plugins/lsp" },
  { import = "plugins/navigation" },
  { import = "plugins/other" },
})
require("settings.tabline")

-- Autocommand to restore the color scheme after plugins are loaded
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Try to read the last used color scheme from the file
    local file = io.open(color_scheme_file, "r")
    if file then
      local saved_colorscheme = file:read("*l")
      file:close()

      -- If we have a saved color scheme, apply it
      if saved_colorscheme then
        vim.cmd("colorscheme " .. saved_colorscheme)
      else
        -- Fallback to habamax's color scheme if no file or color scheme is saved
        vim.cmd("colorscheme habamax")
      end
    end
  end,
})
