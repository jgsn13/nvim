return {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    init = function()
        local status_ok, onedarkpro = pcall(require, "onedarkpro")
        if not status_ok then
            return
        end

        onedarkpro.setup({})

        vim.cmd("colorscheme onedark")
        -- vim.cmd("colorscheme onelight")
        -- vim.cmd("colorscheme onedark_vivid")
        -- vim.cmd("colorscheme onedark_dark")
    end
}
