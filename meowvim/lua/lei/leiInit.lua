vim.opt.shada:append("!")

vim.api.nvim_create_user_command("ToggleLei", function()
    vim.g.ENABLE_LEI = not vim.g.ENABLE_LEI
    print("ENABLE_LEI = " .. tostring(vim.g.ENABLE_LEI))
end, {})

vim.schedule(function()
    if vim.g.ENABLE_LEI == nil then
        vim.g.ENABLE_LEI = false
    end

    -- my stuff goes down here
    if vim.g.ENABLE_LEI then
        -- below is an attempt at reproducing kakoune/helix motions as they are superior
        -- obviously wont be as good because of the visual mode shenanigans and everything
        require("lei.helixRemap")
        -- other personal changes like keybinds or stuff
        require("lei.evilLeiTweaks")
    end
end)