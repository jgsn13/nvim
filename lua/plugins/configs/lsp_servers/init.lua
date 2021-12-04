require("plugins.configs.lsp_servers.lua")
require("plugins.configs.lsp_servers.vue")
require("plugins.configs.lsp_servers.python")
require("plugins.configs.lsp_servers.angular")
require("plugins.configs.lsp_servers.tsserver")
require("plugins.configs.lsp_servers.deno")
require("plugins.configs.lsp_servers.eslint")
require("plugins.configs.lsp_servers.rust")
-- --require("plugins.configs.lsp_servers.tailwindcss")
require("plugins.configs.lsp_servers.html")
require("plugins.configs.lsp_servers.css")
require("plugins.configs.lsp_servers.emmet")
require("plugins.configs.lsp_servers.clangd")
-- require("plugins.configs.lsp_servers.java")
require("plugins.configs.lsp_servers.graphql")
require("plugins.configs.lsp_servers.sqlls")

vim.api.nvim_exec(
    [[
  augroup lsp
    au!
    au FileType java lua require("plugins.configs.lsp_servers.java")
  augroup end]],
    false
)
