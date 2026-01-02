local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"folke/lazy.nvim",
	"neovim/nvim-lspconfig",
	"lambdalisue/vim-suda",
	"junegunn/vim-slash",
	"andymass/vim-matchup",
	{
		"Mofiqul/dracula.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			require("plugins/dracula")
		end,
	},
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
		keys = {
			{
				"<Leader>o",
				function()
					require("oil").open()
				end,
				desc = "Open Parent Directory",
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = { options = { theme = "dracula-nvim" } },
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("plugins/dashboard")
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<Leader>b",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Telescope Buffers",
			},
			{
				"<Leader>fr",
				function()
					require("telescope.builtin").oldfiles({ layout_config = { width = 0.95, height = 0.95 } })
				end,
				desc = "Telescope Recent Files",
			},
			{
				"<Leader>ff",
				function()
					require("telescope.builtin").find_files({ layout_config = { width = 0.95, height = 0.95 } })
				end,
				desc = "Telescope Find Files",
			},
			{
				"<Leader>fg",
				function()
					require("telescope.builtin").live_grep({ layout_config = { width = 0.95, height = 0.95 } })
				end,
				desc = "Telescope Live Grep",
			},
			{
				"<Leader>fc",
				function()
					require("telescope.builtin").commands()
				end,
				desc = "Telescope Commands",
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"kdheepak/cmp-latex-symbols",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"lervag/vimtex",
		},
		config = function()
			require("plugins/nvim_cmp")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins/treesitter")
		end,
		build = ":TSUpdate",
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
		opts = {},
	},
	{
		"folke/trouble.nvim",
		lazy = false,
		opts = {
			focus = true,
		},
		keys = {
			{
				"<Leader>tt",
				"<CMD>Trouble diagnostics toggle<CR>",
			},
			{
				"<Leader>qf",
				"<CMD>Trouble qflist toggle<CR>",
			},
		},
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"L3MON4D3/LuaSnip",
		opts = {},
		build = "make install_jsregexp",
	},
	{
		"iurimateus/luasnip-latex-snippets.nvim",
		dependencies = { "L3MON4D3/LuaSnip" },
		config = function()
			require("luasnip-latex-snippets").setup({ use_treesitter = true })
			require("luasnip").config.setup({ enable_autosnippets = true })
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("plugins/indent")
		end,
	},
	"HiPhish/rainbow-delimiters.nvim",
	{ "karb94/neoscroll.nvim", opts = {} },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			vim.api.nvim_set_hl(0, "WhichKeyFloat", { fg = "#bd93f9" })
			vim.api.nvim_set_hl(0, "WhichKey", { fg = "#8be9fd" })
			vim.api.nvim_set_hl(0, "WhichKeySeparator", { fg = "#bd93f9" })
			vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = "#ff79c6" })
		end,
		opts = {},
	},
	{ "rcarriga/nvim-notify", opts = { background_color = "#000000" } },
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "sindrets/diffview.nvim", opts = {} },
	{
		"camspiers/animate.vim",
		init = function()
			vim.g["animate#duration"] = 175.0
		end,
		keys = {
			{
				"<Up>",
				"<cmd>call animate#window_delta_height(-10)<cr>",
				desc = "Animate Window Height -10",
			},
			{
				"<Down>",
				"<cmd>call animate#window_delta_height(10)<cr>",
				desc = "Animate Window Height +10",
			},
			{
				"<Left>",
				"<cmd>call animate#window_delta_width(-10)<cr>",
				desc = "Animate Window Width -10",
			},
			{
				"<Right>",
				"<cmd>call animate#window_delta_width(10)<cr>",
				desc = "Animate Window Width +10",
			},
		},
	},
	{
		"lervag/vimtex",
		config = function()
			require("plugins/vimtex")
		end,
		ft = { "tex", "plaintex" },
	},
	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<leader>s",
				function()
					require("conform").format({
						lsp_fallback = false,
						async = false,
						timeout_ms = 1000,
					})
					vim.cmd("w")
				end,
				mode = { "n", "v" },
				desc = "Format File",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				html = { "prettier" },
				tex = { "latexindent" },
				go = { "gofmt" },
				rust = { "rustfmt" },
				bash = { "shfmt" },
			},
		},
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
})
