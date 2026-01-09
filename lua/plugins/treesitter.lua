require("nvim-treesitter").install({ "python", "rust", "bash", "lua", "latex", "vim", "toml" })

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		-- List of filetypes you want to ENABLE
		local accepted_ft = {
			"python",
			"rust",
			"bash",
			"sh",
			"lua",
			"tex",
			"vim",
			"toml",
		}

		-- Check if the current filetype is in the accepted list
		-- If it is NOT in the list, we return (stop)
		if not vim.tbl_contains(accepted_ft, vim.bo[args.buf].filetype) then
			return
		end

		vim.treesitter.start() -- enable highlighting
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- enable indenting
	end,
})
