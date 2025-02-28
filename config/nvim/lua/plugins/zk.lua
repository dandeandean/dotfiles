return {
	"zk-org/zk-nvim",
	config = function()
		require("zk").setup({
			-- can be "telescope", "fzf", "fzf_lua", "minipick", or "select" (`vim.ui.select`)
			-- it's recommended to use "telescope", "fzf", "fzf_lua", or "minipick"
			picker = "telescope",
			lsp = {
				-- `config` is passed to `vim.lsp.start_client(config)`
				config = {
					cmd = { "zk", "lsp" },
					name = "zk",
					--
					-- on_attach = ...
					-- etc, see `:h vim.lsp.start_client()`
				},

				-- automatically attach buffers in a zk notebook that match the given filetypes
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
