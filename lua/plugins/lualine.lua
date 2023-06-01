return {
    "nvim-lualine/lualine.nvim",
    event = { "VimEnter" },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        -- Load theme before lualine
        local theme_ok, _ = pcall(require, "tokyonight")
        if not theme_ok then
            return
        end

        local status_ok, lualine = pcall(require, "lualine")
        if not status_ok then
            return
        end

        local mode = {
            "mode",
            fmt = function(str)
                return "-- " .. str .. " --"
            end,
        }

        local lsp_client = function()
            local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
            if #buf_clients == 0 then
                return "LSP Inactive"
            end

            local buf_client_names = {}

            -- add client
            for _, client in pairs(buf_clients) do
                if client.name ~= "null-ls" then
                    table.insert(buf_client_names, client.name)
                end
            end

            local unique_client_names = table.concat(buf_client_names, ", ")
            local language_servers = string.format("[%s]", unique_client_names)

            return language_servers
        end

        local filetype = {
            "filetype",
            icons_enabled = false,
            icon = nil,
        }

        local branch = {
            "branch",
            icons_enabled = true,
            icon = "",
        }

        local location = {
            "location",
            padding = {
                left = 0,
                right = 1
            },
        }

        local spaces = function()
            return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
        end

        lualine.setup({
            options = {
                icons_enabled = true,
                theme = "tokyonight",
                -- component_separators = { left = '', right = '' },
                -- section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
                always_divide_middle = true,
                globalstatus = true
            },
            sections = {
                lualine_a = { branch },
                lualine_b = { mode },
                lualine_c = { lsp_client },
                lualine_x = {
                    {
                        'fileformat',
                        symbols = {
                            unix = '', -- e712
                            dos = '', -- e70f
                            mac = '', -- e711
                        }
                    },
                    spaces,
                    "encoding", -- "fileformat", "filetype"
                },
                lualine_y = {
                    filetype },
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
            tabline = {},
            extensions = {},
        })
    end,
}
