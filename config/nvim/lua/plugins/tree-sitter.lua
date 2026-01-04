return {
	{ -- highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "lua" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
	},
}
