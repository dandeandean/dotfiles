return {
	"zk-org/zk-nvim",
	config = function()
		require("zk").setup({
			lsp = {
				config = {
					cmd = { "zk", "lsp" },
					name = "zk",
				},
				auto_attach = {
					enabled = true,
					filetypes = { "markdown" },
				},
				-- Make sure to set $ZK_NOTEBOOK_DIR
				vim.keymap.set("n", "<leader>zk", "<CMD>ZkNotes<CR>", { desc = "Zk" }),
				vim.keymap.set("n", "<leader>zt", "<CMD>ZkTags<CR>", { desc = "Zk Tags" }),
				vim.keymap.set("n", "<leader>zb", "<CMD>ZkBacklinks<CR>", { desc = "Zk Backlinks" }),
				vim.keymap.set("n", "<leader>znn", "<CMD>ZkNew<CR>", { desc = "Zk New New" }),
			},
		})
	end,
}
