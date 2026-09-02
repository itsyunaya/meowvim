
-- anything in lua/ doesn't get sourced automatically and needs to be require'd
-- this is unlike files in plugin/, which do get autosourced

require("lei.leiInit")

require("lsp")
require("settings")
require("keybinds")
require("theme")