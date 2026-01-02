require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"cpp",
		"python",
		"lua",
		"bash",
		"latex",
		"java",
		"toml",
		"vim",
		"rust",
	},
	highlight = { enable = true, disable = {"latex"} },
	indent = { enable = true },
	incremental_selection = { enable = true },
	matchup = { enable = true },
})
