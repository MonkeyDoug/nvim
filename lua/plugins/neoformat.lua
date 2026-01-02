vim.g.shfmt_opt = "-ci"
vim.g.neoformat_enabled_haskell = { "brittany" }
vim.g.neoformat_enabled_python = { "black" }
vim.keymap.set("n", "<Leader>s", [[<CMD>Neoformat | w<CR>]])
