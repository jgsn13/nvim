local present1, notify = pcall(require, "notify")
if present1 then
	vim.notify = notify
end

local present2, _ = pcall(require, "impatient")
if present2 then
	require("impatient")
end

require("user.options")
require("user.autocmds")
require("user.keymaps")
require("user.plugins")
require("user.colorscheme")
require("user.cmp")
require("user.lsp")
require("user.formatter")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.gitsigns")
require("user.neogit")
require("user.vgit")
require("user.icons")
require("user.nvim-tree")
require("user.bufferline")
require("user.lualine")
require("user.indentline")
require("user.highlight_colors")
require("user.colortils")
require("user.todo_comments")
require("user.scrollbar")
-- require("user.intro")
