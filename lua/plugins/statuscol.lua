return {
	"luukvbaal/statuscol.nvim",
	event = "VeryLazy",
	config = function()
		local builtin = require("statuscol.builtin")
		local statuscol = require("statuscol")
		statuscol.setup({
			setopt = true,
			relculright = true,
			segments = {
				{
					text = { " ", builtin.foldfunc, " " },
					condition = { builtin.not_empty, true, builtin.not_empty },
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
