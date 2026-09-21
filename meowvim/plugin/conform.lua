-- https://github.com/stevearc/conform.nvim

local alejandra_kind = nil

--- Determines if the alejandra formatter found by nvim is the
--- stock one or my fork and returns format arguments accordingly
--- @return table | nil
local function determineAlejandraKind()
	if alejandra_kind ~= nil then
		return alejandra_kind
	end

	local cmd_string = vim.fn.system("alejandra --help")
	if string.find(cmd_string, "--config-str", 1, true) then
		return { "--config-str", 'indentation = "Tabs"; enable_inline_spacing = true' }
	else
		alejandra_kind = false
	end

	return alejandra_kind or nil
end

require("conform").setup({
	formatters_by_ft = {
		-- nixfmt is here incase i am contributing to a project that doesn't use my version of alejandra
		-- if it's detected in $PATH, which it only will be in devshells, it'll be used first
		nix = { "nixfmt", "alejandra", stop_after_first = true },
		lua = { "stylua" },
		rust = { "rustfmt" },
		kotlin = { "ktlint" },
		cpp = { "clang_format" },
	},

	formatters = {
		alejandra = { append_args = determineAlejandraKind() },
	},

	notify_on_error = true,
	notify_no_formatters = true,
})
