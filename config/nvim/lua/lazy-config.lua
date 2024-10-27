return {
	require("lazy").setup({
		require("kickstart.plugins.startup"),
		require("kickstart.plugins.vim-sleuth"),
		require("kickstart.plugins.comment"),
		require("kickstart.plugins.gitsigns"),
		require("kickstart.plugins.telescope"),
		require("kickstart.plugins.lspconfig"),
		require("kickstart.plugins.conform"),
		require("kickstart.plugins.autocomplete"),
		require("kickstart.plugins.theme"),
		require("kickstart.plugins.todo"),
		require("kickstart.plugins.mini"),
		require("kickstart.plugins.tree-sitter"),
		require("kickstart.plugins.vim-helm"),
	}, {
		ui = {
			-- If you have a Nerd Font, set icons to an empty table which will use the
			-- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
			-- icons = vim.g.have_nerd_font and {} or {
			icons = {
				cmd = "⌘",
				config = "🛠",
				event = "📅",
				ft = "📂",
				init = "⚙",
				keys = "🗝",
				plugin = "🔌",
				runtime = "💻",
				require = "🌙",
				source = "📄",
				start = "🚀",
				task = "📌",
				lazy = "💤 ",
			},
		},
	}),
}
