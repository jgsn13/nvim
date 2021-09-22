local present, _ = pcall(require, "telescope")
if not present then
    return
end

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

local M = {}

M.search_nvim = function()
    require("telescope.builtin").find_files(
        {
            prompt_title = "~ Nvim Config ~",
            cwd = "$HOME/.config/nvim"
        }
    )
end

M.search_dev = function()
    require("telescope.builtin").find_files(
        {
            prompt_title = "~ Dev ~",
            cwd = "$HOME/Dev",
            file_ignore_patterns = {
                "node_modules",
                "dist",
                "build"
            }
        }
    )
end

M.search_settings = function()
    require("telescope.builtin").find_files(
        {
            prompt_title = "~ Config ~",
            cwd = "$HOME/.config",
            file_ignore_patterns = {
                "advanced-rest-client",
                "alacritty",
                "autostart",
                "bpytop",
                "caja",
                "chromium",
                "cinnamon-session",
                "coc",
                "dconf",
                "configstore",
                "figma-linux",
                "glib-2.0",
                "goa-1.0",
                "gtk-3.0",
                "Insomnia",
                "klavaro",
                "VSCodium",
                "sao-nodejs",
                "libreoffice",
                "mimeapps.list",
                "omf",
                "glib-2.0/.*",
                "yarn",
                "sublime-text-3/.*"
            }
        }
    )
end

map("n", "fd", ":lua require('plugins.configs.telescope.customs').search_dev()<CR>", opts)
map("n", "fs", ":lua require('plugins.configs.telescope.customs').search_settings()<CR>", opts)
map("n", "fn", ":lua require('plugins.configs.telescope.customs').search_nvim()<CR>", opts)

return M
