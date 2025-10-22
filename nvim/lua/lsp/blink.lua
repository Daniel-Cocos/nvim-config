return {
	{
		"SAGhen/blink.cmp",
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
				snippets = { preset = "luasnip" },
				sources = {
					default = { "lsp", "path", "buffer", "snippets" },
				},
				keymap = {
					preset = "default",
					["<C-l>"] = { "accept", "fallback" },
					["<C-y>"] = { "fallback" }, -- disable accept on <C-y>
					["<C-j>"] = { "select_next", "fallback" }, -- navigate down
					["<C-k>"] = { "select_prev", "fallback" }, -- navigate up
				},
			})

			local ok_vs = pcall(require, "luasnip.loaders.from_vscode")
			if ok_vs then
				require("luasnip.loaders.from_vscode").lazy_load()
			end
		end,
	},
}
