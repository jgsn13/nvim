local colors = require("plugins.configs.lualine.colors")

local conditions = require("plugins.configs.lualine.conditions")

local M = {}

M.a = {
    {
        function()
            return "█"
        end,
        left_padding = 0,
        right_padding = 0
    }
}

M.b = {
    {
        "b:gitsigns_head",
        icon = " ",
        color = {
          fg = colors.red,
          gui = "bold"
        },
        condition = conditions.git,
        left_padding = 0
    },
    {
        "diff",
        source = function()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
                return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed
                }
            end
        end,
        colored = true,
        symbols = {added = "  ", modified = " 柳", removed = " "},
        condition = conditions.width
    }
}

M.c = {
    {
        "filetype",
        color = {
            fg = colors.purple,
        },
        condition = conditions.nvimtree
    },
    {
        "filename",
        color = {
            fg = colors.purple,
        },
        condition = conditions.empty,
        symbols = {
            modified = " ﱣ",
            readonly = " "
        }
    }
}

M.x = {
    {
        "diagnostics",
        sources = { "nvim_lsp" },
        sections = { "error", "warn", "info", "hint" },
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = ""
        },
        condition = conditions.nvimtree
    },
    {
        function()
            local msg = "LSP Inactive"
            local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then
                return msg
            end
            for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                end
            end
            return msg
        end,
        icon = " LSP:",
        condition = conditions.nvimtree,
        color = {
          fg = colors.yellow,
          gui = "bold"
        }
    }
}

M.y = {
    {
        "o:encoding",
        upper = true,
        color = {
          fg = colors.purple,
        },
        left_padding = 0,
        condition = conditions.simple
    },
    {
        "location",
        color = {
          gui = "bold"
        },
        condition = conditions.simple,
        left_padding = 0,
        right_padding = 1
    }
}

M.z = {
    {
        "progress",
        color = {
          fg = colors.purple,
        },
        left_padding = 0,
        right_padding = 1,
        condition = conditions.simple
    },
    {
        function()
            local function format_file_size(file)
                local size = vim.fn.getfsize(file)
                if size <= 0 then
                    return ""
                end
                local sufixes = {"b", "k", "m", "g"}
                local i = 1
                while size > 1024 do
                    size = size / 1024
                    i = i + 1
                end
                return string.format("%.1f%s", size, sufixes[i])
            end
            local file = vim.fn.expand("%:p")
            if string.len(file) == 0 then
                return ""
            end
            return format_file_size(file) .. " "
        end,
        condition = conditions.simple,
        color = {
          fg = colors.blue,
        },
        left_padding = 0,
        right_padding = 1
    },
    {
        function()
            local current_line = vim.fn.line "."
            local total_lines = vim.fn.line "$"
            local chars = {"_", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"}
            local line_ratio = current_line / total_lines
            local index = math.ceil(line_ratio * #chars)
            return chars[index]
        end,
        right_padding = 0,
        color = {
          fg = colors.yellow
        },
        condition = conditions.nvimtree
    }
}

return M
