return {
	{
		clangd = {},
		gopls = {},
		pyright = {},
		rust_analyzer = {},
		helm_ls = {},
		yamlls = {
			settings = {
				yaml = {
					schemaStore = {
						enable = false,
						url = "",
					},
					-- Set up Pipeline tooling
					schemas = {
						["https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json"] = "docker-compose*.{yml,yaml}",
						["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "BuildTools/*.{yml,yaml}",
					},
				},
			},
		},
		lua_ls = {
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		},
	},
}
