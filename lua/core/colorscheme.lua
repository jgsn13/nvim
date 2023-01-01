-- local present1, onedarkpro = pcall(require, "onedarkpro")
-- if present1 then
-- 	onedarkpro.setup({
-- 		theme = "onelight",
-- 	})
-- end

local colorscheme = "onedark"
-- local colorscheme = "carbonfox"
-- local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
