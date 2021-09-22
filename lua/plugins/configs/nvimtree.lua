local present, tree_c = pcall(require, "nvim-tree.config")
if not present then
   return
end

local tree_cb = tree_c.nvim_tree_callback
local g = vim.g

vim.o.termguicolors = true

g.nvim_tree_follow = 1
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_auto_resize = 1
g.nvim_tree_disable_netrw = 1
g.nvim_tree_hijack_netrw = 1
g.nvim_tree_add_trailing = 1
g.nvim_tree_lsp_diagnostics = 1
g.nvim_tree_disable_window_picker = 0
g.nvim_tree_hijack_cursor = 1
g.nvim_tree_icon_padding = " "
g.nvim_tree_update_cwd = 1
g.nvim_tree_respect_buf_cwd = 1
g.nvim_tree_refresh_wait = 500
g.nvim_tree_width = 32
g.nvim_tree_git_hl = 0
g.nvim_tree_group_empty = 1
g.nvim_tree_ignore = {".git"}
g.nvim_tree_gitignore = 0
--g.nvim_tree_auto_ignore_ft = { "startify", "dashboard" }
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 0

g.nvim_tree_tab_open = 1
g.nvim_tree_quit_on_open = 1
g.nvim_tree_auto_close = 0

g.nvim_tree_special_files = {}
g.nvim_tree_show_icons = {git = 1, folders = 1, files = 1, folder_arrows = 1}
g.nvim_tree_root_folder_modifier = ":p:~" -- ":~"

g.nvim_tree_window_picker_exclude = {
    filetype = {"packer", "qf"},
    buftype = {"terminal"}
}

--vim.cmd [[let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 }]]
vim.cmd [[let g:nvim_tree_show_icons = {'git': 1, 'folders': 1, 'files': 1, 'folder_arrows': 1}]]

g.nvim_tree_icons = {
    -- default = "",
    default = "",
    symlink = "",
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌"
    },
    folder = {
        arrow_open = "",
        arrow_closed = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = ""
    },
    lsp = {
        hint = "",
        info = "",
        warning = "",
        error = ""
    }
}

g.nvim_tree_bindings = {
    {key = {"l", "o"}, cb = tree_cb("edit")},
    {key = {"<2-LeftMouse>"}, cb = tree_cb("edit")},
    {key = {"<2-RightMouse>"}, cb = tree_cb("cd")},
    {key = {"<C-]>", "<CR>"}, cb = tree_cb("cd")},
    {key = "<C-v>", cb = tree_cb("vsplit")},
    {key = "<C-x>", cb = tree_cb("split")},
    {key = "<C-t>", cb = tree_cb("tabnew")},
    {key = "<", cb = tree_cb("prev_sibling")},
    {key = ">", cb = tree_cb("next_sibling")},
    {key = "P", cb = tree_cb("parent_node")},
    {key = "h", cb = tree_cb("close_node")},
    {key = {"<S-CR>"}, cb = tree_cb("close_node")},
    {key = "<Tab>", cb = tree_cb("preview")},
    {key = "K", cb = tree_cb("first_sibling")},
    {key = "J", cb = tree_cb("last_sibling")},
    {key = "I", cb = tree_cb("toggle_ignored")},
    {key = {"H", "<C-h>"}, cb = tree_cb("toggle_dotfiles")},
    {key = "R", cb = tree_cb("refresh")},
    {key = "a", cb = tree_cb("create")},
    {key = "d", cb = tree_cb("remove")},
    {key = "r", cb = tree_cb("rename")},
    {key = "<C-r>", cb = tree_cb("full_rename")},
    {key = "x", cb = tree_cb("cut")},
    {key = "c", cb = tree_cb("copy")},
    {key = "p", cb = tree_cb("paste")},
    {key = "y", cb = tree_cb("copy_name")},
    {key = "Y", cb = tree_cb("copy_path")},
    {key = "gy", cb = tree_cb("copy_absolute_path")},
    {key = "[c", cb = tree_cb("prev_git_item")},
    {key = "]c", cb = tree_cb("next_git_item")},
    {key = "<BS>", cb = tree_cb("dir_up")},
    {key = "q", cb = tree_cb("close")},
    {key = "g?", cb = tree_cb("toggle_help")}
}
