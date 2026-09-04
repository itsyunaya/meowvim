-- nvim
vim.keymap.set({ "n", "x" }, "<Space>", "<Nop>") -- unmap space behaving as l

-- nvim-tree
vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })

-- hop
vim.keymap.set("n", "gw", "<cmd>HopWord<CR>", { desc = "Hop to Words" })
vim.keymap.set("n", "gl", "<cmd>HopLine<CR>", { desc = "Hop to Lines" })
vim.keymap.set("n", "gs", "<cmd>HopPattern<CR>", { desc = "Hop to Pattern" })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fp", "<cmd>NeovimProjectDiscover history<CR>", { desc = "Telescope projects" })
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Telescope Todos" })

-- render-markdown
vim.keymap.set("n", "<leader>m", "<cmd>RenderMarkdown toggle<CR>", { desc = "Render Markdown" })

-- conform
vim.keymap.set("n", "<leader>l", function()
	require("conform").format({ bufnr = 0 })
end, { desc = "Format the current buffer" })

-- toggleterm
vim.keymap.set({ "n", "t" }, "<leader>q", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
