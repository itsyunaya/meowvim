
-- unmap space behaving as l
vim.keymap.set({ "n", "x" }, "<Space>", "<Nop>")

vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { desc = 'Toggle file tree' })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = 'Toggle file tree' })