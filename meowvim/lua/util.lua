--- Utility functions
U = {}

-- since i don't want to bundle every language server i use, we simply expect them
-- to be in a devshell. if they're not, we send a notification to inform the user
--- @param ls string
function U.unbundled_ls_check(ls)
	if vim.fn.executable(ls) == 0 then
		vim.notify("Language server " .. ls .. " is unavailable")
	else
		local ls_name = ls:gsub("-", "_")
		vim.lsp.enable(ls_name)
	end
end

return U
