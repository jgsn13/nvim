return {
	"luukvbaal/statuscol.nvim",
	config = function()
		local builtin = require("statuscol.builtin")
		local statuscol = require("statuscol")
		statuscol.setup({
			foldfunc = "builtin",
			setopt = true,
			relculright = true,
			segments = {
				{
					text = { builtin.foldfunc, " " },
					click = "v:lua.ScFa",
				},
				{ text = { "%l", " " }, click = "v:lua.ScSa" },
				{
					text = { builtin.lnumfunc, " " },
					click = "v:lua.ScLa",
				},
				{ text = { "%s", " " }, click = "v:lua.ScSa" },
				{
					sign = {
						name = { "Diagnostic" },
						maxwidth = 2,
						auto = true,
					},
					click = "v:lua.ScSa",
				},
			},
		})
	end,
}
