return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "doom",
				config = {
					-- from: https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/text/neovim.lua
					header = {
						[[                                                                                                   ]],
						[[ /\\\\\_____/\\\_______________________________/\\\________/\\\___________________________         ]],
						[[ \/\\\\\\___\/\\\______________________________\/\\\_______\/\\\__________________________         ]],
						[[ _\/\\\/\\\__\/\\\______________________________\//\\\______/\\\___/\\\_____________________       ]],
						[[  _\/\\\//\\\_\/\\\_____/\\\\\\\\______/\\\\\_____\//\\\____/\\\___\///_____/\\\\\__/\\\\\__       ]],
						[[   _\/\\\\//\\\\/\\\___/\\\/////\\\___/\\\///\\\____\//\\\__/\\\_____/\\\__/\\\///\\\\\///\\\_     ]],
						[[    _\/\\\_\//\\\/\\\__/\\\\\\\\\\\___/\\\__\//\\\____\//\\\/\\\_____\/\\\_\/\\\_\//\\\__\/\\\     ]],
						[[     _\/\\\__\//\\\\\\_\//\\///////___\//\\\__/\\\______\//\\\\\______\/\\\_\/\\\__\/\\\__\/\\\_   ]],
						[[      _\/\\\___\//\\\\\__\//\\\\\\\\\\__\///\\\\\/________\//\\\_______\/\\\_\/\\\__\/\\\__\/\\\   ]],
						[[       _\///_____\/////____\//////////_____\/////___________\///________\///__\///___\///___\///__ ]],
						[[                                                                                                   ]],
					},

					center = {
						-- search symbols
						{
							icon = "󰏇	 ",
							desc = "Oil",
							key = ";",
							action = "Oil",
						},
						{
							icon = "	 ",
							desc = "Live Grep",
							key = "lg",
							action = "Telescope live_grep",
						},
						{
							icon = "	 ",
							desc = "Search files",
							key = "sf",
							action = "Telescope find_files",
						},
						{
							icon = "󰭤	 ",
							desc = "Zettlekasten",
							key = "zk",
							action = "ZkNotes",
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
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
