local au = vim.api.nvim_create_autocmd
local cmd = vim.api.nvim_command

au("TermOpen", {
	pattern = "*",
	callback = function()
		vim.wo.relativenumber = false
	end,
})

-- au("BufWritePre", {
--   pattern = "*",
--   callback = function() vim.lsp.buf.format() end
-- })

-- au("BufWritePost", {
-- 	pattern = "plugin_packer.lua",
-- 	callback = function() cmd [[PackerCompile]] end
-- })

-- au("VimEnter", { pattern = "*", callback = function() cmd [[COQnow -s]] end })

-- au("BufEnter", {
-- 	pattern = "scratchpad",
-- 	callback = function()
-- 		vim.bo.buftype = 'nofile'
-- 		vim.bo.bufhidden = 'hide'
-- 		vim.bo.swapfile = false
-- 	end
-- })
--
-- au("BufEnter", {
-- 	pattern = "calc",
-- 	callback = function()
-- 		vim.bo.buftype = 'tex'
-- 		vim.bo.bufhidden = 'delete'
-- 		vim.bo.swapfile = false
-- 	end
-- })

require("autocmd/c")
require("autocmd/c0")
require("autocmd/cpp")
require("autocmd/haskell")
require("autocmd/lua")
require("autocmd/java")
require("autocmd/sql")
require("autocmd/tex")
require("autocmd/toml")
require("autocmd/html")
require("autocmd/js")
require("autocmd/sml")
require("autocmd/deriv")
require("autocmd/r")
require("autocmd/prolog")
require("autocmd/qmd")
require("autocmd/go")
require("autocmd/rust")
