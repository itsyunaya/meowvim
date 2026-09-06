---@module "lz.n"
---@type lz.n.PluginSpec
return {
	"markdown-preview-nvim",
	ft = { "markdown" },
	after = function ()
		vim.g.mkdp_auto_close = 0
		-- force dark for if we're ever on a non darkmode system so we don't flashbang ourselves
		vim.g.mkdp_theme = "dark"
		vim.g.mkdp_combine_preview = 0
	end
}
