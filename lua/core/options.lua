local opt = vim.opt
local g = vim.g
local wo = vim.wo

-- export user config as a global varibale
g.nvim_user_config = "nvimrc"

local options = require("core.utils").load_config().options

vim.cmd [[filetype plugin indent on]]
vim.cmd [[set nocompatible]]
vim.cmd [[set path+=** ]] -- Searches current directory recursively.

opt.backspace = "indent,eol,start"
opt.encoding = "utf-8"
opt.clipboard = options.clipboard
opt.cmdheight = options.cmdheight
opt.cul = true -- cursor line
vim.cmd [[set guicursor=]]

-- Indentline
opt.expandtab = options.expandtab
opt.shiftwidth = options.shiftwidth
opt.smartindent = options.smartindent

-- disable tilde on end of buffer: https://github.com/  neovim/neovim/pull/8546#issuecomment-643643758
opt.fillchars = {eob = " "}

wo.list = true
opt.listchars = "tab:→ ,trail:•,nbsp:≡,extends:»,precedes:«,eol:↴,space:⋅"

opt.hidden = options.hidden
opt.ignorecase = options.ignorecase
opt.mouse = options.mouse
opt.scrolloff = 10

-- Numbers
opt.number = options.number
opt.numberwidth = options.numberwidth
opt.relativenumber = options.relativenumber
opt.ruler = options.ruler

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.tabstop = options.tabstop
opt.shiftwidth = options.shiftwidth
opt.softtabstop = options.softtabstop
opt.termguicolors = true
opt.timeoutlen = options.timeoutlen
opt.undofile = options.permanent_undo

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = options.updatetime

-- Highlight on yank
vim.api.nvim_exec(
    [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
    false
)

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>hl"

g.mapleader = options.mapleader

-- disable some builtin vim plugins
local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end
