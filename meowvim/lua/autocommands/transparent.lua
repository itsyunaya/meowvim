
-- sets transparency on nvim open
-- technically not needed since you can set it once from within the editor, but that wouldn't carry over to new machines
vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		vim.cmd("TransparentEnable")
	end,
})
