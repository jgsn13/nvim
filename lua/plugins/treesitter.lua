return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        {
            "windwp/nvim-ts-autotag",
            "JoosepAlviste/nvim-ts-context-commentstring",
            "nvim-treesitter/nvim-treesitter-context"
        },
    },
    init = function()
        local present, treesitter = pcall(require, "nvim-treesitter.configs")
        if not present then
            return
        end

        local options = {
            ensure_installed = {
                "lua",
                "typescript",
                "javascript",
                "tsx",
                "css",
                "scss",
                "json",
                "rust",
                "python",
                "c",
                "cpp",
                "yaml",
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
                disable = { "yaml" },
            },
            autotag = {
                enable = true,
                filetypes = {
                    "html",
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescriptreact",
                },
            },
        }

        treesitter.setup(options)

        local commentstring_present, commentstring = pcall(require, "ts_context_commentstring")
        if commentstring_present then
            vim.g.skip_ts_context_commentstring_module = true;
            commentstring.setup()
        end

        local ts_context_present, ts_context = pcall(require, 'treesitter-context');
        if ts_context_present then
            ts_context.setup({
                enable = false,           -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to show for a single context
                trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
                zindex = 20,     -- The Z-index of the context window
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            });

            vim.keymap.set('n', '<C-x>', ':TSContextToggle<CR>', { noremap = true, silent = true });
        end
    end,
}
