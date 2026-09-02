-- with this, you will basically have normal mode inside of visual mode
-- because uhh selection stuff and helix does modes differently
-- so visual and normal mode have to be pretty much merged to emulate helix

-- also spider + multicursor plugin are here because helix stuff !!

local mc = require("multicursor-nvim")
mc.setup()

-- d to delete selection
vim.keymap.set({"n", "v"}, "d", "x", { noremap = true })

-- (shift) w/e/b motions that also select
-- instead of extend mode its shift + motion to extend
-- also count makes it select the entire jump as 1
vim.keymap.set({"n", "v"}, "w", function() helixMotion("w", false) end, { noremap = true })
vim.keymap.set({"n", "v"}, "e", function() helixMotion("e", false) end, { noremap = true })
vim.keymap.set({"n", "v"}, "b", function() helixMotion("b", false) end, { noremap = true })
vim.keymap.set({"n", "v"}, "W", function() helixMotion("w", true) end, { noremap = true })
vim.keymap.set({"n", "v"}, "E", function() helixMotion("e", true) end, { noremap = true })
vim.keymap.set({"n", "v"}, "B", function() helixMotion("b", true) end, { noremap = true })

-- x select the entire line and grows downward, X doesnt grow
vim.keymap.set({"n", "v"}, "x", function() helixLineSelect(true) end, { noremap = true })
vim.keymap.set({"n", "v"}, "X", function() helixLineSelect(false) end, { noremap = true })

-- space+y pipe to wl-copy
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, desc = "Yank to wl-copy" })

-- C and alt-C to add cursor below/above
vim.keymap.set({ "n", "x" }, "C", function() mc.lineAddCursor(1) end)
vim.keymap.set({ "n", "x" }, "<A-C>", function() mc.lineAddCursor(-1) end)

-- ; removes all multicursors and selection (; and , in one)
vim.keymap.set({"n", "x"}, ";", function() clearCursorsAndSelection() end, { noremap = true })

-- s to select matches in current selection
-- doesnt match regex :/
vim.keymap.set("x", "s", mc.matchCursors)
vim.keymap.set("n", "s", mc.searchAllAddCursors)

-- % selects entire file
-- unlike helix it doesnt move your cursor(s) (this is good)
vim.g.loaded_matchit = 1
vim.keymap.set({ "n", "v" }, "%", function() selectWholeFile() end, { noremap = true })

function clearCursorsAndSelection()
    if (mc.hasCursors()) then mc.clearCursors() end
    vim.cmd("normal! \27")
end

function selectWholeFile()
    local pos = vim.api.nvim_win_get_cursor(0)

    vim.cmd("normal! ggVG")
    vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*:n",
        once = true,
        callback = function()
            vim.schedule(function()
                vim.api.nvim_win_set_cursor(0, pos)
            end)
        end,
    })
end

function helixLineSelect(grow)
    local mode = vim.fn.mode()
    if (mode == "V") then
        if (grow) then
            vim.cmd("normal! j")
        else
            vim.cmd("normal! \27jV")
        end
    else
        vim.cmd("normal! V")
    end
end

function helixMotion(motion)
    local count = vim.v.count > 0 and tostring(vim.v.count) or ""
    local mode = vim.fn.mode()
    local in_visual = mode == "v" or mode == "V" or mode == "\22"

    local cmd = "normal! "

    if (extend) then
        if (not in_visual) then cmd = cmd .. "v"
    end
    else
        if (in_visual) then cmd = cmd .. "\27v"
        else cmd = cmd .. "v" end
    end

    vim.cmd(cmd .. count .. motion)
end