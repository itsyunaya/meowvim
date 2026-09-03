require("catppuccin").setup({
    custom_highlights = function()
        local foreground = "#ffceff"
        local foreground2 = "#ff55ff"
        local background = "#222222"
        local fuckassgrey = "#676767"

        return {
            -- the horrors
            NavicIconsFile          = {fg = foreground },
            NavicIconsModule        = {fg = foreground },
            NavicIconsNamespace     = {fg = foreground },
            NavicIconsPackage       = {fg = foreground },
            NavicIconsClass         = {fg = foreground },
            NavicIconsMethod        = {fg = foreground },
            NavicIconsProperty      = {fg = foreground },
            NavicIconsField         = {fg = foreground },
            NavicIconsConstructor   = {fg = foreground },
            NavicIconsEnum          = {fg = foreground },
            NavicIconsInterface     = {fg = foreground },
            NavicIconsFunction      = {fg = foreground },
            NavicIconsVariable      = {fg = foreground },
            NavicIconsConstant      = {fg = foreground },
            NavicIconsString        = {fg = foreground },
            NavicIconsNumber        = {fg = foreground },
            NavicIconsBoolean       = {fg = foreground },
            NavicIconsArray         = {fg = foreground },
            NavicIconsObject        = {fg = foreground },
            NavicIconsKey           = {fg = foreground },
            NavicIconsNull          = {fg = foreground },
            NavicIconsEnumMember    = {fg = foreground },
            NavicIconsStruct        = {fg = foreground },
            NavicIconsEvent         = {fg = foreground },
            NavicIconsOperator      = {fg = foreground },
            NavicIconsTypeParameter = {fg = foreground },

            -- navic
            NavicText       = {fg = foreground },
            NavicSeparator  = {fg = fuckassgrey },
            WinBar = { underline = true, sp = foreground },

            -- nvim-tree
            NvimTreeCursorLine = {bg = background},
            NvimTreeNormal = {bg = "NONE", fg = foreground},
            NvimTreeNormalNC = {bg = "NONE"},
            NvimTreeNormalEndOfBuffer = {bg = "NONE"},
            NvimTreeWinSeparator = { bg = "NONE", fg = foreground},
            NvimTreeWinbarTitle = { fg = foreground},
            -- default jetbrains scheme
            NvimTreeGitDirty = {fg = "#87cefa"},
            NvimTreeGitStaged = { fg = "#629755" },
            NvimTreeGitNew = { fg = "#32cd32" },
            NvimTreeGitDeleted = { fg = "#616161" },
            NvimTreeGitIgnored = { fg = "#fcc200" },
            NvimTreeGitMerge = { fg = "#9876AA" },
            NvimTreeGitRenamed = { fg = "#6897BB" },
            NvimTreeFolderName = { fg = foreground },
            NvimTreeSpecialFile = { fg = foreground },
            NvimTreeOpenedFolderName = { fg = foreground },
			NvimTreeModifiedIcon = { fg = fuckassgrey },
			NvimTreeIndentMarker = { fg = fuckassgrey },

            -- hop
            HopNextKey = {fg = foreground},
            HopNextKey1 = {fg = foreground},
            HopNextKey2 = {fg = foreground2},
            HopUnmatched = {fg = fuckassgrey},

            -- nvim
            CursorLine = { bg = background },
			StatusLine = { bg = "NONE" },
			StatusLineNC = { bg = "NONE" },
            -- transparency
            Normal = { bg = "NONE" },
            NormalNC = { bg = "NONE" },
            NormalFloat = { bg = "NONE" },
            SignColumn = { bg = "NONE" },
            EndOfBuffer = { bg = "NONE" },
        }
    end,
})

vim.cmd.colorscheme("catppuccin-macchiato")

-- adds colours to hex codes
-- https://github.com/brenoprata10/nvim-highlight-colors
require("nvim-highlight-colors").setup({})
