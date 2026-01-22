return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"onsails/lspkind.nvim",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local ok, blink = pcall(require, "blink.cmp")
			if not ok then
				return
			end

			blink.setup({
				fuzzy = {
					prebuilt_binaries = {
						download = false,
					},
				},
				snippets = { preset = "luasnip" },
				sources = {
					default = { "lsp", "path", "buffer", "snippets" },
				},
				keymap = {
					preset = "default",
					["<C-l>"] = { "accept", "fallback" },
					["<C-y>"] = { "fallback" },
					["<C-j>"] = { "select_next", "fallback" },
					["<C-k>"] = { "select_prev", "fallback" },
				},
			})

			local ok_vs = pcall(require, "luasnip.loaders.from_vscode")
			if ok_vs then
				require("luasnip.loaders.from_vscode").lazy_load()
			end
		end,
	},
}
