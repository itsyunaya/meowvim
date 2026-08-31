-- https://cmp.saghen.dev/
local blink = require("blink.cmp")

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

		menu = {
			draw = {
				columns = { { "kind_icon" }, { "label", "label_description" } },
				components = {
					label = {
						-- Removes label_details from being added to label by default
						-- See https://github.com/Saghen/blink.cmp/issues/843
						text = function(ctx)
							return ctx.label
						end,
						-- colorize each completion type
						highlight = require("colorful-menu").blink_components_highlight,
					},
				},
			},
		}
	},

	keymap = {
		-- turn off the default preset so we are forced to get accustomed to vim motions
		preset = "none";

		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },

		["<C-l>"] = { "accept", "fallback" },
		["<CR>"] = { "accept", "fallback" },
	},

	signature = {
		enabled = true,
		window = { show_documentation = true },
	},

	sources = {
		default = { "lsp", "buffer", "snippets", "path", "omni" },
	}
})
