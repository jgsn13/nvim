return {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = function()
        local ok, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
        if ok then
            return {
                pre_hook = ts_comment.create_pre_hook(),
            }
        end
        return {}
    end,
}
