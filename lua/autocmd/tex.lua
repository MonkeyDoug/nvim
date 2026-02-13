local au = vim.api.nvim_create_autocmd
local opt = { silent = true, noremap = true }

au("User", {
	pattern = "VimtexEventQuit",
	callback = function()
		vim.fn["vimtex#compiler#clean"](0)
	end,
})

au("BufEnter", {
	pattern = "*.tex",
	callback = function()
		vim.wo.spell = true

		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.wo.conceallevel = 2
		vim.bo.expandtab = true
		vim.api.nvim_buf_set_keymap(0, "i", "<C-l>", [[<c-g>u<Esc>[s1z=`]a<c-g>u]], opt)
	end,
})

au("BufLeave", {
	pattern = "*.tex",
	callback = function()
		vim.wo.spell = false
	end,
})
