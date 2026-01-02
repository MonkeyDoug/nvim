local util = require("lspconfig/util")

local root_pattern = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")

vim.lsp.config("clangd", {
	on_attach = require("lsp/on_attach"),
	single_file_support = true,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
vim.lsp.enable("clangd")
