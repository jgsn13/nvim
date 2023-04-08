---
---Executes a Vim command using `vim.api.nvim_exec2` function.
---
---@param cmd string The Vim command to be executed.
---@param output boolean Whether the command has an output or not.
---@return string|nil result The output of the command if `output` is `true`, otherwise `nil`.
function EXEC(cmd, output)
	local result = vim.api.nvim_exec2(cmd, { output = output })
	if output then
		return result
	end
end
