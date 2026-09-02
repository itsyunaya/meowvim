
-- nvim
vim.keymap.set({ "n", "x" }, "<Space>", "<Nop>") -- unmap space behaving as l

-- nvim-tree
vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { desc = 'Toggle file tree' })

-- hop
vim.keymap.set('n', 'gw', "<cmd>HopWord<CR>", { desc = 'Hop to Words' })
vim.keymap.set('n', 'gl', "<cmd>HopLine<CR>", { desc = 'Hop to Lines' })
vim.keymap.set('n', 'gs', "<cmd>HopPattern<CR>", { desc = 'Hop to Pattern' })