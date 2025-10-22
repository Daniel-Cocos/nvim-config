local vim = vim
local signs = {
	Error = "󰅚",
	Warn = "󰀪",
	Info = "󰋽",
	Hint = "󰌶",
}

-- Basic settings
vim.opt.number = false -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = false -- Highlight current line
vim.opt.wrap = false -- Don't wrap lines
vim.opt.scrolloff = 0 -- Keep min 0 lines above/below cursor when scrolling
vim.opt.sidescrolloff = 0 -- Keep min 0 columns left/right of cursor when scrolling

-- Spelling
vim.o.spell = true
vim.o.spelllang = "en"
vim.o.spellfile = vim.fn.expand("~/.config/nvim/spell/en.utf-8.add")

-- Cursorline
vim.opt.cursorline = true

-- Searching
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.bo.softtabstop = 2

-- Apperance
vim.opt.showmode = false
vim.opt.background = "dark"
vim.opt.termguicolors = true

-- Split Windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Clipboard
vim.opt.clipboard:append("unnamedplus")

-- Folding
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- File Handling
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")

-- Tabs
vim.o.tabline = "%!v:lua.my_tabline()"

-- Diagnostic Appearance
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
