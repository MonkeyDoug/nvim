local au = vim.api.nvim_create_autocmd

au("BufEnter", {
	pattern = { "*.md" },
	callback = function(args)
		vim.wo.spell = true
		vim.wo.conceallevel = 2
		vim.keymap.set("i", "<C-l>", [[<c-g>u<Esc>[s1z=`]a<c-g>u]], {
			buffer = args.buf,
			remap = false,
			silent = true,
		})
		require("render-markdown").enable()
		vim.keymap.set("n", "\\lv", "<cmd>MarkdownPreviewToggle<cr>", {
			buffer = args.buf,
			desc = "Toggle Markdown Preview",
		})
	end,
})

au("BufLeave", {
	pattern = "*.md",
	callback = function()
		vim.wo.spell = false
	end,
})
