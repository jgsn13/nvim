local colors = require("colors")

local present, bufferline = pcall(require, "bufferline")
if not present then
    return
end

bufferline.setup {
    options = {
        offsets = {{filetype = "NvimTree", text = "", padding = 1}},
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        show_close_icon = true,
        left_trunc_marker = "",
        right_trunc_marker = "",
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin", -- "thick" | "slant" | "thin"
        always_show_bufferline = true,
        diagnostics = "nvim_lsp", -- "or false"
        custom_filter = function(buf_number)
            -- Func to filter out our managed/persistent split terms
            local present_type, type =
                pcall(
                function()
                    return vim.api.nvim_buf_get_var(buf_number, "term_type")
                end
            )

            if present_type then
                if type == "vert" then
                    return false
                elseif type == "hori" then
                    return false
                else
                    return true
                end
            else
                return true
            end
        end
    }
}
