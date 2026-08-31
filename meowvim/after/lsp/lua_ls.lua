---@type vim.lsp.Config
return {
	settings = {
		Lua = {
			diagnostics = {
				-- gets rid of "undefined global var"
				globals = { "vim" },
			}
		}
	}
}