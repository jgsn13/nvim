local present, highlight_colors = pcall(require, "nvim-highlight-colors")
if not present then
	return
end

highlight_colors.setup({
	render = "foreground", -- or 'background' or 'first_column'
	enable_named_colors = true,
	enable_tailwind = false,
})
