local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    local packer_bootstrap =
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

local present, packer = pcall(require, "packer")

if not present then
    return false
end

vim.cmd(
    [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]
)

return require("packer").startup(
    {
        function(use)
            -- My plugins here
            local plugin_status = require("core.utils").load_config().plugin_status

            -- this is arranged on the basis of when a plugin starts

            -- Packer can manage itself
            use "wbthomason/packer.nvim"

            -- Colorschemes
            use "olimorris/onedarkpro.nvim"
            use "navarasu/onedark.nvim"
            use "Mofiqul/dracula.nvim"
            use "NTBBloodbath/doom-one.nvim"
            use "yashguptaz/calvera-dark.nvim"
            use "shaunsingh/moonlight.nvim"
            use "projekt0n/github-nvim-theme"
            use "catppuccin/nvim"
            use "rmehri01/onenord.nvim"

            use {
                "nvim-lua/plenary.nvim"
            }

            use {
                "kyazdani42/nvim-web-devicons",
                config = function()
                    require "plugins.configs.icons"
                end
            }

            use {
                "nvim-lualine/lualine.nvim",
                disable = not plugin_status.lualine,
                after = "nvim-web-devicons",
                config = function()
                    require "plugins.configs.lualine"
                end
            }

            use {
                "akinsho/bufferline.nvim",
                disable = not plugin_status.bufferline,
                after = "nvim-web-devicons",
                config = function()
                    require "plugins.configs.bufferline"
                end,
                setup = function()
                    require("core.mappings").bufferline()
                end
            }

            use {
                "lukas-reineke/indent-blankline.nvim",
                disable = not plugin_status.blankline,
                event = "BufRead",
                config = function()
                    require("plugins.configs.others").blankline()
                end
            }

            use {
                "norcalli/nvim-colorizer.lua",
                disable = not plugin_status.colorizer,
                event = "BufRead",
                config = function()
                    require("plugins.configs.others").colorizer()
                end
            }

            use {
                "nvim-treesitter/nvim-treesitter",
                -- event = "BufRead",
                config = function()
                    require "plugins.configs.treesitter"
                end
            }

            use {
                "nvim-orgmode/orgmode"
            }

            use {
                "windwp/nvim-ts-autotag",
                after = "nvim-treesitter",
                event = "BufRead"
            }

            use {
                "p00f/nvim-ts-rainbow",
                after = "nvim-treesitter",
                event = "BufRead"
            }

            use {
                "nvim-treesitter/nvim-treesitter-angular",
                after = "nvim-treesitter",
                event = "BufRead"
            }

            -- git stuff
            use {
                "lewis6991/gitsigns.nvim",
                disable = not plugin_status.gitsigns,
                opt = true,
                config = function()
                    require "plugins.configs.gitsigns"
                end,
                setup = function()
                    require("core.utils").packer_lazy_load "gitsigns.nvim"
                end
            }

            -- lsp stuff

            use {
                "neovim/nvim-lspconfig",
                opt = true,
                setup = function()
                    require("core.utils").packer_lazy_load "nvim-lspconfig"
                    -- reload the current file so lsp actually starts for it
                    vim.defer_fn(
                        function()
                            vim.cmd "silent! e %"
                        end,
                        0
                    )
                end,
                config = function()
                    require "plugins.configs.lspconfig"
                end
            }

            use {
                "ray-x/lsp_signature.nvim",
                after = "nvim-lspconfig"
            }

            use {
                "jose-elias-alvarez/nvim-lsp-ts-utils",
                after = "nvim-lspconfig"
            }

            -- load luasnips + cmp related in insert mode only

            use {
                "rafamadriz/friendly-snippets",
                event = "InsertEnter"
            }

            use {
                "hrsh7th/nvim-cmp",
                after = "friendly-snippets",
                config = function()
                    require "plugins.configs.cmp"
                end
            }

            use {
                "aca/emmet-ls",
                after = "nvim-cmp"
            }

            use {
                "L3MON4D3/LuaSnip",
                wants = "friendly-snippets",
                after = "nvim-cmp",
                config = function()
                    require("plugins.configs.others").luasnip()
                end
            }

            use {
                "saadparwaiz1/cmp_luasnip",
                after = "LuaSnip"
            }

            use {
                "hrsh7th/cmp-nvim-lua",
                after = "cmp_luasnip"
            }

            use {
                "hrsh7th/cmp-nvim-lsp",
                after = "cmp-nvim-lua"
            }

            use {
                "hrsh7th/cmp-buffer",
                after = "cmp-nvim-lsp"
            }

            use {
                "hrsh7th/cmp-path",
                after = "cmp-buffer"
            }

            use {
                "hrsh7th/cmp-emoji",
                after = "cmp-path"
            }

            use {
                "hrsh7th/cmp-calc",
                after = "cmp-path"
            }

            use {
                "hrsh7th/cmp-cmdline",
                after = "cmp-calc"
            }

            use "mfussenegger/nvim-jdtls"

            use "simrat39/rust-tools.nvim"

            -- misc plugins
            use {
                "windwp/nvim-autopairs",
                after = "nvim-cmp",
                config = function()
                    require("plugins.configs.others").autopairs()
                end
            }

            use {
                "mhartington/formatter.nvim",
                disable = not plugin_status.formatter,
                config = function()
                    require("plugins.configs.formatter")
                end
            }

            -- use {
            --     "mfussenegger/nvim-dap",
            --     config = function()
            --         require("plugins.configs.dap")
            --     end
            -- }

            -- Tools
            use "editorconfig/editorconfig-vim"

            use {
                "terrortylor/nvim-comment",
                disable = not plugin_status.comment,
                cmd = "CommentToggle",
                config = function()
                    require("plugins.configs.others").comment()
                end,
                setup = function()
                    require("core.mappings").comment()
                end
            }

            -- file managing , picker etc
            use {
                "kyazdani42/nvim-tree.lua",
                cmd = {"NvimTreeToggle", "NvimTreeFocus", "NvimTreeRefresh"},
                config = function()
                    require "plugins.configs.nvimtree"
                end,
                setup = function()
                    require("core.mappings").nvimtree()
                end
            }

            use {
                "nvim-telescope/telescope.nvim",
                cmd = "Telescope",
                config = function()
                    require "plugins.configs.telescope"
                end,
                setup = function()
                    require("core.mappings").telescope()
                end
            }

            use {
                "ahmedkhalf/project.nvim",
                disable = not plugin_status.project,
                after = "telescope.nvim",
                config = function()
                    require "plugins.configs.project"
                end,
                setup = function()
                    require("core.mappings").project()
                end
            }

            use {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make"
            }

            -- Automatically set up your configuration after cloning packer.nvim
            -- Put this at the end after all plugins
            if packer_bootstrap then
                require("packer").sync()
            end
        end,
        config = {
            display = {
                open_fn = function()
                    return require("packer.util").float {border = "single"}
                end,
                prompt_border = "single"
            },
            git = {
                clone_timeout = 600 -- Timeout, in seconds, for git clones
            },
            auto_clean = true,
            compile_on_sync = true,
            auto_reload_compiled = true
        }
    }
)
