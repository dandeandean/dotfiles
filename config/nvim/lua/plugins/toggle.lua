return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				-- direction = "tab",
				start_in_insert = true,
			})
		end,
	},
	vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Toggle Term" }),
	vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" }),
}
