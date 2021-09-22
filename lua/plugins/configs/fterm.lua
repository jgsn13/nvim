local fterm = require("FTerm")

local border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
local border2 = {"╔", "═", "╗", "║", "╝", "═", "╚", "║"}

fterm.setup(
    {
        dimensions = {
            height = 0.8,
            width = 0.8,
            x = 0.5,
            y = 0.5
        },
        border = border
    }
)

local lazygit =
    fterm:new(
    {
        cmd = "lazygit",
        dimensions = {
            height = 0.9,
            width = 0.9,
            x = 0.5,
            y = 0.5
        },
        border = border2
    }
)

fterm.lazygit = function()
    lazygit:toggle()
end
