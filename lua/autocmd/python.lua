local au = vim.api.nvim_create_autocmd

au("BufEnter", {
	pattern = "*.py",
	callback = function()
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
		-- vim.bo.tw = 79
	end,
})
