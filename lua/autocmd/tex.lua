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

		-- require("nabla").toggle_virt()
		-- vim.o.wrap = true

		-- Correct misspelled word
		vim.api.nvim_buf_set_keymap(0, "i", "<C-l>", [[<c-g>u<Esc>[s1z=`]a<c-g>u]], opt)

		-- -- Import figure with name of current line
		-- vim.api.nvim_buf_set_keymap(0, 'i', '<C-f>',
		--                             '<CMD>lua LatexImage(vim.fn.line("."),vim.fn.getline("."))<CR>',
		--                             {noremap = true})
		--
		-- -- Importing or Creating the document under the cursor
		-- vim.api.nvim_buf_set_keymap(0, 'i', '<C-a>',
		--                             '<CMD>lua LatexImport(vim.fn.line("."),vim.fn.getline("."),vim.fn.expand("%:t"),"false")<CR>',
		--                             {noremap = true})
		--
		-- -- Importing selected subdocuments
		-- vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>li',
		--                             '<CMD>lua LatexImport(vim.fn.line("."),false,vim.fn.expand("%:t"),"false")<CR>',
		--                             {noremap = true})
		--
		-- -- Importing all subdocuments
		-- vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>la',
		--                             '<CMD>lua LatexImport(vim.fn.line("."),false,vim.fn.expand("%:t"),"true")<CR>',
		--                             {noremap = true})
		--
		-- -- Evaluating expressions
		-- vim.api.nvim_buf_set_keymap(0, 'i', '<C-e>',
		--                             '<CMD>lua LatexEval(vim.fn.line("."),vim.fn.getline("."))<CR>',
		--                             {noremap = true})
		-- vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>le',
		--                             '<CMD>lua LatexEval(vim.fn.line("."),false)<CR>',
		--                             {noremap = true})
		-- vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ls',
		--                             '<CMD>lua LatexEval(vim.fn.line("."),false)<CR>',
		--                             {noremap = true})
		-- vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>e',
		--                             '<CMD>lua LatexPEval(vim.fn.line("."))<CR>',
		--                             {noremap = true})
		-- vim.api.nvim_buf_set_keymap(0, 'n', '<F1>',
		--                             [[<CMD>lua LatexTerm()<CR>]],
		--                             {noremap = true})
		-- vim.api.nvim_buf_set_keymap(0, 'n', '<F2>',
		--                             [[<CMD>lua LatexConvert()<CR>]],
		--                             {noremap = true})
		-- vim.api.nvim_buf_set_keymap(0, 'n', '<F3>',
		--                             '<CMD>lua LatexFigure(vim.fn.line("."),vim.fn.getline("."))<CR>',
		--                             {noremap = true})
	end,
})
au("BufLeave", {
	pattern = "*.tex",
	callback = function()
		vim.wo.spell = false
	end,
})
