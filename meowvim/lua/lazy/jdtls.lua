---@module "lz.n"
---@type lz.n.PluginSpec
return {
	"nvim-jdtls",
	ft = "java",
	after = function()
		require("jdtls").start_or_attach({
			cmd = { "jdtls" },
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})
	end,
}
