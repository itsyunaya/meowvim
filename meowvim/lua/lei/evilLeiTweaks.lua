-- nvim tree
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = 'Toggle file tree' }) -- space e to focus
vim.keymap.set("n", "<Esc>", "<cmd>wincmd p<CR>", { desc = "Leave Tree" }) -- esc to leave
vim.cmd("NvimTreeOpen") -- autostart tree
vim.cmd("wincmd p")

-- hop (no display cursor/cursorline)
vim.keymap.set('n', 'gw', function() hopCommandWrapped("HopWord") end, { desc = 'Hop to Words' })
vim.keymap.set('n', 'gl', function() hopCommandWrapped("HopLine") end, { desc = 'Hop to Lines' })
vim.keymap.set('n', 'gs', function() hopCommandWrapped("HopPattern") end, { desc = 'Hop to Pattern' })
