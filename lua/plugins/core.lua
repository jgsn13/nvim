return {
    --[[ { ]]
    --[[ 	"famiu/bufdelete.nvim", ]]
    --[[ 	cmd = { "Bdelete", "Bwipeout" }, ]]
    --[[ 	keys = { ]]
    --[[ 		{ ]]
    --[[ 			"<C-q>", ]]
    --[[ 			":Bdelete<CR>", ]]
    --[[ 			mode = "n", ]]
    --[[ 			silent = true, ]]
    --[[ 			desc = "Delete buffer", ]]
    --[[ 		}, ]]
    --[[ 	}, ]]
    --[[ }, ]]
    {
        "max397574/better-escape.nvim",
        init = function()
            local status_ok, better_escape = pcall(require, "better_escape")
            if not status_ok then
                return
            end

            better_escape.setup()
        end,
    },
}
