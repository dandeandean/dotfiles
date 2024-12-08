return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "doom",
				config = {
					header = {
						"                                                       ",
						"                                                       ",
						"                                                       ",
						" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
						" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
						" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
						" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
						" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
						" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
						"                                                       ",
						"                                                       ",
						"                                                       ",
						"                                                       ",
					},
					center = {
						{
							icon = "󰏇	 ",
							desc = "Oil",
							key = "o",
							action = "Oil",
						},
						{
							icon = "	 ",
							desc = "Live Grep",
							key = "lg",
							action = "Telescope live_grep",
						},
						{
							icon = "	 ",
							desc = "Search Recent",
							key = "sr",
							action = "Telescope oldfiles",
						},
						{
							icon = "󰩈	 ",
							desc = "Quit",
							key = "q",
							action = "quit",
						},
					},
					footer = {},
				},
				-- hide = {
				-- 	statusline = true,
				-- 	tabline = true,
				-- 	winbar = true,
				-- },
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
