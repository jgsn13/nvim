local present, onedarkpro = pcall(require, "onedarkpro")
if present then
	onedarkpro.setup({
		theme = "onelight",
	})
end

local colorscheme = "onedarkpro"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
