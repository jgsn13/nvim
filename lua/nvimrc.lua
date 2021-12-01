local M = {}
M.ui, M.options, M.plugin_status, M.mappings, M.custom = {}, {}, {}, {}, {}

-- non plugin ui configs, available without any plugins
M.ui = {
    italic_comments = true,
    -- theme to be used, to see all available themes, open the theme switcher by <leader> + th
    theme = "default"
}

-- plugin related ui options
M.ui.plugin = {
    -- statusline related options
    statusline = {
        -- these are filetypes, not pattern matched
        -- if a filetype is present in shown, it will always show the statusline, irrespective of filetypes in hidden
        hidden = {},
        shown = {},
        -- default, round , slant , block , arrow
        style = "default"
    }
}

-- non plugin normal, available without any plugins
M.options = {
    clipboard = "unnamedplus",
    cmdheight = 1,
    expandtab = true,
    ignorecase = true,
    mapleader = " ",
    mouse = "a",
    number = true,
    -- relative numbers in normal mode tool at the bottom of options.lua
    numberwidth = 2,
    permanent_undo = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    smartindent = true,
    timeoutlen = 400,
    relativenumber = true,
    ruler = false,
    updatetime = 250
}

-- these are plugin related options
M.options.plugin = {}

-- enable and disable plugins (false for disable)
M.plugin_status = {
    blankline = true, -- beautified blank lines
    bufferline = true, -- buffer shown as tabs
    colorizer = true,
    comment = true, -- universal commentor
    esc_insertmode = true, -- escape from insert mode using custom keys
    lualine = true, -- statusline
    gitsigns = true, -- gitsigns in statusline
    formatter = true, -- universal formatter
    project = true,
    fterm = true
}

-- mappings -- don't use a single keymap twice --
-- non plugin mappings
M.mappings = {
    -- close current focused buffer
    close_buffer = "<C-q>",
    copy_whole_file = "<C-a>", -- copy all contents of the current buffer
    cmd_history = "<C-c>",
    semicolon = ";",
    comma = ",",
    -- navigation in insert mode, only if enabled in options
    insert_nav = {
        backward = "<C-h>",
        end_of_line = "<C-e>",
        forward = "<C-l>",
        next_line = "<C-k>",
        prev_line = "<C-j>",
        top_of_line = "<C-a>"
    },
    line_number_toggle = "<leader>n", -- show or hide line number
    new_buffer = "<S-t>", -- open a new buffer
    new_tab = "<C-t>b", -- open a new vim tab
    save_file = "<C-s>", -- save file using :w
    -- terminal related mappings
    terminal = {
        -- multiple mappings can be given for esc_termmode and esc_hide_termmode
        -- get out of terminal mode
        esc_termmode = {"jk"}, -- multiple mappings allowed
        -- get out of terminal mode and hide it
        -- it does not close it, see pick_term mapping to see hidden terminals
        esc_hide_termmode = {"JK"}, -- multiple mappings allowed
        -- show hidden terminal buffers in a telescope picker
        pick_term = "<leader>W",
        -- below three are for spawning terminals
        new_horizontal = "<leader>h",
        new_vertical = "<leader>v",
        new_window = "<leader>w"
    }
}

-- all plugins related mappings
-- to get short info about a plugin, see the respective string in plugin_status, if not present, then info here
M.mappings.plugin = {
    bufferline = {
        next_buffer = "<A-l>", -- next buffer
        prev_buffer = "<A-h>" -- previous buffer
    },
    comment = {
        toggle = "<leader>/" -- trigger comment on a single/selected lines/number prefix
    },
    nvimtree = {
        toggle = "<C-n>", -- file manager
        focus = "<leader>e",
        refresh = "<leader>R"
    },
    fterm = {
        toggle = "<A-t>",
        lazygit_toggle = "<A-g>"
    },
    project = {
        projects = "<C-p>"
    },
    telescope = {
        buffers = "fb",
        find_files = "ff",
        find_hiddenfiles = "fh",
        help_tags = "ft",
        live_grep = "fg",
        oldfiles = "fo",
        -- Pick colorscheme
        colorscheme = "<leader>c",
        command_history = "<C-c>"
    }
}

-- user custom mappings
-- e.g: name = { "mode" , "keys" , "cmd" , "options"}
-- name: can be empty or something unique with repect to other custom mappings
--    { mode, key, cmd } or name = { mode, key, cmd }
-- mode: usage: mode or { mode1, mode2 }, multiple modes allowed, available modes => :h map-modes,
-- keys: multiple keys allowed, same synxtax as modes
-- cmd:  for vim commands, must use ':' at start and add <CR> at the end if want to execute
-- options: see :h nvim_set_keymap() opts section
M.custom.mappings = {}

M.plugins = {
    lspconfig = {
        -- servers = {"html", "cssls"}
        servers = {}
    }
}

return M
