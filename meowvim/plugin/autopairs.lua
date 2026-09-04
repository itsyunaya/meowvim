-- https://github.com/windwp/nvim-autopairs/wiki
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")
local utils = require("nvim-autopairs.utils")
local ts_conds = require('nvim-autopairs.ts-conds')

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

local is_not_ts_node_comment_one_back = function()
	return function(info)
		local p = vim.api.nvim_win_get_cursor(0)
		-- Subtract one to account for 1-based row indexing in nvim_win_get_cursor
		-- Also subtract one from the position of the column to see if we are at the end of a comment.
		local pos_adjusted = { p[1] - 1, p[2] - 1 }

		vim.treesitter.get_parser():parse()
		local target = vim.treesitter.get_node({ pos = pos_adjusted, ignore_injections = false })
		if target ~= nil and utils.is_in_table({ "comment" }, target:type()) then
			return false
		end

		local rest_of_line = info.line:sub(info.col)
		return rest_of_line:match("^%s*$") ~= nil
	end
end

insert_with_surrounding_check("(", " ", ")")
insert_with_surrounding_check("[", " ", "]")
insert_with_surrounding_check("{", " ", "}")

npairs.add_rule(Rule("= ", ";", "nix"):with_pair(is_not_ts_node_comment_one_back()):set_end_pair_length(1))
