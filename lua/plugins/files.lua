require("mini.files").setup()

vim.keymap.set("n", "<leader>o", function()
	-- Get the current buffer's path
	local buf_name = vim.api.nvim_buf_get_name(0)

	-- Check if the file exists; if not, fallback to CWD
	local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()

	require("mini.files").open(path)
end, { desc = "Open mini.files (Current File Directory)" })
