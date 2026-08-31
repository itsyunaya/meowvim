-- https://github.com/nvim-tree/nvim-tree.lua
require("nvim-tree").setup({
    on_attach = function(bufnr)
        local treeApi = require("nvim-tree.api")
        treeApi.config.mappings.default_on_attach(bufnr)

        -- theme

        -- hide small cursor and highlight selected line
        vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "#150015" })
        disableCursorInBuffer()

        -- mappings

        -- hl also opens the file so you can nav with hjkl
        vim.keymap.set("n", "l", treeApi.node.open.edit, { desc = "Open Tree", buffer = bufnr, nowait = true, })
        vim.keymap.set("n", "h", treeApi.node.open.edit, { desc = "Open Tree", buffer = bufnr, nowait = true, })
    end,
})

function disableCursorInBuffer()
    vim.api.nvim_create_autocmd({ 'WinEnter', 'BufWinEnter' }, {
        pattern = 'NvimTree*',
        callback = function()
            local def = vim.api.nvim_get_hl_by_name('Cursor', true)
            vim.api.nvim_set_hl(0, 'Cursor', vim.tbl_extend('force', def, { blend = 100 }))
            vim.opt.guicursor:append('a:Cursor/lCursor')
        end,
    })

    vim.api.nvim_create_autocmd({ 'BufLeave', 'WinClosed' }, {
        pattern = 'NvimTree*',
        callback = function()
            local def = vim.api.nvim_get_hl_by_name('Cursor', true)
            vim.api.nvim_set_hl(0, 'Cursor', vim.tbl_extend('force', def, { blend = 0 }))
            vim.opt.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'
        end,
    })
end