return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	version = "*",
	opts = {
		keymap = {
			preset = "none",
			["<C-y>"] = { "fallback" },

			["<C-l>"] = { "accept", "fallback" },
      ["<Right>"] = { "accept", "fallback" },

			["<C-j>"] = { "select_next", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },

			["<C-k>"] = { "select_prev", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		completion = {
			accept = {
				auto_brackets = { enabled = true },
			},
			menu = {
				draw = {
					columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
}
