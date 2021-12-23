local present, cmp = pcall(require, "cmp")

if not present then
    return
end

vim.opt.completeopt = "menu,menuone,noselect"

-- nvim-cmp setup
cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
    formatting = {
        format = function(entry, vim_item)
            -- load lspkind icons
            vim_item.kind =
                string.format("%s %s", require("plugins.configs.lspkind_icons").icons[vim_item.kind], vim_item.kind)

            vim_item.menu =
                ({
                buffer = "[BUF]",
                path = "[Path]",
                emoji = "[Emoji]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                vsnip = "[VSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]"
            })[entry.source.name]

            return vim_item
        end
    },
    mapping = {
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
        ["<C-j>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
        ["<C-k>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
        ["<Down>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
        ["<Up>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping(
            {
                i = cmp.mapping.abort(),
                c = cmp.mapping.close()
            }
        ),
        ["<CR>"] = cmp.mapping.confirm(
            {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true
            }
        ),
        -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ["<Tab>"] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
            elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
            elseif require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
                fallback()
            end
        end
    },
    sources = cmp.config.sources(
        {
            {name = "nvim_lua"},
            {name = "nvim_lsp"},
            {name = "luasnip"},
            {name = "path"},
            {name = "emoji"},
            {name = "orgmode"}
        },
        {
            {name = "buffer"}
        }
    )
}

cmp.setup.cmdline(
    "/",
    {
        sources = {
            {name = "buffer"},
            {name = "path"}
        }
    }
)

cmp.setup.cmdline(
    ":",
    {
        sources = cmp.config.sources(
            {
                {name = "path"}
            },
            {
                {name = "cmdline"}
            }
        )
    }
)
