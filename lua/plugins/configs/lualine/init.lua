vim.o.laststatus = 2

local theme = require("plugins.configs.lualine.theme")

local sections = require("plugins.configs.lualine.sections")

require "lualine".setup {
    options = {
        icons_enabled = 1,
        padding = 1,
        theme = theme(),
        component_separators = {left = "", right = ""},
        section_separators = {left = "", right = ""},
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = sections.a,
        lualine_b = sections.b,
        lualine_c = sections.c,
        lualine_x = sections.x,
        lualine_y = sections.y,
        lualine_z = sections.z
    }
}
