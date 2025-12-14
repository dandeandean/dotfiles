local M = {}

-- For some reason the open ... won't actually spawn a browser
-- unless we sleep... DUMB DUMB DUMB
local BW_CMD = "bookworm && sleep 0.5"
local Terminal = require("toggleterm.terminal").Terminal

function M.bookworm()
	local BookwormTerm = Terminal:new({
		cmd = BW_CMD,
		hidden = false,
		close_on_exit = true,
		direction = "float",
		display_name = "Bookworm",
		float_opts = {
			border = "curved",
			title_pos = "center",
		},
	})
	BookwormTerm:toggle()
end

-- local LG_CMD = "lazygit"
-- function M.lazygit()
-- 	local BookwormTerm = Terminal:new({
-- 		cmd = LG_CMD,
-- 		hidden = false,
-- 		close_on_exit = true,
-- 		direction = "float",
-- 		display_name = "Lazygit",
-- 		float_opts = {
-- 			border = "curved",
-- 			title_pos = "center",
-- 		},
-- 	})
-- 	BookwormTerm:toggle()
-- end
-- vim.keymap.set("n", "<leader>g", M.lazygit, {
-- 	desc = "Run Lazygit",
-- })

vim.api.nvim_create_user_command("Bookworm", M.bookworm, { nargs = "*" })

return M
