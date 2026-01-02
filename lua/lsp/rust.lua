vim.lsp.config("rust_analyzer", {
	on_attach = require("lsp/on_attach"),
})
vim.lsp.enable("rust_analyzer")
