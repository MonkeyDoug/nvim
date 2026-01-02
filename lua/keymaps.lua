local map = vim.keymap.set

vim.g.mapleader = " "
map("n", "<Leader>fp", [[<CMD>e ~/.config/nvim/<CR>]]) -- Open Config Directory

-- map("n", "<Leader>fn", [[<CMD>e scratchpad<CR>]]) -- Open Scratchpad

-- map("n", "<Leader>fs", [[<CMD>silent! SudaWrite<CR>]]) -- Sudo Write
-- map("n", "<Leader>q", [[<CMD>qa<CR>]]) -- Quit all

-- map("n", "<Leader>s", [[<CMD>Neoformat | w<CR>]])

map("n", "Y", "y$")

-- Centered Cursor
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- Undo checkpoints
map("i", ".", ".<c-g>u")
map("i", ",", ",<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "?", "?<c-g>u")

-- Moving text
map("n", "<Leader>k", ":m .-2<CR>==")
map("n", "<Leader>j", ":m .+1<CR>==")
map("i", "<C-k>", "<esc>:m .-2<CR>==")
map("i", "<C-j>", "<esc>:m .+1<CR>==")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")

-- Copy to clipboard
map("n", "<Leader>Y", '"+Y')
map("v", "<Leader>y", '"+y')

-- Paste from clipboard
map("n", "<Leader>p", '"+p')
map("n", "<Leader>P", '"+P')
map("v", "<Leader>p", '"+p')
map("v", "<Leader>P", '"+P')
map("n", "<c-c>", '"+y')
-- map('n', '<c-v>', '"+p')
map("v", "<c-c>", '"+y')
-- map('i', '<c-v>', '<c-r>+')
-- map('c', '<c-v>', '<c-r>+')
map("i", "<c-r>", "<c-v>+")

-- Autoformat
map("n", "<Leader>af", [[<CMD>Neoformat<CR>]])

-- Yank entire buffer
map("n", "<Leader>d", [[:%y+<CR>]])

-- Animated Window Resizing
map("n", "<Up>", [[<CMD>call animate#window_delta_height(-10)<CR>]])
map("n", "<Down>", [[<CMD>call animate#window_delta_height(10)<CR>]])
map("n", "<Left>", [[<CMD>call animate#window_delta_width(-10)<CR>]])
map("n", "<Right>", [[<CMD>call animate#window_delta_width(10)<CR>]])

-- Docstrings
map("n", "<Leader>gd", [[<CMD>:lua require('neogen').generate()<CR>]])

-- Terminal
map("t", "<esc>", [[<c-\><c-n>]])

-- Change GUI Font
map("n", "<c-=>", [[:call ChangeFontSize(1)<CR>]])
map("n", "<c-->", [[:call ChangeFontSize(-1)<CR>]])

-- Smooth scroll using mouse wheel
map("n", "<ScrollWheelUp>", [[<C-Y>]])
map("n", "<ScrollWheelDown>", [[<C-E>]])

map("i", "<C-BS>", "<Esc>cvb")
map("n", "<cr>", "ciw")
