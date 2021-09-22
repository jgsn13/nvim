-- NOTE: NvimTree conditions are redundant because statusline does not appears
-- when NvimTree is open
return {
    nvimtree = function()
        return vim.fn.winwidth(0) > 80 and vim.fn.empty(vim.fn.expand("%:t")) ~= 1 and
            vim.fn.expand("%:t") ~= "NvimTree"
    end,
    width = function()
        return vim.fn.winwidth(0) > 80
    end,
    simple = function()
        return vim.fn.winwidth(0) > 80 and vim.fn.expand("%:t") ~= "NvimTree"
    end,
    empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    git = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath and vim.fn.winwidth(0) > 80
    end
}
