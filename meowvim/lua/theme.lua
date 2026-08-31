require("catppuccin").setup({
    custom_highlights = function(colors)
        local navic_icon = { fg = "#ffceff" }
        return {
            -- the horrors
            NavicIconsFile          = navic_icon,
            NavicIconsModule        = navic_icon,
            NavicIconsNamespace     = navic_icon,
            NavicIconsPackage       = navic_icon,
            NavicIconsClass         = navic_icon,
            NavicIconsMethod        = navic_icon,
            NavicIconsProperty      = navic_icon,
            NavicIconsField         = navic_icon,
            NavicIconsConstructor   = navic_icon,
            NavicIconsEnum          = navic_icon,
            NavicIconsInterface     = navic_icon,
            NavicIconsFunction      = navic_icon,
            NavicIconsVariable      = navic_icon,
            NavicIconsConstant      = navic_icon,
            NavicIconsString        = navic_icon,
            NavicIconsNumber        = navic_icon,
            NavicIconsBoolean       = navic_icon,
            NavicIconsArray         = navic_icon,
            NavicIconsObject        = navic_icon,
            NavicIconsKey           = navic_icon,
            NavicIconsNull          = navic_icon,
            NavicIconsEnumMember    = navic_icon,
            NavicIconsStruct        = navic_icon,
            NavicIconsEvent         = navic_icon,
            NavicIconsOperator      = navic_icon,
            NavicIconsTypeParameter = navic_icon,

            -- navic
            NavicText       = {fg = "#ffceff" },
            NavicSeparator  = {fg = "#676767" },

            -- nvim-tree
            NvimTreeCursorLine = {bg = "#150015"}
        }
    end,
})

vim.cmd.colorscheme("catppuccin-macchiato")

-- adds colours to hex codes
-- https://github.com/brenoprata10/nvim-highlight-colors
require("nvim-highlight-colors").setup({})
