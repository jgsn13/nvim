-- Don't change terminal cursor shape
vim.cmd [[
    augroup change_cursor
        au!
        au ExitPre * :set guicursor=a:ver90
    augroup END
]]

local init_modules = {
    "core"
}

for _, module in ipairs(init_modules) do
    local ok, err = pcall(require, module)
    if not ok then
        error("Error loading " .. module .. "\n\n" .. err)
    end
end

vim.cmd [[
if exists("g:neovide")
    " Put anything you want to happen only in Neovide here
    let g:neovide_transparency=0.88
    set guifont=FiraCode\ NF:h8
    let g:neovide_cursor_vfx_mode = "railgun"
endif
]]
