local M = {}

local bw_cmd = "bookworm"
local fzf = require("fzf-lua")

function M.show_bookmarks()
	fzf.fzf_exec({
		-- The external command to run
		cmd = bw_cmd,
		-- A nice title for the fzf window
		title = "bookworm",
		-- Define the actions/sinks for keybindings
		actions = {
			-- The default action (usually Enter)
			["default"] = function()
				print("Doing this or that")
			end,
			-- Optional: Define a secondary action, e.g., <C-t> to open in a vertical split
			["ctrl-v"] = function(selected)
				if selected[1] then
					vim.cmd("vsplit " .. vim.fn.fnameescape(selected[1]))
				end
			end,
		},
		-- Optional: Custom window options for a better look
		winopts = {
			height = 0.6,
			width = 0.7,
			row = 0.2,
			col = 0.15,
			border = "rounded",
		},
	})
end

-- vim.keymap.set("n", "<leader>lb", M.show_bookmarks, {
-- 	desc = "Run custom CLI FZF wrapper",
-- })

vim.api.nvim_create_user_command("Bookworm", M.show_bookmarks, { nargs = "*" })

return M
