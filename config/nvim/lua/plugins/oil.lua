return {
	{
		"stevearc/oil.nvim",
		config = function()
			vim.keymap.set("n", ";", "<CMD>Oil<CR>")
			require("oil").setup({
				view_options = {
					show_hidden = true,
				},
			})
		end,
	},
}
