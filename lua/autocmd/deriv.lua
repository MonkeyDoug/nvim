local au = vim.api.nvim_create_autocmd

au("BufEnter", {
	pattern = { "*.deriv"},
	callback = function()
		-- Buffer Options
		vim.bo.tabstop = 3
		vim.bo.shiftwidth = 3
	end,
})
