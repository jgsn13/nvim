local colors = require("colors")

return function()
    return {
        normal = {
            a = {fg = colors.blue, bg = colors.darker_black},
            b = {fg = colors.grey_fg, bg = colors.darker_black},
            c = {fg = colors.grey_fg, bg = colors.darker_black}
        },
        insert = {a = {fg = colors.yellow, bg = colors.darker_black}},
        command = {a = {fg = colors.red, bg = colors.darker_black}},
        visual = {a = {fg = colors.purple, bg = colors.darker_black}},
        replace = {a = {fg = colors.yellow, bg = colors.darker_black}},
        inactive = {
            a = {fg = colors.blue, bg = colors.darker_black},
            b = {fg = colors.blue, bg = colors.darker_black},
            c = {fg = colors.blue, bg = colors.darker_black}
        }
    }
end
