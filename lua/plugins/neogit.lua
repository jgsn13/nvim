return {
	"TimUntersberger/neogit",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		local present, neogit = pcall(require, "neogit")
		if not present then
			return
		end

		neogit.setup()
	end,
}
