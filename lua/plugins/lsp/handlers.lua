local M = {}

M.setup = function()
    local config = {
        virtual_text = false,
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = "",
                [vim.diagnostic.severity.WARN] = "",
                [vim.diagnostic.severity.HINT] = "",
                [vim.diagnostic.severity.INFO] = "",
            },
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    -- Future-proof hover and signature handlers with rounded borders
    local orig_hover = vim.lsp.handlers["textDocument/hover"]
    vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, cfg)
        return orig_hover(err, result, ctx, vim.tbl_extend("force", cfg or {}, { border = "rounded" }))
    end

    local orig_sig = vim.lsp.handlers["textDocument/signatureHelp"]
    vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, cfg)
        return orig_sig(err, result, ctx, vim.tbl_extend("force", cfg or {}, { border = "rounded" }))
    end
end

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

    vim.keymap.set("n", "<space>d", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

    -- Diagnostic navigation (compatible across Neovim 0.10/0.11/0.12)
    vim.keymap.set("n", "[d", function()
        if vim.diagnostic.jump then
            vim.diagnostic.jump({ count = -1, float = true })
        else
            vim.diagnostic.goto_prev({ float = true })
        end
    end, opts)

    vim.keymap.set("n", "]d", function()
        if vim.diagnostic.jump then
            vim.diagnostic.jump({ count = 1, float = true })
        else
            vim.diagnostic.goto_next({ float = true })
        end
    end, opts)
end

M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)

    -- Formatters handled by conform.nvim
    local name = client.name
    if name == "ts_ls" or name == "lua_ls" or name == "clangd" or name == "jsonls" then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
    M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
else
    M.capabilities = capabilities
end

return M
