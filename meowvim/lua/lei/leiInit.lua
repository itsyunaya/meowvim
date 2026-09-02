-- init persistent global var
vim.opt.shada:append("!")
vim.g.ENABLE_LEI = vim.g.ENABLE_LEI
if vim.g.ENABLE_LEI == nil then
    vim.g.ENABLE_LEI = false
end

vim.api.nvim_create_user_command("ToggleLei", function()
    vim.g.ENABLE_LEI = not vim.g.ENABLE_LEI
    print("ENABLE_LEI = " .. tostring(vim.g.ENABLE_LEI))
end, {})

local enable = vim.g.ENABLE_LEI

-- my stuff
if (enable) then
    -- below is an attempt at reproducing kakoune/helix motions as they are superior
    -- obviously wont be as good because of the visual mode shenanigans and everything
    require("helixRemap")


end