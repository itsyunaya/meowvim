local blink = require("blink.cmp")

-- see https://cmp.saghen.dev/
blink.setup({
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 0,
		},

		ghost_text = { enabled = true },

		list = {
			selection = {
				preselect = true,
				auto_insert = false,
			},
		},
	},

	keymap = {
		-- turn off the default preset so we are forced to get accustomed to vim motions
		preset = "none";

		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },

		["<C-l>"] = { "accept", "fallback" },
		["<CR>"] = { "accept", "fallback" },
	},

	menu = {
		draw = {
			components = {
				label = {
					highlight = require("colorful-menu").blink_components_highlight,
				}
			}
		}
	},

	sources = {
		default = { "lsp", "buffer", "snippets", "path", "omni" },
	}
})