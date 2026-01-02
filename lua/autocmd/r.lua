local au = vim.api.nvim_create_autocmd

au("BufEnter", {
	pattern = "*.Rmd",
	callback = function()
		-- Buffer Options
		vim.wo.spell = true
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
	end,
})

au("BufLeave", {
	pattern = "*.Rmd",
	callback = function()
		-- Buffer Options
		vim.wo.spell = false
	end,
})
