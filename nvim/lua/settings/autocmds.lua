local vim = vim

local augroup = vim.api.nvim_create_augroup("", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

local settings_dir = vim.fn.stdpath("config") .. "/lua/settings"
local color_scheme_file = settings_dir .. "/last_colorscheme"

if vim.fn.isdirectory(settings_dir) == 0 then
  vim.fn.mkdir(settings_dir, "p")
end

autocmd("ColorScheme", {
  group = augroup,
  pattern = "*",
  desc = "Save last used colorscheme",
  callback = function()
    if vim.g.colors_name then
      local ok, err = pcall(vim.fn.writefile, { vim.g.colors_name }, color_scheme_file)
      if not ok then
        vim.notify("Could not save last colorscheme: " .. err, vim.log.levels.ERROR)
      end
    end
  end,
})

autocmd("VimEnter", {
  group = augroup,
  pattern = "*",
  desc = "Run tasks on Neovim startup",

  callback = function()
    local file = io.open(color_scheme_file, "r")
    if file then
      local saved_colorscheme = file:read("*l")
      file:close()
      if saved_colorscheme and saved_colorscheme ~= "" then
        vim.cmd("colorscheme " .. saved_colorscheme)
      else
        vim.cmd("colorscheme habamax") -- Fallback colorscheme
      end
    else
      vim.cmd("colorscheme habamax") -- Fallback colorscheme
    end

    vim.defer_fn(function()
      require("nvim-web-devicons").refresh()
    end, 10) -- 10ms delay
  end,
})
