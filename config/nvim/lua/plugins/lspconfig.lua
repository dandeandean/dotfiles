return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"echasnovski/mini.completion",
			{ "j-hui/fidget.nvim", opts = {} },
			--{ "folke/neodev.nvim", opts = {} },
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
			},
		},
		config = function()
			require("custom.plugins.lsp-attach")
			require("mini.completion").setup()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			--capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
			local servers = {
				yamlls = {
					settings = {
						yaml = {
							diagnostics = {
								disable = {
									"missing-fields",
								},
							},
							schemas = {
								["https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json"] = "docker-compose*.{yml,yaml}",
								["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
									"BuildTools/*.{yml,yaml}",
									"YamlDefinitions/*.{yml,yaml}",
									"YamlTemplates/*.{yml,yaml}",
								},
							},
						},
					},
				},
				lua_ls = {
					settings = {
						Lua = {
							indent_style = "space",
							indent_size = "2",
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
			}

			-- Ensure the servers and tools above are installed
			--  To check the current status of installed tools and/or manually install
			--  other tools, you can run
			--    :Mason
			--
			--  You can press `g?` for help in this menu
			require("mason").setup()

			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format lua code
				"gopls", -- Used for golang
				"helm-ls", -- Used for helm
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
