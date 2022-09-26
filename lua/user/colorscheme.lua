local present, onedarkpro = pcall(require, "onedarkpro")
if not present then
	return
end

onedarkpro.setup({
	dark_theme = "onedark",
	light_theme = "onelight",
	styles = {
		strings = "NONE",
		comments = "italic",
		keywords = "NONE",
		functions = "bold,italic",
		variables = "NONE",
		virtual_text = "NONE",
	},
	options = {
		bold = true,
		italic = true,
		underline = true,
		undercurl = false,
		cursorline = false,
		transparency = false,
		terminal_colors = false,
		window_unfocused_color = false,
	},
})

local colorscheme = "onedarkpro"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
