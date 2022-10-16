local present, vgit = pcall(require, "vgit")
if not present then
	return
end

vgit.setup({
	settings = {
		signs = {
			priority = 10,
			definitions = {
				GitSignsAddLn = {
					linehl = "GitSignsAddLn",
					texthl = nil,
					numhl = nil,
					icon = "▎",
					text = "▎",
				},
				GitSignsDeleteLn = {
					linehl = "GitSignsDeleteLn",
					texthl = nil,
					numhl = nil,
					icon = "契",
					text = "契",
				},
				GitSignsAdd = {
					texthl = "GitSignsAdd",
					numhl = nil,
					icon = "▎",
					linehl = nil,
					text = "▎",
				},
				GitSignsDelete = {
					texthl = "GitSignsDelete",
					numhl = nil,
					linehl = nil,
					icon = "契",
					text = "契",
				},
				GitSignsChange = {
					texthl = "GitSignsChange",
					numhl = nil,
					linehl = nil,
					icon = "▎",
					text = "▎",
				},
			},
		},
	},
})
