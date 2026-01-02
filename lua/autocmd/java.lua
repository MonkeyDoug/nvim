local au = vim.api.nvim_create_autocmd

au("BufEnter", {
	pattern = "*.java",
	callback = function()
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
	end,
})
