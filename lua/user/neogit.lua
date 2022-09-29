local present, neogit = pcall(require, "neogit")
if not present then
	return
end

neogit.setup()

KEYMAP("n", "<Leader>g", ":Neogit<CR>", OPTS)
