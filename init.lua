if vim.g.nvui then
    vim.cmd [[set guifont=FiraCode\ NF:h11]]
end

local init_modules = {
    "core"
}

for _, module in ipairs(init_modules) do
    local ok, err = pcall(require, module)
    if not ok then
        error("Error loading " .. module .. "\n\n" .. err)
    end
end
