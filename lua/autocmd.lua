local au = vim.api.nvim_create_autocmd

au("TermOpen", {
	pattern = "*",
	callback = function()
		vim.wo.relativenumber = false
	end,
})

require("autocmd/c")
require("autocmd/cpp")
require("autocmd/lua")
require("autocmd/tex")
require("autocmd/toml")
require("autocmd/html")
require("autocmd/rust")
require("autocmd/python")
