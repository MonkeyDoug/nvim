require("nvim-tree").setup({
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		icons = { hint = "", info = "", warning = "", error = "" },
	},
	disable_netrw = true,
	hijack_cursor = true,
})

local opt = { silent = true, noremap = true }
local map = vim.api.nvim_set_keymap

map("n", "<Leader>o", ":NvimTreeToggle<CR>", opt)
map("n", "<Leader>n", ":NvimTreeFindFile<CR>", opt)
