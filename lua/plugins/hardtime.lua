return {
	"m4xshen/hardtime.nvim",
	opts = {},
	init = function()
		local status_ok, hardtime = pcall(require, "hardtime")
		if not status_ok then
			return
		end

		hardtime.setup()
	end,
}
