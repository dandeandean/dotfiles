return {
	clangd = {},
	gopls = {},
	pyright = {},
	rust_analyzer = {},
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
