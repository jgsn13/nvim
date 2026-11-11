return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
        { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle Pin" },
        { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Delete Non-Pinned Buffers" },
        { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete Other Buffers" },
        { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Delete Buffers to the Right" },
        { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Delete Buffers to the Left" },
        { "<leader>c", "<cmd>bdelete<cr>", desc = "Close Current Buffer" },
    },
    opts = {
        options = {
            mode = "buffers",
            separator_style = "thin",
            always_show_bufferline = true,
            show_buffer_close_icons = true,
            show_close_icon = false,
            color_icons = true,
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level)
                local icon = level:match("error") and " " or " "
                return " " .. icon .. count
            end,
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "EXPLORER",
                    text_align = "left",
                    highlight = "Directory",
                    separator = true,
                },
                {
                    filetype = "Avante",
                    text = "CURSOR AI",
                    text_align = "center",
                    highlight = "Directory",
                    separator = true,
                },
            },
        },
    },
}
