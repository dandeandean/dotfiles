--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.cmd.colorscheme("retrobox")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

-- lua/
require("options")
require("keymappings")
require("lazy-bootstrap")
require("lazy-config")
-- lua/custom
require("custom.plugins")
require("custom.plugins.lsp-attach")
