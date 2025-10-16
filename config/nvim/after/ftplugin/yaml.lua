local set = vim.opt_local
vim.lsp.config("yamlls", {
	settings = {
		yaml = {
			diagnostics = {
				disable = {
					"missing-fields",
				},
			},
			format = {
				enable = false,
			},
			schemas = {
				["https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json"] = "docker-compose*.{yml,yaml}",
			},
		},
	},
})

set.number = true
set.relativenumber = true
set.cursorcolumn = true
