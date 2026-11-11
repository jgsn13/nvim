local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
    group = augroup("YankHighlight", { clear = true }),
    callback = function()
        if vim.hl and vim.hl.on_yank then
            vim.hl.on_yank({ higroup = "Visual", timeout = 200 })
        else
            vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
        end
    end,
})

-- Terminal settings
autocmd("TermOpen", {
    group = augroup("TerminalSettings", { clear = true }),
    pattern = "*",
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
        vim.bo.filetype = "terminal"
    end,
})

-- Return to last edit position when opening files
autocmd("BufReadPost", {
    group = augroup("LastEditPosition", { clear = true }),
    pattern = "*",
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Auto-resize splits when window is resized
autocmd("VimResized", {
    group = augroup("ResizeSplits", { clear = true }),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})
