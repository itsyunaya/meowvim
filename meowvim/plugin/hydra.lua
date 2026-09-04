local Hydra = require("hydra")

-- i love this thing <333
--              -lei

local function closeBufferKeepAlt()
	if #(vim.fn.getbufinfo({ buflisted = 1 })) <= 1 then
		return
	end
	local alt = vim.fn.bufnr("#")
	local cur = vim.api.nvim_get_current_buf()

	if alt ~= -1 and vim.api.nvim_buf_is_loaded(alt) and alt ~= cur then
		vim.cmd("buffer #")
	else
		vim.cmd("bnext")
	end

	vim.cmd("bdelete " .. cur)
end

-- buffer control hydra, for fast tab cycling
Hydra({
	name = "Buffers",
	mode = { "n", "v", "x" },
	body = "<Space>",
	heads = {
		{ "<Tab>", "<cmd>bnext<CR>" },
		{ "<S-Tab>", "<cmd>bprevious<CR>" },
		{ "c", closeBufferKeepAlt },
	},
	config = {
		on_key = function()
			require("lualine").refresh({ force = true }) -- forces lualine to fully refresh because its stupid a little
		end,
	},
})
