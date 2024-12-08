return {
	{ -- highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc", "gotmpl", "helm" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
		config = function(_, opts)
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	-- from https://github.com/ngalaiko/tree-sitter-go-template
	vim.filetype.add({
		extension = {
			gotmpl = "gotmpl",
		},
		pattern = {
			[".*/templates/.*%.tpl"] = "helm",
			[".*/templates/.*%.ya?ml"] = "helm",
			["helmfile.*%.ya?ml"] = "helm",
		},
	}),
}
