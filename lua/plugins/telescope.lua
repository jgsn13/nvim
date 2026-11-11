return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-media-files.nvim",
    },
    keys = {
        -- AstroNvim Find Keymaps
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Find Words (Live Grep)" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
        { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Find Recent Files" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
        { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find Keymaps" },
        { "<leader>fc", "<cmd>Telescope find_files cwd=~/.config/nvim<cr>", desc = "Find Config Files" },
        { "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find in Current Buffer" },
        { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
        { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
        { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
        -- Legacy shortcuts
        { "ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        { "fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
        { "fw", "<cmd>Telescope grep_string<cr>", desc = "Find Word under Cursor" },
    },
    config = function()
        local status_ok, telescope = pcall(require, "telescope")
        if not status_ok then
            return
        end

        pcall(telescope.load_extension, "media_files")

        local actions_status_ok, actions = pcall(require, "telescope.actions")
        if not actions_status_ok then
            return
        end

        telescope.setup({
            defaults = {
                prompt_prefix = "  ",
                selection_caret = "❯ ",
                path_display = { "truncate" },
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                mappings = {
                    i = {
                        ["<C-n>"] = actions.cycle_history_next,
                        ["<C-p>"] = actions.cycle_history_prev,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-c>"] = actions.close,
                        ["<Down>"] = actions.move_selection_next,
                        ["<Up>"] = actions.move_selection_previous,
                        ["<CR>"] = actions.select_default,
                        ["<C-x>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,
                        ["<C-t>"] = actions.select_tab,
                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,
                    },
                    n = {
                        ["q"] = actions.close,
                        ["<esc>"] = actions.close,
                        ["<CR>"] = actions.select_default,
                        ["<C-x>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,
                        ["<C-t>"] = actions.select_tab,
                        ["j"] = actions.move_selection_next,
                        ["k"] = actions.move_selection_previous,
                    },
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                buffers = {
                    ignore_current_buffer = true,
                    sort_mru = true,
                },
            },
        })
    end,
}
