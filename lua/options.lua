local o = vim.o
local g = vim.g

o.hls = true -- Disable highlighting of all results found in search
g.loaded_matchparen = 1 -- Disable highlighting matching parentheses
o.termguicolors = true -- Enables true color support
o.relativenumber = true -- Enable relative line numbers
o.number = true -- Enable relative line numbers
o.autochdir = false -- Enables neovim to change working directory on every file change

o.expandtab = false -- Expands tab into spaces
o.autoindent = true -- Enables automatic indenting

o.laststatus = 3 -- Global statusline

-- Mouse Support
o.mouse = "a"

-- Spell Check
o.spelllang = "en,cjk"

-- Hide Vertical Split
vim.opt.fillchars = { vert = " ", fold = " " }
