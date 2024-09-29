return {
	{
		clangd = {},
		gopls = {},
		pyright = {},
		rust_analyzer = {},
		yamlls = {
			settings = {
				yaml = {
					schemaStore = {
						enable = false,
						url = "",
					},
					-- Set up Pipeline tooling
					schemas = {
						--["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci.yml",
						--["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "ci/*.yml",
						["https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json"] = "docker-compose*.{yml,yaml}",
						--["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "BuildTools/*.{yml,yaml}",
						-- These schemas aren't working, so we need to debug locally
						["/Users/dandean/git/CNPPipe/schema/schema.json"] = "YamlDefinitions/*.{yaml,yml}",
					},
				},
			},
		},

		lua_ls = {
			-- cmd = {...},
			-- filetypes { ...},
			-- capabilities = {},
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
					-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
					-- diagnostics = { disable = { 'missing-fields' } },
				},
			},
		},
	},
}
