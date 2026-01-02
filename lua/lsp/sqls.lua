require("lspconfig").sqls.setup({
	settings = {
		sqls = {
			connections = {
				{
					driver = "postgresql",
					dataSourceName = "host=localhost port=27140 user=postgres password=password dbname=arbdb",
				},
			},
		},
	},
	on_attach = function(client, bufnr)
		require("sqls").on_attach(client, bufnr)
	end,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
