require("catppuccin").setup({
    custom_highlights = function(colors)
        local foreground = "#ffceff"
        local background = "#47034e"
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
            NvimTreeNormal = {bg = "NONE"},
            NvimTreeNormalNC = {bg = "NONE"},
            NvimTreeNormalEndOfBuffer = {bg = "NONE"},
            NvimTreeWinSeparator = { bg = "NONE", fg = foreground},
            NvimTreeWinbarTitle = { fg = foreground},

            -- nvim
            CursorLine = { bg = background },
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
