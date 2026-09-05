---@module "lz.n"
---@type ln.n.PluginSpec
return {
	"typst-preview-nvim",
	ft = "typst",
	after = function ()
		require("typst-preview")
	end
}
