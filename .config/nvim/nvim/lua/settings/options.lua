local opt = vim.opt

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
