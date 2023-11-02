return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        {
            "lukas-reineke/indent-blankline.nvim",
            "windwp/nvim-ts-autotag",
            "JoosepAlviste/nvim-ts-context-commentstring",
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
        }

        options.autotag = {
            enable = true,
            filetypes = {
                "html",
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
            },
        }

        options.context_commentstring = {
            enable = true,
        }

        treesitter.setup(options)
    end,
}
