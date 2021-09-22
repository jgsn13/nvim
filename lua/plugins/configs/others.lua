local M = {}

local config = require("core.utils").load_config()

M.autopairs = function()
    local present1, autopairs = pcall(require, "nvim-autopairs")
    local present2, autopairs_completion = pcall(require, "nvim-autopairs.completion.cmp")

    if not (present1 or present2) then
        return
    end

    autopairs.setup()
    autopairs_completion.setup {
        map_complete = true, -- insert () func completion
        map_cr = true
    }
end

M.autosave = function()
    -- autosave.nvim plugin is disabled by default
    local present, autosave = pcall(require, "autosave")
    if not present then
        return
    end

    autosave.setup {
        enabled = config.options.plugin.autosave, -- takes boolean value from nvimrc.lua
        execution_message = "autosaved at : " .. vim.fn.strftime "%H:%M:%S",
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filetype_is_not = {},
            modifiable = true
        },
        clean_command_line_interval = 2500,
        on_off_commands = true,
        write_all_buffers = false
    }
end

M.blankline = function()
    require("indent_blankline").setup {
        indentLine_enabled = 1,
        char = "▏",
        show_trailing_blankline_indent = false,
        show_first_indent_level = true,
        use_treesitter = true,
        show_current_context = true,
        buftype_exclude = {"terminal", "nofile"},
        filetype_exclude = {
            "terminal",
            "[No Name]",
            "packer",
            "text",
            "help",
            "NvimTree",
            "TelescopePrompt",
            "TelescopeResults",
            "Telescope",
            "help",
            "neogitstatus",
            "Trouble"
        },
        context_patterns = {
            "class",
            "return",
            "function",
            "method",
            "^if",
            "^while",
            "jsx_element",
            "^for",
            "^object",
            "^table",
            "block",
            "arguments",
            "if_statement",
            "else_clause",
            "jsx_element",
            "jsx_self_closing_element",
            "try_statement",
            "catch_clause",
            "import_statement",
            "operation_type"
        }
    }
    vim.wo.colorcolumn = "99999"
end

M.colorizer = function()
    local present, colorizer = pcall(require, "colorizer")
    if present then
        colorizer.setup(
            {"*"},
            {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                names = false, -- "Name" codes like Blue
                RRGGBBAA = false, -- #RRGGBBAA hex codes
                rgb_fn = false, -- CSS rgb() and rgba() functions
                hsl_fn = false, -- CSS hsl() and hsla() functions
                css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- Available modes: foreground, background
                mode = "background" -- Set the display mode.
            }
        )
        vim.cmd "ColorizerReloadAllBuffers"
    end
end

M.comment = function()
    local present, nvim_comment = pcall(require, "nvim_comment")
    if present then
        nvim_comment.setup()
    end
end

M.luasnip = function()
    local present, luasnip = pcall(require, "luasnip")
    if not present then
        return
    end

    luasnip.config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI"
    }
    require("luasnip/loaders/from_vscode").load()
end

return M
