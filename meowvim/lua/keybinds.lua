
-- nvim
vim.keymap.set({ "n", "x" }, "<Space>", "<Nop>") -- unmap space behaving as l

-- below is an attempt at reproducing kakoune/helix motions as they are superior
-- obviously wont be as good because of the visual mode shenanigans and everything
require("helixRemap")

-- nvim-tree
vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { desc = 'Toggle file tree' })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = 'Toggle file tree' })

-- hop
vim.keymap.set('n', 'gw', function() hopCommandWrapped("HopWord") end, { desc = 'Hop to Words' })
vim.keymap.set('n', 'gl', function() hopCommandWrapped("HopLine") end, { desc = 'Hop to Lines' })
vim.keymap.set('n', 'gs', function() hopCommandWrapped("HopPattern") end, { desc = 'Hop to Pattern' })