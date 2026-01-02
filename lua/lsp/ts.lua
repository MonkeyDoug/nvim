local prettier = {
	formatCommand = [[prettier --use-tabs]],
}

require("lspconfig").ts_ls.setup({
	on_attach = require("lsp/on_attach"),
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	settings = { language = { typescript = { prettier } } },
})
