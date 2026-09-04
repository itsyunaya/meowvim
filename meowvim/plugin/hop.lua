require("hop").setup({
	virtual_cursor = false,
})

-- this whole thing makes the cursor + cursorline invisible while hop is active
function hopCommandWrapped(hopCommand)
	local cursorline = vim.opt.cursorline:get()
	local guicursor = vim.opt.guicursor:get()

	vim.opt.cursorline = false
	local def = vim.api.nvim_get_hl_by_name("Cursor", true)
	vim.api.nvim_set_hl(0, "Cursor", vim.tbl_extend("force", def, { blend = 100 }))
	vim.opt.guicursor:append("a:Cursor/lCursor")

	vim.cmd(hopCommand)

	vim.schedule(function()
		vim.opt.cursorline = cursorline
		vim.opt.guicursor = guicursor
	end)
end
