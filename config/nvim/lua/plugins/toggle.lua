return {
	-- amongst your other plugins
	--{ "akinsho/toggleterm.nvim", version = "*", config = true },
	-- or
	-- TODO: Configure to get cwd & open there
	--
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				direction = "float",
			})
		end,
	},
	vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Term" }),
}
