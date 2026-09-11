local surround = require("nvim-surround")

-- the bind that's used more should be further from the edge of the keyboard,
-- this plugin has it the other way 'round for some reason. function adapted
-- from llakala's config since she seems to have had the same issue
local function reverse_default(left, right, whitespace)
	local add = nil
	local delete = nil

	if whitespace then
		add = { left .. " ", " " .. right } or {}
		delete = "^(. ?)().-( ?.)()$"
	else
		add = { left, right }
		delete = "^(.)().-(.)()$"
	end

	return {
		add = add,
		delete = delete,
	}
end

vim.g.nvim_surround_no_normal_mappings = true

vim.keymap.set("n", "s", "<Plug>(nvim-surround-normal)")
vim.keymap.set("x", "s", "<Plug>(nvim-surround-visual)")
vim.keymap.set("n", "ds", "<Plug>(nvim-surround-delete)")
vim.keymap.set("n", "cs", "<Plug>(nvim-surround-change)")

surround.setup({
	aliases = {
		a = false,
		b = false,
		B = false,
		r = false,
		s = false,
	},

	surrounds = {
		["("] = reverse_default("(", ")", false),
		[")"] = reverse_default("(", ")", true),

		["["] = reverse_default("[", "]", false),
		["]"] = reverse_default("[", "]", true),

		["{"] = reverse_default("{", "}", false),
		["}"] = reverse_default("{", "}", true),

		["<"] = reverse_default("<", ">", false),
		[">"] = reverse_default("<", ">", true),
	},
})
