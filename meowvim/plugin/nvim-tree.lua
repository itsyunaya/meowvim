-- https://github.com/nvim-tree/nvim-tree.lua

local function disableCursorInBuffer()
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

local function displayNodeInWinbar(treeApi, bufnr)
    vim.api.nvim_create_autocmd({ "CursorMoved", "BufEnter", "WinEnter" }, {
        buffer = bufnr,
        callback = function()
            local node = treeApi.tree.get_node_under_cursor()
            local ending = ""
            local icon = ""

            if node.type == "directory" then
                ending = "/"
                icon = " "
            else
                icon = require("nvim-web-devicons").get_icon(node.name, node.extension, { default = true }) .. " "
            end
            vim.wo.winbar = " %#NvimTreeWinbarTitle# ".. icon .. node.name .. ending
        end,
    })
end

require("nvim-tree").setup({
    on_attach = function(bufnr)
        local treeApi = require("nvim-tree.api")
        treeApi.config.mappings.default_on_attach(bufnr)

        -- theme

        disableCursorInBuffer()
        displayNodeInWinbar(treeApi, bufnr)

        -- mappings

        -- hl also opens the file so you can nav with hjkl
        vim.keymap.set("n", "l", treeApi.node.open.edit, { desc = "Open Tree", buffer = bufnr, nowait = true, })
        vim.keymap.set("n", "h", treeApi.node.open.edit, { desc = "Open Tree", buffer = bufnr, nowait = true, })
    end,

    renderer = {
        root_folder_label = function()
			return ""
		end, -- make parent folder an empty line
        highlight_git = "name",
        icons = {
            show = {
				git = false,
				folder_arrow = false,
			},
        },

		indent_width = 2,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "╰",
				edge = "│",
				item = "├",
				bottom = "─",
				none = " ",
			},
		},
    },

    -- hide custom patterns here if ever
    filters = {
        custom = {},
    },

    git = { -- show gitignored files (why is this disabled by default)
        ignore = false,
		show_on_dirs = true,
		show_on_open_dirs = false,
    },

	modified = { -- unsaved changes
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = false,
	},
})

