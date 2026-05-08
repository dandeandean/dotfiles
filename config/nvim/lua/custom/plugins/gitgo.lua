local M = {}
function M._gitgo()
	local current_buffer_path = vim.api.nvim_buf_get_name(0)
	local exec_str = current_buffer_path
	local cwd = vim.fn.getcwd(0, 0)
	exec_str = string.sub(exec_str, #cwd + 1)
	exec_str = "gh open " .. exec_str
	os.execute(exec_str)
	vim.notify(exec_str)
end

vim.api.nvim_create_user_command("GitGo", M._gitgo, { nargs = "*" })

return M
