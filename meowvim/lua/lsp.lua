-- when adding a new lang, add the lsp server here and create an associated config file in after/lsp/
vim.lsp.enable({
	"lua_ls",
	"nil_ls",
})

-- enable some lsp specific display options on lsp init
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		vim.lsp.inlay_hint.enable(true)

		vim.diagnostic.config({
			virtual_text = true,
			severity_sort = true,
			signs = false,
			float = {
				border = "rounded",
			},
		})
	end
})
