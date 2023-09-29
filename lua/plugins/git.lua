return {
    {
        "f-person/git-blame.nvim",
    },
    {
        "lewis6991/gitsigns.nvim",
        init = function()
            local status_ok, gitsigns = pcall(require, "gitsigns")
            if not status_ok then
                return
            end

            gitsigns.setup({
                signs = {
                    add = { text = "│" },
                    change = { text = "│" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked = { text = "┆" },
                },
                signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
                numhl = true,      -- Toggle with `:Gitsigns toggle_numhl`
            })
        end,
    },
}
