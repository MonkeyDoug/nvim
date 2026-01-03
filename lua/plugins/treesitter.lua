require("nvim-treesitter").install({ "python", "rust", "bash", "lua", "latex", "vim", "toml" })
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local ignored_ft = {
			"latex",
			"help",
			"dashboard",
			"dashboardpreview",
			"TelescopePrompt",
			"TelescopeResults",
			"minifiles",
			"text",
		}
		if vim.tbl_contains(ignored_ft, vim.bo[args.buf].filetype) then
			return
		end

		vim.treesitter.start() -- enable highlighting
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- enable indenting
	end,
})
