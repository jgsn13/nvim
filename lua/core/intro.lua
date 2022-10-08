local num_args = vim.api.nvim_eval(vim.api.nvim_exec("echo argc()", true))
if num_args == 0 then
	vim.api.nvim_exec("intro", false)
end
