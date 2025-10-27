local vim = vim

local augroup = vim.api.nvim_create_augroup("", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

local settings_dir = vim.fn.stdpath("config") .. "/lua/settings"

if vim.fn.isdirectory(settings_dir) == 0 then
	vim.fn.mkdir(settings_dir, "p")
end

autocmd("VimEnter", {
	group = augroup,
	pattern = "*",
	desc = "Run tasks on Neovim startup",

	callback = function()
		vim.defer_fn(function()
			require("nvim-web-devicons").refresh()
		end, 10) -- 10ms delay
	end,
})

