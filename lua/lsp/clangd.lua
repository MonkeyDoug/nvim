local util = require("lspconfig/util")

local root_pattern = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")

require("lspconfig").clangd.setup({
	on_attach = require("lsp/on_attach"),
	-- root_dir = function(fname)
	--   local filename = util.path.is_absolute(fname) and fname or util.path.join(vim.loop.cwd(), fname)
	--   return root_pattern(filename) or util.path.dirname(filename)
	-- end,
	single_file_support = true,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
