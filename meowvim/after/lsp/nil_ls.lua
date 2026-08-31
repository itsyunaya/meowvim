---@type vim.lsp.Config
return {
	on_init = function(client)
		client.server_capabilities.selectionRangeProvider = nil
	end,
	settings = {
		["nil"] = {
			nix = {
				flake = {
					-- annoying, probably also doesn't work with tack anyway
					autoArchive = false,
					autoEvalInputs = false,
				},
			},
		},
	},
}
