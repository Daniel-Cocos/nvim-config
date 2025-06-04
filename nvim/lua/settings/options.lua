local opt = vim.opt
local signs = {
  Error = "󰅚",
  Warn = "󰀪",
  Info = "󰋽",
  Hint = "󰌶",
}

-- Line Wrap --
opt.wrap = false

-- Cursorline --
opt.cursorline = true

-- Searching --
opt.smartcase = true
opt.ignorecase = true

-- Indentation --
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.bo.softtabstop = 2

-- Apperance --
opt.showmode = false
opt.background = "dark"
opt.termguicolors = true

-- Line Numbers --
opt.relativenumber = true

-- Split Windows -- 
opt.splitright = true
opt.splitbelow = true

-- Clipboard --
opt.clipboard:append("unnamedplus")

-- Folding -- 
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Tabs --
vim.o.tabline = "%!v:lua.my_tabline()"

-- Diagnostic
vim.diagnostic.config({
  virtual_text = {
    prefix = "■", -- "●", "■", "▶"
    spacing = 4,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.Error,
      [vim.diagnostic.severity.WARN] = signs.Warn,
      [vim.diagnostic.severity.INFO] = signs.Info,
      [vim.diagnostic.severity.HINT] = signs.Hint,
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
