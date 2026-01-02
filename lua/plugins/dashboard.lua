vim.api.nvim_set_var("dashboard_default_executive", "telescope")
vim.cmd("au FileType dashboard :highlight DashboardCenter guifg=#bd93f9")
vim.cmd("au FileType dashboard :highlight DashboardFooter guifg=#ff79c6")
local home = os.getenv("HOME")
local db = require("dashboard")
db.setup({
	theme = "doom",
	preview = {
		command = "cat | lolcat -F 0.3",
		file_path = home .. "/.config/nvim/neovim.cat",
		file_height = 8, file_width = 65,
	},
	config = {
		header = {}, --your header
		center = {
			{
				icon = "󰈢  ",
				desc = "Recently opened files                   ",
				action = "Telescope oldfiles",
				key = "SPC f r",
				icon_hl = "DashboardCenter",
				desc_hl = "DashboardFooter",
				key_hl = "Number",
			},
			{
				icon = "  ",
				desc = "Find  File                              ",
				action = "Telescope find_files find_command=rg,--hidden,--files",
				key = "SPC f f",
				icon_hl = "DashboardCenter",
				desc_hl = "DashboardFooter",
				key_hl = "Number",
			},
			{
				icon = "  ",
				desc = "File Browser                            ",
				action = "Telescope file_browser",
				key = "SPC f b",
				icon_hl = "DashboardCenter",
				desc_hl = "DashboardFooter",
				key_hl = "Number",
			},
		},
		footer = {}, --your footer
	},
})
