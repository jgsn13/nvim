return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local status_ok, barbecue = pcall(require, 'barbecue')
        if not status_ok then
            return
        end
        local status_ok2, barbecue_ui = pcall(require, "barbecue.ui")
        if not status_ok2 then
            return
        end

        barbecue.setup({
            create_autocmd = false,
            theme = "auto"
        })

        vim.api.nvim_create_autocmd({
            "WinResized",
            "BufWinEnter",
            "CursorHold",
            "InsertLeave",
            -- include this if you have set `show_modified` to `true`
            "BufModifiedSet",
        }, {
            group = vim.api.nvim_create_augroup("barbecue.updater", {}),
            callback = function()
                barbecue_ui.update()
            end,
        })
    end,
}
