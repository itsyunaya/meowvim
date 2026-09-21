-- https://github.com/Shatur/neovim-session-manager
-- lei plugin which i don't like using
if not vim.g.ENABLE_LEI then
	local config = require('session_manager.config')
	require("session_manager").setup({
		autoload_mode = config.AutoloadMode.Disabled,
		autosave_last_session = false,
	})
end
