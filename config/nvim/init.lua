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

-- From: https://github.com/nvim-telescope/telescope.nvim/issues/3439
local notify_original = vim.notify
vim.notify = function(msg, ...)
	if
			msg
			and (
				msg:match 'position_encoding param is required'
				or msg:match 'Defaulting to position encoding of the first client'
				or msg:match 'multiple different client offset_encodings'
			)
	then
		return
	end
	return notify_original(msg, ...)
end
-- lua/
require("options")
require("keymappings")
require("lazy-bootstrap")
require("lazy-config")
-- lua/custom
require("custom.plugins")
require("custom.plugins.lsp-attach")
