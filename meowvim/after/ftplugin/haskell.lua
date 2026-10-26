if vim.fn.executable("haskell-language-server-wrapper") == 0 then
	vim.notify("Language server " .. "Haskell Language Server" .. " is unavailable")
else
	vim.lsp.enable("hls")
end
