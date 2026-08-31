
-- anything in lua/ doesn't get sourced automatically and needs to be require'd
-- this is unlike files in plugin/, which do get autosourced

require("lsp")
require("settings")
require("keybinds")
require("theme")

require("autocommands.transparent")
