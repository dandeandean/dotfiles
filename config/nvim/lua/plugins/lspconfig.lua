return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"echasnovski/mini.completion",
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/lazydev.nvim", ft = "lua" },
		},
		config = function()
			require("mini.completion").setup()
			require("mason").setup()
			require("mason-lspconfig").setup({
				automatic_enable = true,
				ensure_installed = {
					"yamlls",
					"lua_ls",
					"gopls", -- Used for golang
					"helm_ls", -- Used for helm
				},
			})
			vim.lsp.config("*", {
				capabilities = vim.lsp.protocol.make_client_capabilities(),
			})
			--require("custom.plugins.lsp-attach")
		end,
	},
}
