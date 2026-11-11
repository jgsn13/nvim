return {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo", "Format" },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = { "n", "v" },
            desc = "Format buffer / selection",
        },
        {
            "<leader>lf",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = { "n", "v" },
            desc = "Format buffer / selection",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            javascriptreact = { "prettierd", "prettier", stop_after_first = true },
            typescriptreact = { "prettierd", "prettier", stop_after_first = true },
            css = { "prettierd", "prettier", stop_after_first = true },
            scss = { "prettierd", "prettier", stop_after_first = true },
            html = { "prettierd", "prettier", stop_after_first = true },
            json = { "prettierd", "prettier", stop_after_first = true },
            jsonc = { "prettierd", "prettier", stop_after_first = true },
            yaml = { "prettierd", "prettier", stop_after_first = true },
            markdown = { "prettierd", "prettier", stop_after_first = true },
            python = { "black", stop_after_first = true },
            rust = { "rustfmt" },
            c = { "clang-format" },
            cpp = { "clang-format" },
        },
        -- Format on save disabled completely; use <leader>cf, <leader>lf or :Format
        format_on_save = false,
        formatters = {
            stylua = {
                prepend_args = { "--column-width", "80", "--indent-width", "4" },
            },
        },
    },
    init = function()
        vim.api.nvim_create_user_command("Format", function(args)
            local range = nil
            if args.count ~= -1 then
                local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                range = {
                    start = { args.line1, 0 },
                    ["end"] = { args.line2, end_line and end_line:len() or 0 },
                }
            end
            require("conform").format({ async = true, lsp_fallback = true, range = range })
        end, { range = true, desc = "Format buffer or range with conform" })
    end,
}
