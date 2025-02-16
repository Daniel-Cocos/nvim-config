-- Path to the file where we will store the last used color scheme
local color_scheme_file = vim.fn.stdpath("config") .. "/lua/settings/last_colorscheme"

-- Function to store and set the color scheme
function SetColorscheme(colorscheme)
  -- Save the color scheme to a file
  vim.fn.writefile({colorscheme}, color_scheme_file)
  vim.cmd('colorscheme ' .. colorscheme)
end

-- Autocommand to save the color scheme on change
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    -- Save the current color scheme whenever it changes
    vim.fn.writefile({vim.g.colors_name}, color_scheme_file)
  end
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

-- Load your settings and plugins
require("settings.options")
require("settings.keybinds")
require("lazy").setup("plugins")

-- Autocommand to restore the color scheme after plugins are loaded
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    -- Try to read the last used color scheme from the file
    local file = io.open(color_scheme_file, "r")
    if file then
      local saved_colorscheme = file:read("*l")
      file:close()

      -- If we have a saved color scheme, apply it
      if saved_colorscheme then
        vim.cmd('colorscheme ' .. saved_colorscheme)
      else
        -- Fallback to tokyodark's color scheme if no file or color scheme is saved
        vim.cmd('colorscheme tokyodark')
      end
    else
      -- Fallback to tokyodark's if the file doesn't exist
      vim.cmd('colorscheme tokyodark')
    end
  end
})
