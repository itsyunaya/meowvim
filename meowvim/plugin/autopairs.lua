-- https://github.com/windwp/nvim-autopairs/wiki
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")
local ts_conds = require('nvim-autopairs.ts-conds')
local log = require('nvim-autopairs._log')
local utils = require('nvim-autopairs.utils')

npairs.setup()

-- npairs wiki has some super useful predefined custom rules
-- https://github.com/windwp/nvim-autopairs/wiki/Custom-rules

-- when pressing space, after opening a parenthesis, another is automatically added at the end
function insert_with_surrounding_check(a1, ins, a2, lang)
	npairs.add_rule(
		Rule(ins, ins, lang)
			:with_pair(function(opts)
			return a1 .. a2 == opts.line:sub(opts.col - #a1, opts.col + #a2 - 1)
		end)
			:with_move(cond.none())
			:with_cr(cond.none())
			:with_del(function(opts)
			local col = vim.api.nvim_win_get_cursor(0)[2]
			return a1 .. ins .. ins .. a2 == opts.line:sub(col - #a1 - #ins + 1, col + #ins + #a2) -- insert only works for #ins == 1 anyway
		end)
	)
end

insert_with_surrounding_check('(', ' ', ')')
insert_with_surrounding_check('[', ' ', ']')
insert_with_surrounding_check('{', ' ', '}')

-- When typing space equals for assignment in Nix, add the final semicolon to the line
-- not 100% sure about keeping this one yet
local is_not_ts_node_comment_one_back = function()
	return function(info)
		log.debug('not_in_ts_node_comment_one_back')

		local p = vim.api.nvim_win_get_cursor(0)
		-- Subtract one to account for 1-based row indexing in nvim_win_get_cursor
		-- Also subtract one from the position of the column to see if we are at the end of a comment.
		local pos_adjusted = { p[1] - 1, p[2] - 1 }

		vim.treesitter.get_parser():parse()
		local target = vim.treesitter.get_node({ pos = pos_adjusted, ignore_injections = false })
		log.debug(target:type())
		if target ~= nil and utils.is_in_table({ 'comment' }, target:type()) then
			return false
		end

		local rest_of_line = info.line:sub(info.col)
		return rest_of_line:match('^%s*$') ~= nil
	end
end

npairs.add_rule(
	Rule("= ", ";", "nix")
		:with_pair(is_not_ts_node_comment_one_back())
		:set_end_pair_length(1)
)
