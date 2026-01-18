--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
if os.getenv("XDG_SESSION_TYPE") == "tty" then
	vim.cmd.colorscheme("ron")
	vim.g.have_nerd_font = false
else
	vim.cmd.colorscheme("retrobox")
	vim.g.have_nerd_font = true
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "
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
-- Need to install fzf first
require("custom.plugins.bookworm")
require("custom.plugins.gitgo")
