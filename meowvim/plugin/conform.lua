-- https://github.com/stevearc/conform.nvim
require("conform").setup({
	formatters_by_ft = {
		-- nixfmt is here incase i am contributing to a project that doesn't use my version of alejandra
		-- if it's detected in $PATH, which it only will be in devshells, it'll be used first
		nix = { "nixfmt", "alejandra", stop_after_first = true }
	},

	formatters = {
		alejandra = {
			-- this will error if not on my fork of alejandra
			append_args = { "--config-str", "indentation = \"Tabs\"; enable_inline_spacing = true" }
		},
	},

	notify_on_error = true,
	notify_no_formatters = true,
})
