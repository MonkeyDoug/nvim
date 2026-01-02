require("telescope").setup()

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

map("n", "<Leader>b", [[<cmd>lua require("telescope.builtin").buffers()<cr>]], opt)
map(
	"n",
	"<Leader>fr",
	[[<cmd>lua require("telescope.builtin").oldfiles({layout_config = {width = 0.95,height = 0.95,},})<cr>]],
	opt
)
map(
	"n",
	"<Leader>ff",
	[[<cmd>lua require("telescope.builtin").find_files({layout_config = {width = 0.95,height = 0.95,},})<cr>]],
	opt
)
map(
	"n",
	"<Leader>fg",
	[[<cmd>lua require("telescope.builtin").live_grep({layout_config = {width = 0.95,height = 0.95,},})<cr>]],
	opt
)
map("n", "<Leader>fc", [[<cmd>lua require("telescope.builtin").commands()<cr>]], opt)
