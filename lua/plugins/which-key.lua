return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        spec = {
            { "<leader>a", group = "Avante (AI / Cursor)" },
            { "<leader>b", group = "Buffers" },
            { "<leader>c", group = "Code Actions / Format" },
            { "<leader>f", group = "Find / Telescope" },
            { "<leader>g", group = "Git" },
            { "<leader>l", group = "LSP" },
            { "<leader>p", group = "Packages (Lazy/Mason)" },
            { "<leader>t", group = "Terminal" },
            { "<leader>u", group = "UI Toggles" },
            { "<leader>w", group = "Workspace" },
            { "<leader>x", group = "Trouble / Diagnostics" },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps",
        },
    },
}
