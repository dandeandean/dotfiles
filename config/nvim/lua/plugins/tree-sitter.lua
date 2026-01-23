return {
	{ -- highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		highlight = {
			enable = true,
		},
		opts = {
			ensure_installed = { "lua" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
	},
}
