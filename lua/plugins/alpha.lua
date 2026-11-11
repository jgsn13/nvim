return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- AstroNvim style ASCII header
        dashboard.section.header.val = {
            [[                               __                ]],
            [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
            [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
            [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
            [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
            [[                                                 ]],
            [[       🚀 Astro-Speed • Modern • Powerful        ]],
        }

        dashboard.section.header.opts.hl = "Keyword"

        local function button(sc, txt, keybind, keybind_opts)
            local b = dashboard.button(sc, txt, keybind, keybind_opts)
            b.opts.hl = "Function"
            b.opts.hl_shortcut = "Type"
            b.opts.width = 44
            b.opts.cursor = 3
            return b
        end

        dashboard.section.buttons.val = {
            button("f", "  Find File", "<cmd>Telescope find_files<CR>"),
            button("n", "  New File", "<cmd>ene <BAR> startinsert<CR>"),
            button("r", "󰈚  Recent Files", "<cmd>Telescope oldfiles<CR>"),
            button("w", "󰈭  Find Word", "<cmd>Telescope live_grep<CR>"),
            button("g", "󰊢  Git Status", "<cmd>LazyGit<CR>"),
            button("p", "󰒲  Plugins (Lazy)", "<cmd>Lazy<CR>"),
            button("m", "  Mason (LSP/Format)", "<cmd>Mason<CR>"),
            button("c", "  Config", "<cmd>Telescope find_files cwd=~/.config/nvim<CR>"),
            button("q", "  Quit", "<cmd>qa<CR>"),
        }

        local function footer()
            local total_plugins = #vim.tbl_keys(require("lazy").plugins())
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return "⚡ Neovim loaded " .. total_plugins .. " plugins in " .. ms .. "ms"
        end

        dashboard.section.footer.val = footer()
        dashboard.section.footer.opts.hl = "Comment"

        dashboard.opts.layout = {
            { type = "padding", val = 2 },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
            { type = "padding", val = 1 },
            dashboard.section.footer,
        }

        alpha.setup(dashboard.opts)

        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                dashboard.section.footer.val = "⚡ Neovim loaded " .. #vim.tbl_keys(require("lazy").plugins()) .. " plugins in " .. ms .. "ms"
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}
