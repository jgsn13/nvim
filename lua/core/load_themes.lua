function load_themes()
    require("doom-one").setup(
        {
            cursor_coloring = false,
            terminal_colors = true,
            italic_comments = true,
            enable_treesitter = true,
            transparent_background = false
        }
    )

    -- fix NvimTreeNormalNC when transparency is activated
    vim.cmd [[highlight NvimTreeNormalNC guibg=NONE]]

    -- vim.cmd[[colorscheme dracula]]
    -- require("moonlight").set()
    -- require("calvera").set()
    -- require("github-theme").setup()
    -- require("catppuccin").setup()
    -- require("onenord").setup()
end

return load_themes()
