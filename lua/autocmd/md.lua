local au = vim.api.nvim_create_autocmd

au("BufEnter", {
	pattern = { "*.md" },
	callback = function()
		vim.wo.spell = true
		vim.wo.conceallevel = 2
		vim.api.nvim_buf_set_keymap(0, "i", "<C-l>", [[<c-g>u<Esc>[s1z=`]a<c-g>u]], opt)
	end,
})

au("BufLeave", {
	pattern = "*.tex",
	callback = function()
		vim.wo.spell = false
	end,
})
