local colors = require("plugins.configs.lualine.colors")

local conditions = require("plugins.configs.lualine.conditions")

local M = {}

M.a = {
    {
        "mode",
        color = {
            gui = "bold"
        }
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
        cond = conditions.git,
        padding = {
            left = 0,
            right = 0
        }
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
        symbols = {added = "  ", modified = " 柳", removed = "  "},
        cond = conditions.width
    }
}

M.c = {
    {
        "filetype",
        icon_only = false, -- Display only icon for filetype
        color = {
            fg = colors.purple
        },
        cond = conditions.nvimtree
    },
    {
        "filename",
        file_status = true, -- displays file status (readonly status, modified status)
        path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
        -- shorting_target = 40, -- Shortens path to leave 40 space in the window
        -- for other components. Terrible name any suggestions?
        symbols = {
            modified = " ﱣ",
            readonly = " "
        },
        color = {
            fg = colors.purple
        },
        cond = conditions.empty
    }
}

M.x = {
    {
        "diagnostics",
        sources = {"nvim_lsp"},
        sections = {"error", "warn", "info", "hint"},
        symbols = {
            error = " ",
            warn = " ",
            info = " ",
            hint = " "
        },
        cond = conditions.nvimtree
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
        cond = conditions.nvimtree,
        color = {
            fg = colors.gray_fg,
            gui = "bold"
        }
    }
}

M.y = {
    {
        "o:encoding",
        upper = true,
        color = {
            fg = colors.purple
        },
        padding = {
            left = 0,
            right = 1
        },
        cond = conditions.simple
    },
    {
        "location",
        color = {
            gui = "bold"
        },
        cond = conditions.simple,
        padding = {
            left = 0,
            right = 0
        }
    },
    {
        "progress",
        color = {
            fg = colors.purple
        },
        padding = {
            left = 0,
            right = 1
        },
        cond = conditions.simple
    }
}

M.z = {
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
        cond = conditions.simple,
        color = {
            fg = colors.blue
        },
        padding = {
            left = 0,
            right = 1
        }
    },
    {
        "fileformat",
        symbols = {
            unix = "",
            dos = "",
            mac = "" -- e711
        },
        cond = conditions.simple,
        padding = {
            left = 0,
            right = 1
        }
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
        padding = {
            right = 0
        },
        color = {
            fg = colors.yellow
        },
        cond = conditions.nvimtree
    }
}

return M
