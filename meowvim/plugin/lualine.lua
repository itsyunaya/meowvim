local colors = {
	blue = "#80a0ff",
	cyan = "#79dac8",
	black = "#080808",
	white = "#c6c6c6",
	red = "#ff5189",
	pink = "#ffceff",
	grey = "#303030",
}

local theme = {
	normal = {
		a = { fg = colors.black, bg = colors.pink },
		b = { fg = colors.pink, bg = colors.grey },
		c = { fg = colors.pink },
	},

	insert = { a = { fg = colors.black, bg = colors.blue } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.pink, bg = colors.black },
		b = { fg = colors.pink, bg = colors.black },
		c = { fg = colors.pink },
	},
}

require("lualine").setup({
	options = {
		theme = theme,
		component_separators = "",
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = { "NvimTree" },
			winbar = { "NvimTree" },
		},
	},
	sections = {
		lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { { "navic", color_correction = nil, navic_opts = nil } },
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = { { "filename", separator = { right = "" }, left_padding = 2 } },
	},
	inactive_sections = {
		lualine_a = { "filetype" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "filename" },
	},
	tabline = {},
	extensions = {},
	winbar = {
		lualine_a = {
			{
				"buffers",
				buffers_color = {
					active = { fg = colors.black, bg = colors.pink },
					inactive = { fg = colors.pink, bg = colors.grey },
				},
				symbols = {
					alternate_file = "",
				},
			},
		},
	},

	inactive_winbar = {
		lualine_a = {
			{
				"buffers",
				buffers_color = {
					active = { fg = colors.black, bg = colors.pink },
					inactive = { fg = colors.pink, bg = colors.grey },
				},
				symbols = {
					alternate_file = "",
				},
			},
		},
	},
})
