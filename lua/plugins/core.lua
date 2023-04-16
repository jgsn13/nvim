return {
	{ "famiu/bufdelete.nvim", cmd = { "Bdelete", "Bwipeout" } },
	{
		"max397574/better-escape.nvim",
		event = "InsertCharPre",
		opts = { timeout = 300 },
	},
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "TermExec" },
		opts = {
			size = 10,
			open_mapping = [[<F7>]],
			shading_factor = 2,
			direction = "float",
			float_opts = {
				border = "curved",
				highlights = { border = "Normal", background = "Normal" },
			},
		},
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			local status_ok, notify = pcall(require, "notify")
			if not status_ok then
				return
			end

			vim.notify = notify
		end,
	},
}
