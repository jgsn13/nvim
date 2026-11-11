return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
        "JoosepAlviste/nvim-ts-context-commentstring",
        "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
        local present, treesitter = pcall(require, "nvim-treesitter.configs")
        if not present then
            return
        end

        local options = {
            ensure_installed = {
                "lua",
                "vim",
                "vimdoc",
                "bash",
                "typescript",
                "javascript",
                "tsx",
                "css",
                "scss",
                "java",
                "json",
                "rust",
                "python",
                "c",
                "cpp",
                "yaml",
                "markdown",
                "markdown_inline",
                "diff",
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
                disable = { "yaml" },
            },
        }

        treesitter.setup(options)

        -- Modern nvim-ts-autotag setup
        local autotag_present, autotag = pcall(require, "nvim-ts-autotag")
        if autotag_present then
            autotag.setup({
                opts = {
                    enable_close = true,
                    enable_rename = true,
                    enable_close_on_slash = true,
                },
            })
        end

        local commentstring_present, commentstring = pcall(require, "ts_context_commentstring")
        if commentstring_present then
            vim.g.skip_ts_context_commentstring_module = true
            commentstring.setup()
        end

        local ts_context_present, ts_context = pcall(require, "treesitter-context")
        if ts_context_present then
            ts_context.setup({
                enable = false,
                max_lines = 0,
                min_window_height = 0,
                line_numbers = true,
                multiline_threshold = 20,
                trim_scope = "outer",
                mode = "cursor",
                separator = nil,
                zindex = 20,
            })

            vim.keymap.set("n", "<C-x>", ":TSContextToggle<CR>", { noremap = true, silent = true, desc = "Toggle Treesitter Context" })
        end
    end,
}
