return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"echasnovski/mini.completion",
			"j-hui/fidget.nvim",
			"folke/lazydev.nvim",
		},
		config = function()
			require("mason").setup({
				PATH = "append",
			})
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
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
