return {
	"lewis6991/impatient.nvim",
	config = function()
		local present, _ = pcall(require, "impatient")
		if not present then
			return
		end

		require("impatient")
	end,
}
