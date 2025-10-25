local M
function M._gitgo()
	local current_buffer_path = vim.api.nvim_buf_get_name(0)
	print(current_buffer_path)
end

vim.api.nvim_create_user_command("GitGo", M._gitgo, { nargs = "*" })

return M
