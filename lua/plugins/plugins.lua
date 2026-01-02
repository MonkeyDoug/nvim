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
	{
		"Mofiqul/dracula.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			require("plugins/dracula")
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins/nvim-tree")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = { options = { theme = "dracula-nvim" } },
	},
	{
		"nvimdev/dashboard-nvim",
		config = function()
			require("plugins/dashboard")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins/telescope")
		end,
	},
	"neovim/nvim-lspconfig",
	{
		"hrsh7th/nvim-cmp",
		-- event = { "InsertEnter" },
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
			"jmbuhr/otter.nvim",
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
		-- config = function()
		-- 	require("plugins/trouble")
		-- end,
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
	"junegunn/vim-slash",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("plugins/autopairs")
		end,
	},
	"andymass/vim-matchup",
	{
		"L3MON4D3/LuaSnip",
		opts = {},
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{
		"iurimateus/luasnip-latex-snippets.nvim",
		-- vimtex isn't required if using treesitter
		dependencies = { "L3MON4D3/LuaSnip" },
		config = function()
			require("luasnip-latex-snippets").setup({ use_treesitter = true })
			-- or setup({ use_treesitter = true })
			require("luasnip").config.setup({ enable_autosnippets = true })
		end,
	},
	"jez/vim-better-sml",
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("plugins/indent")
		end,
		-- version = "3.5.2",
	},
	"HiPhish/rainbow-delimiters.nvim",
	{ "karb94/neoscroll.nvim", opts = {} },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			require("plugins/which")
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({})
		end,
	},
	{ "rcarriga/nvim-notify", opts = { background_color = "#000000" } },
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "sindrets/diffview.nvim", opts = {} },
	{
		"camspiers/animate.vim",
		config = function()
			require("plugins/animate")
		end,
	},
	{
		"lervag/vimtex",
		config = function()
			require("plugins/vimtex")
		end,
		ft = { "tex", "plaintex" },
	},
	{
		"kiyoon/jupynium.nvim",
		lazy = false,
		build = "~/.config/nvim/nvim/.venv/bin/pip3 install .",
		dependencies = { "rcarriga/nvim-notify", "stevearc/dressing.nvim" },
		opts = {
			auto_start_server = {
				enable = false,
			},
		},
	},
	{
		"jmbuhr/otter.nvim",
		dev = false,
		dependencies = {
			{
				"neovim/nvim-lspconfig",
				"nvim-treesitter/nvim-treesitter",
			},
		},
		opts = {},
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
				python = { "black" }, -- Define the formatter for python
				quarto = { "injected" }, -- Use injected formatter for Quarto files
				html = { "prettier" },
				tex = { "latexindent" },
				go = { "gofmt" },
				rust = { "rustfmt" },
				bash = { "shfmt" },
			},
			injected = {
				options = {
					ignore_errors = false,
					lang_to_ext = {
						python = "py",
					},
					lang_to_formatters = {
						python = { "black" }, -- Define the formatter for python
					},
				},
			},
		},
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").set_default_mappings()
		end,
	},
})
