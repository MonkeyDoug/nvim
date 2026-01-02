local map = vim.api.nvim_set_keymap
local opt = {silent = true, noremap = true}
vim.cmd([[let g:animate#duration = 175.0]])

map('n', '<Up>', [[<cmd>call animate#window_delta_height(-10)<cr>]], opt)
map('n', '<Down>', [[<cmd>call animate#window_delta_height(10)<cr>]], opt)
map('n', '<Left>', [[<cmd>call animate#window_delta_width(-10)<cr>]], opt)
map('n', '<Right>', [[<cmd>call animate#window_delta_width(10)<cr>]], opt)
