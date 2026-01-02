local map = vim.keymap.set

-- Set Leader Key
vim.g.mapleader = " "

-- Opens your actual Neovim config directory, regardless of where it is installed
map("n", "<Leader>fp", function()
	vim.cmd.edit(vim.fn.stdpath("config"))
end, { desc = "Open Neovim Config" })

-- Saves the file using Sudo (requires vim-suda plugin)
map("n", "<Leader>fs", "<cmd>silent! SudaWrite<cr>", { desc = "Save as Sudo" })

-- Better Terminal Exit
-- Allows you to exit terminal insert mode with standard Esc
map("t", "<esc>", [[<c-\><c-n>]], { desc = "Exit Terminal Mode" })

map("n", "n", "nzzzv", { desc = "Next Match & Center" })
map("n", "N", "Nzzzv", { desc = "Prev Match & Center" })

-- Smooth Scrolling with Mouse
-- Maps the wheel to scroll line-by-line (Ctrl-Y/E) rather than jumping
map("n", "<ScrollWheelUp>", "<C-Y>", { desc = "Scroll Up Line" })
map("n", "<ScrollWheelDown>", "<C-E>", { desc = "Scroll Down Line" })

-- Consistency: Make 'Y' behave like 'D' and 'C' (yank to end of line)
map("n", "Y", "y$", { desc = "Yank to End of Line" })

-- Keep cursor in place when joining lines
-- 'mz' sets a mark, 'J' joins, '`z' jumps back to the mark
map("n", "J", "mzJ`z", { desc = "Join Lines (Keep Cursor)" })

-- Quick Change Word
-- Pressing Enter immediately deletes the word under cursor and enters Insert mode
map("n", "<cr>", "ciw", { desc = "Change Inner Word" })

-- Undo Checkpoints
-- Creates a simplified undo history for specific punctuation in Insert mode
local checkpoints = { ".", ",", "!", "?" }
for _, char in ipairs(checkpoints) do
	map("i", char, char .. "<c-g>u", { desc = "Undo Checkpoint" })
end

-- Normal Mode
map("n", "<Leader>k", ":m .-2<CR>==", { desc = "Move Line Up" })
map("n", "<Leader>j", ":m .+1<CR>==", { desc = "Move Line Down" })

-- Insert Mode (Exit insert, move line, re-enter insert is tricky, sticking to your logic)
map("i", "<C-k>", "<esc>:m .-2<CR>==", { desc = "Move Line Up" })
map("i", "<C-j>", "<esc>:m .+1<CR>==", { desc = "Move Line Down" })

-- Visual Mode (Moves selection and re-indents with '=')
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })

-- Copy to System Clipboard ("+)
map({ "n", "v" }, "<Leader>y", [["+y]], { desc = "Copy to System Clipboard" })
map("n", "<Leader>Y", [["+Y]], { desc = "Copy Line to System Clipboard" })

-- Paste from System Clipboard ("+)
map({ "n", "v" }, "<Leader>p", [["+p]], { desc = "Paste from System Clipboard" })
map({ "n", "v" }, "<Leader>P", [["+P]], { desc = "Paste Before from System Clipboard" })

-- Copy Whole Buffer to Clipboard
map("n", "<Leader>d", [[:%y+<CR>]], { desc = "Copy Whole File to Clipboard" })
