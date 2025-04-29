return {
	{
		"nvimdev/dashboard-nvim",
		enabled = false,
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "doom",
				config = {
					-- from: https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/text/neovim.lua
					header = {
						[[]],
						[[                                                                     ]],
						[[                                                                     ]],
						[[                                                                     ]],
						[[                                            .-----.                  ]],
						[[                 .----------------------.   | === |                  ]],
						[[                 |.-""""""""""""""""""-.|   |-----|                  ]],
						[[                 ||                    ||   | === |                  ]],
						[[                 ||        NVIM        ||   |-----|                  ]],
						[[                 ||                    ||   | === |                  ]],
						[[                 ||                    ||   |-----|                  ]],
						[[                 ||:wq                 ||   |:::::|                  ]],
						[[                 |'-..................-'|   |____o|                  ]],
						[[                 `"")----------------(""`   ___________              ]],
						[[                /::::::::::|  |::::::::::\  \ no mouse \             ]],
						[[               /:::========|  |==hjkl==:::\  \ required \            ]],
						[[              '""""""""""""'  '""""""""""""'  '""""""""""'           ]],
						[[                                                                     ]],
						[[]],
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
							icon = "	 ",
							desc = "Search Recent",
							key = "sr",
							action = "Telescope oldfiles",
						},
						{
							icon = "	 ",
							desc = "Search Keymaps",
							key = "sk",
							action = "Telescope keymaps",
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
