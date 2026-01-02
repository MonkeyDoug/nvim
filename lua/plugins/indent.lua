local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#ff5555" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#f1fa8c" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#bd93f9" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#ffb86c" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#50fa7b" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#ff79c6" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#8be9fd" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup({
	indent = { highlight = highlight },
	exclude = {
		buftypes = { "terminal", "dashboard", "help", "NvimTree", "TelescopePrompt", "lazy" },
		filetypes = { "terminal", "dashboard", "help", "NvimTree", "TelescopePrompt", "lazy" },
	},
})

-- require("ibl").setup()
