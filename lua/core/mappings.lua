local utils = require "core.utils"

local config = utils.load_config()
local map = utils.map

local maps = config.mappings
local plugin_maps = maps.plugin

local cmd = vim.cmd

local M = {}

-- these mappings will only be called during initialization
M.misc = function()
    local function non_config_mappings()
        -- Don't copy the replaced text after pasting in visual mode
        map("v", "p", '"_dP')

        -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
        -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
        -- empty mode is same as using :map
        -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
        map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', {expr = true})
        map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', {expr = true})
        map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', {expr = true})
        map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', {expr = true})

        -- use ESC to turn off search highlighting
        map("n", "<Esc>", ":noh <CR>")
    end

    local function optional_mappings()
        -- don't yank text on cut ( x )
        if not config.options.copy_cut then
            map({"n", "v"}, "x", '"_x')
        end

        -- don't yank text on delete ( d | dd )
        if not config.options.copy_del then
            map({"n", "v"}, "dd", '"_dd')
            map({"n", "v"}, "d", '"_d')
        end

        -- stay selected on visual mode
        map("v", "y", "ygv")

        -- Select all
        map("n", "yg", "ggVG")

        -- <C-o> to Escape
        map({"i", "v", "c", "s"}, "<C-o>", "<Esc>")

        -- Text selection
        map("n", "<rightmouse>", "#")
        map("n", "<Leader>x", "viw")
        map("n", "<Leader>'", "vi'")
        map("n", '<Leader>"', 'vi"')
        map("n", "<Leader>`", "vi`")
        map("n", "<Leader>(", "vi(")
        map("n", "<Leader>{", "vi{")
        map("n", "<Leader>[", "vi[")

        -- Move lines/selected lines
        map("n", "<C-j>", ":m .+1<CR>==")
        map("n", "<C-k>", ":m .-2<CR>==")
        map("v", "<C-j>", ":m '>+1<CR>gv=gv")
        map("v", "<C-k>", ":m '<-2<CR>gv=gv")

        -- Jump words on insert mode
        map("i", "<C-w>", "<C-\\><C-O>w")
        map("i", "<C-b>", "<C-\\><C-O>b")

        -- Navigate without leave command mode
        map("c", "<C-h>", "<Left>")
        map("c", "<C-l>", "<Right>")

        -- Replace patterns in one line or globally
        map("n", "<Leader>sl", ":s/")
        map("n", "<Leader>sa", ":%s/")

        -- Open and close fold
        map("n", "<C-h>", ":foldclose<CR>")
        map("n", "<C-l>", ":foldopen<CR>")
        map("v", "<C-h>", ":foldclose<CR>")
        map("v", "<C-l>", ":foldopen<CR>")

        -- navigation within insert mode
        if config.options.insert_nav then
            local inav = maps.insert_nav

            map("i", inav.backward, "<Left>")
            map("i", inav.end_of_line, "<End>")
            map("i", inav.forward, "<Right>")
            map("i", inav.next_line, "<Up>")
            map("i", inav.prev_line, "<Down>")
            map("i", inav.top_of_line, "<ESC>^i")
        end
    end

    local function required_mappings()
        map("n", maps.close_buffer, ":lua require('core.utils').close_buffer() <CR>") -- close  buffer
        map("n", maps.copy_whole_file, ":%y+ <CR>") -- copy whole file content
        map("n", maps.cmd_history, ":<C-f>") -- see cmd history
        map("n", maps.new_buffer, ":enew <CR>") -- new buffer
        map("n", maps.new_tab, ":tabnew <CR>") -- new tabs
        map("n", maps.line_number_toggle, ":set nu! <CR>") -- toggle numbers
        map("n", maps.save_file, ":w <CR>") -- ctrl + s to save file

        map("n", maps.semicolon, "A;<Esc>") -- Insert semicolon
        map("n", maps.comma, "A,<Esc>") -- Insert comma

        -- terminal mappings --
        local term_maps = maps.terminal
        -- get out of terminal mode
        map("t", term_maps.esc_termmode, "<C-\\><C-n>")
        -- hide a term from within terminal mode
        map("t", term_maps.esc_hide_termmode, "<C-\\><C-n> :lua require('core.utils').close_buffer() <CR>")
        -- pick a hidden term
        map("n", term_maps.pick_term, ":Telescope terms <CR>")
        -- Open terminals
        -- TODO this opens on top of an existing vert/hori term, fixme
        map(
            "n",
            term_maps.new_horizontal,
            ":execute 15 .. 'new +terminal' | let b:term_type = 'hori' | startinsert <CR>"
        )
        map("n", term_maps.new_vertical, ":execute 'vnew +terminal' | let b:term_type = 'vert' | startinsert <CR>")
        map("n", term_maps.new_window, ":execute 'terminal' | let b:term_type = 'wind' | startinsert <CR>")
        -- terminal mappings end --

        -- Add Packer commands because we are not loading it at startup
        cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
        cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
        cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
        cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
        cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
        cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"
    end

    local function user_config_mappings()
        local custom_maps = config.custom.mappings or ""
        if type(custom_maps) ~= "table" then
            return
        end

        for _, map_table in pairs(custom_maps) do
            map(unpack(map_table))
        end
    end

    non_config_mappings()
    optional_mappings()
    required_mappings()
    user_config_mappings()
end

-- below are all plugin related mappings

M.bufferline = function()
    local m = plugin_maps.bufferline

    map("n", m.next_buffer, ":BufferLineCycleNext <CR>")
    map("n", m.prev_buffer, ":BufferLineCyclePrev <CR>")
end

M.comment = function()
    local m = plugin_maps.comment.toggle
    map("n", m, ":CommentToggle <CR>")
    map("v", m, ":CommentToggle <CR>")
end

M.nvimtree = function()
    map("n", plugin_maps.nvimtree.toggle, ":NvimTreeToggle <CR>")
    map("n", plugin_maps.nvimtree.focus, ":NvimTreeFocus <CR>")
    map("n", plugin_maps.nvimtree.refresh, ":NvimTreeRefresh <CR>")
end

M.fterm = function()
    local m = plugin_maps.fterm

    map("n", m.toggle, ':lua require("FTerm").toggle()<CR>')
    map("t", m.toggle, '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
    map("n", m.lazygit_toggle, ':lua require("FTerm").lazygit()<CR>')
    map("t", m.lazygit_toggle, '<C-\\><C-n><CMD>lua require("FTerm").lazygit()<CR>')
end

M.project = function()
    map("n", plugin_maps.project.projects, ":Telescope projects<CR>")
end

M.telescope = function()
    local m = plugin_maps.telescope

    map("n", m.buffers, ":Telescope buffers <CR>")
    map("n", m.find_files, ":Telescope find_files <CR>")
    map("n", m.find_hiddenfiles, ":Telescope find_files hidden=true <CR>")
    map("n", m.help_tags, ":Telescope help_tags <CR>")
    map("n", m.live_grep, ":Telescope live_grep <CR>")
    map("n", m.oldfiles, ":Telescope oldfiles <CR>")
end

return M
