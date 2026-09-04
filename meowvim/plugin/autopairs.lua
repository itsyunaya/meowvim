-- https://github.com/windwp/nvim-autopairs/wiki
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

npairs.setup()

-- npairs wiki has some super useful predefined custom rules
-- https://github.com/windwp/nvim-autopairs/wiki/Custom-rules

-- when pressing space, after opening a parenthesis, another is automatically added at the end
local function insert_with_surrounding_check(a1, ins, a2, lang)
	npairs.add_rule(Rule(ins, ins, lang)
		:with_pair(function(opts)
			return a1 .. a2 == opts.line:sub(opts.col - #a1, opts.col + #a2 - 1)
		end)
		:with_move(cond.none())
		:with_cr(cond.none())
		:with_del(function(opts)
			local col = vim.api.nvim_win_get_cursor(0)[2]
			return a1 .. ins .. ins .. a2 == opts.line:sub(col - #a1 - #ins + 1, col + #ins + #a2) -- insert only works for #ins == 1 anyway
		end))
end

insert_with_surrounding_check("(", " ", ")")
insert_with_surrounding_check("[", " ", "]")
insert_with_surrounding_check("{", " ", "}")
