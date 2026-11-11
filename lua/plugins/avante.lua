return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    build = "bash build.sh",
    opts = {
        provider = "gemini", -- Default provider: Google Gemini (reads $GEMINI_API_KEY from environment)
        mode = "agentic",
        auto_suggestions_provider = "gemini",
        providers = {
            gemini = {
                endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
                model = "gemini-3.8-flash",
                timeout = 30000,
                extra_request_body = {
                    temperature = 0,
                    max_tokens = 8192,
                },
            },
            claude = {
                endpoint = "https://api.anthropic.com",
                model = "claude-3-5-sonnet-20241022",
                timeout = 30000,
                extra_request_body = {
                    temperature = 0,
                    max_tokens = 8192,
                },
            },
            openai = {
                endpoint = "https://api.openai.com/v1",
                model = "gpt-4o",
                timeout = 30000,
                extra_request_body = {
                    temperature = 0,
                    max_tokens = 4096,
                },
            },
        },
        vendors = {
            deepseek = {
                __inherited_from = "openai",
                api_key_name = "DEEPSEEK_API_KEY",
                endpoint = "https://api.deepseek.com",
                model = "deepseek-chat",
            },
        },
        behaviour = {
            auto_suggestions = false, -- Toggle anytime with <leader>as
            auto_set_highlight_group = true,
            auto_set_keymaps = true,
            auto_apply_diff_after_generation = false,
            support_paste_from_clipboard = true,
            minimize_diff = true,
            enable_token_counting = true,
            auto_add_current_file = true,
        },
        mappings = {
            diff = {
                ours = "co",
                theirs = "ct",
                all_theirs = "ca",
                both = "cb",
                cursor = "cc",
                next = "]x",
                prev = "[x",
            },
            suggestion = {
                accept = "<M-l>",
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
            },
            jump = {
                next = "]]",
                prev = "[[",
            },
            submit = {
                normal = "<CR>",
                insert = "<C-s>",
            },
            sidebar = {
                apply_all = "A",
                apply_cursor = "a",
                retry_user_request = "r",
                edit_user_request = "e",
                switch_windows = "<Tab>",
                reverse_switch_windows = "<S-Tab>",
                remove_file = "d",
                add_file = "@",
                close = { "q", "<Esc>" },
            },
        },
        hints = { enabled = true },
        windows = {
            position = "right",
            wrap = true,
            width = 38,
            sidebar_header = {
                enabled = true,
                align = "center",
                rounded = true,
            },
            input = {
                prefix = " ",
                height = 8,
            },
            edit = {
                border = "rounded",
                start_insert = true,
            },
            ask = {
                floating = false,
                start_insert = true,
                border = "rounded",
            },
        },
        diff = {
            autojump = true,
            list_opener = "copen",
            override_timeoutlen = 500,
        },
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
        {
            "ColinKennedy/mega.cmdparse",
            dependencies = { "ColinKennedy/mega.logging" },
        },
        {
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    use_absolute_path = true,
                },
            },
        },
        {
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
    config = function(_, opts)
        require("avante").setup(opts)

        -- Cursor-style shortcuts:
        -- Visual mode: <C-k> or <leader>ae to Edit Selection (Cursor Ctrl+K)
        vim.keymap.set("v", "<C-k>", function()
            require("avante.api").edit()
        end, { desc = "Avante: Edit Selection (Cursor Ctrl+K)" })

        vim.keymap.set("v", "<leader>ae", function()
            require("avante.api").edit()
        end, { desc = "Avante: Edit Code" })

        -- Normal mode: <leader>aa to open chat / ask
        vim.keymap.set("n", "<leader>aa", function()
            require("avante.api").ask()
        end, { desc = "Avante: Ask AI (Sidebar)" })

        -- Toggle chat sidebar
        vim.keymap.set("n", "<leader>at", function()
            require("avante.api").toggle()
        end, { desc = "Avante: Toggle Chat Sidebar" })

        -- Refresh conversation
        vim.keymap.set("n", "<leader>ar", function()
            require("avante.api").refresh()
        end, { desc = "Avante: Refresh Chat" })

        -- Focus Avante sidebar
        vim.keymap.set("n", "<leader>af", function()
            require("avante.api").focus()
        end, { desc = "Avante: Focus Sidebar" })

        -- Switch Provider on the fly (:AvanteSwitchProvider)
        vim.keymap.set("n", "<leader>ap", "<cmd>AvanteSwitchProvider<CR>", { desc = "Avante: Switch AI Provider" })
    end,
}
