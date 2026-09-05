local Rule = require("nvim-autopairs.rule")

require("nvim-autopairs").add_rules({
	Rule("$", "$", "typst"),
	AP_utils.surrounding_char("$", " ", "$", "typst"),

	Rule("*", "*", "typst"),
	Rule("_", "_", "typst"),
	Rule("<", ">", "typst"),
})
