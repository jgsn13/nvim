return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local status_ok, lualine = pcall(require, "lualine")
        if not status_ok then
            return
        end

        local mode_map = {
            ["n"] = { "NORMAL", "" },
            ["no"] = { "O-PENDING", "" },
            ["nov"] = { "O-PENDING", "" },
            ["noV"] = { "O-PENDING", "" },
            ["no\22"] = { "O-PENDING", "" },
            ["niI"] = { "NORMAL", "" },
            ["niR"] = { "NORMAL", "" },
            ["niV"] = { "NORMAL", "" },
            ["nt"] = { "NORMAL", "" },
            ["v"] = { "VISUAL", "󰈈" },
            ["vs"] = { "VISUAL", "󰈈" },
            ["V"] = { "V-LINE", "󰈈" },
            ["Vs"] = { "V-LINE", "󰈈" },
            ["\22"] = { "V-BLOCK", "󰈈" },
            ["\22s"] = { "V-BLOCK", "󰈈" },
            ["s"] = { "SELECT", "󰒅" },
            ["S"] = { "S-LINE", "󰒅" },
            ["\19"] = { "S-BLOCK", "󰒅" },
            ["i"] = { "INSERT", "" },
            ["ic"] = { "INSERT", "" },
            ["ix"] = { "INSERT", "" },
            ["R"] = { "REPLACE", "󰛄" },
            ["Rc"] = { "REPLACE", "󰛄" },
            ["Rx"] = { "REPLACE", "󰛄" },
            ["Rv"] = { "V-REPLACE", "󰛄" },
            ["Rvc"] = { "V-REPLACE", "󰛄" },
            ["Rvx"] = { "V-REPLACE", "󰛄" },
            ["c"] = { "COMMAND", "" },
            ["cv"] = { "EX", "" },
            ["ce"] = { "EX", "" },
            ["r"] = { "PROMPT", "" },
            ["rm"] = { "MORE", "" },
            ["r?"] = { "CONFIRM", "" },
            ["!"] = { "SHELL", "" },
            ["t"] = { "TERMINAL", "" },
        }

        local mode = {
            function()
                local m = vim.api.nvim_get_mode().mode
                local info = mode_map[m] or { m, "" }
                return string.format("%s %s", info[2], info[1])
            end,
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
        }

        local branch = {
            "branch",
            icon = "",
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
        }

        local diff = {
            "diff",
            colored = true,
            symbols = { added = " ", modified = " ", removed = " " },
        }

        local diagnostics = {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
            colored = true,
        }

        local lsp_client = {
            function()
                local get_clients = vim.lsp.get_clients or vim.lsp.get_active_clients
                local buf_clients = get_clients({ bufnr = 0 })
                if #buf_clients == 0 then
                    return ""
                end

                local buf_client_names = {}
                for _, client in pairs(buf_clients) do
                    if client.name ~= "copilot" and client.name ~= "null-ls" then
                        table.insert(buf_client_names, client.name)
                    end
                end

                if #buf_client_names == 0 then
                    return ""
                end

                return "  " .. table.concat(buf_client_names, ", ")
            end,
            cond = function()
                local get_clients = vim.lsp.get_clients or vim.lsp.get_active_clients
                return #get_clients({ bufnr = 0 }) > 0
            end,
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
        }

        local indent_info = {
            function()
                return "󰌒 " .. vim.bo.shiftwidth
            end,
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
        }

        local location = {
            "location",
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
        }

        lualine.setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = "",
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = { "alpha", "dashboard", "NvimTree", "neo-tree", "Avante" },
                },
                always_divide_middle = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = { mode },
                lualine_b = { branch, diff },
                lualine_c = {
                    { "filename", file_status = true, path = 0 },
                    diagnostics,
                },
                lualine_x = {
                    lsp_client,
                    {
                        "filetype",
                        icon_only = false,
                        separator = { left = "", right = "" },
                        padding = { left = 1, right = 1 },
                    },
                    indent_info,
                },
                lualine_y = { "progress" },
                lualine_z = { location },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
