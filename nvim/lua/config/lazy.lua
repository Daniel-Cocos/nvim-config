local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- helper func return module spec thing
local islist = vim.islist or vim.tbl_islist
local function import(mod)
	local ok, spec = pcall(require, mod)
	if not ok or not spec then
		return {}
	end
	if islist(spec) then
		return spec
	else
		return { spec }
	end
end

local plugins = {}
local function extend(list)
	if not list then
		return
	end
	for _, v in ipairs(list) do
		table.insert(plugins, v)
	end
end

-- lsp config
extend({
	{ "neovim/nvim-lspconfig" },
	{ "stevearc/conform.nvim" },
	{ "mfussenegger/nvim-lint" },
})

extend(import("lsp.blink"))

-- Navigation
extend(import("navigation.telescope"))
extend(import("navigation.neotree"))

-- Appearance
extend(import("appearance.devicons"))
extend(import("appearance.treesitter"))
extend(import("appearance.gitsigns"))
extend(import("appearance.lualine"))
extend(import("appearance.noice"))
extend(import("appearance.render-markdown"))
extend(import("appearance.highlight-colors"))
extend(import("appearance.image"))

-- Other
extend(import("other.autopairs"))
extend(import("other.dadbod"))

require("lazy").setup(plugins)

