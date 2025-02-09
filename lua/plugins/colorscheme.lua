-- return {
--     "olimorris/onedarkpro.nvim",
--     priority = 1000, -- Ensure it loads first
--     init = function()
--         local status_ok, onedarkpro = pcall(require, "onedarkpro")
--         if not status_ok then
--             return
--         end
--
--         onedarkpro.setup({})
--
--         vim.cmd("colorscheme onedark")
--         -- vim.cmd("colorscheme onelight")
--         -- vim.cmd("colorscheme onedark_vivid")
--         -- vim.cmd("colorscheme onedark_dark")
--     end
-- }
return {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_enable_bold = true
        vim.g.gruvbox_material_background = 'hard'
        vim.g.gruvbox_material_foreground = 'original'
        vim.cmd.colorscheme('gruvbox-material')
    end
}
