vim.o.laststatus = 2

local theme = require("plugins.configs.lualine.theme")

local sections = require("plugins.configs.lualine.sections")

require "lualine".setup {
    options = {
        icons_enabled = true,
        theme = theme(),
        component_separators = {left = "", right = ""},
        section_separators = {left = "", right = ""},
        always_divide_middle = true
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
