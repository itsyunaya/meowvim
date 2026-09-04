-- the rust lsp might not always be available, since i am not bundling it with this config.
-- in that case the user should be notified, and the lack of lsp handled gracefully
if vim.fn.executable("rust-analyzer") == 0 then
	vim.notify("Rust LSP unavailable.", vim.log.levels.WARN)
else
	vim.lsp.enable("rust_analyzer")
end
