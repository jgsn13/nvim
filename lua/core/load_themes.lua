function load_themes()
    -- require("doom-one").setup(
    --     {
    --         cursor_coloring = false,
    --         terminal_colors = true,
    --         italic_comments = true,
    --         enable_treesitter = true,
    --         transparent_background = false
    --     }
    -- )

    local onedarkpro = require("onedarkpro")
    require("onedarkpro").setup(
        {
            styles = {
                strings = "NONE",
                comments = "italic",
                keywords = "NONE",
                functions = "italic,bold",
                variables = "NONE"
            },
            options = {
                bold = true,
                italic = true,
                underline = true,
                undercurl = true,
                cursorline = true,
                transparency = true,
                terminal_colors = false,
                window_unfocussed_color = false
            }
        }
    )
    onedarkpro.load()

    -- fix NvimTreeNormalNC when transparency is activated
    vim.cmd [[highlight NvimTreeNormalNC guibg=NONE]]

    -- vim.cmd[[colorscheme dracula]]
    -- require("moonlight").set()
    -- require("onedark").setup()
    -- require("calvera").set()
    -- require("github-theme").setup()
    -- require("catppuccin").setup()
    -- require("onenord").setup()
end

return load_themes()
