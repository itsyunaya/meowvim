
-- unmap space behaving as l
vim.keymap.set({ "n", "x" }, "<Space>", "<Nop>")

-- nvim-tree
vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { desc = 'Toggle file tree' })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = 'Toggle file tree' })

-- hop
vim.keymap.set('n', 'gw', function() hopCommandWrapped("HopWord") end, { desc = 'Hop to Words' })
vim.keymap.set('n', 'gl', function() hopCommandWrapped("HopLine") end, { desc = 'Hop to Lines' })
vim.keymap.set('n', 'gs', function() hopCommandWrapped("HopPattern") end, { desc = 'Hop to Pattern' })