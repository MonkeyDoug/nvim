require("nvim-treesitter").install({ "python", "rust", "bash", "lua", "latex", "vim", "toml", "markdown", "markdown_inline" })

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		-- List of filetypes you want to ENABLE
		local accepted_ft = {
			"python",
			"rust",
			"bash",
			"sh",
			"lua",
			"vim",
			"toml",
			"md",
		}

		-- Check if the current filetype is in the accepted list
		-- If it is NOT in the list, we return (stop)
		if not vim.tbl_contains(accepted_ft, vim.bo[args.buf].filetype) then
			return
		end

		vim.treesitter.start() -- enable highlighting
	end,
})
