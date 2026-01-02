require("lspconfig").jdtls.setup({
	on_attach = require("lsp/on_attach"),
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
