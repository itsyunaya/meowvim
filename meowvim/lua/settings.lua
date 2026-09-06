-- sane default settings, don't change these or get exploded
-- try to use vim.o over vim.opt when possible, since opt is a wrapper around o and slightly slower

vim.o.encoding = "utf-8"

vim.g.mapleader = " "
vim.o.mouse = ""

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.smartindent = true

vim.opt.fillchars:append({ eob = " " })
vim.o.cursorline = true

vim.o.wrap = false

vim.o.number = true
vim.o.relativenumber = true

vim.o.showmode = false
