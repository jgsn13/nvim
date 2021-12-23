local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

ts_config.setup {
    ensure_installed = {
        "lua",
        "typescript",
        "javascript"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    },
    autotag = {
        enable = true,
        filetypes = {
            "html",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "svelte",
            "vue"
        }
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    }
}
