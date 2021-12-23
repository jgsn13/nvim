local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.org = {
    install_info = {
        url = "https://github.com/milisims/tree-sitter-org",
        revision = "f110024d539e676f25b72b7c80b0fd43c34264ef",
        files = {"src/parser.c", "src/scanner.cc"}
    },
    filetype = "org"
}

ts_config.setup {
    highlight = {
        enable = true,
        use_languagetree = true,
        -- disable = {"org"}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
        additional_vim_regex_highlighting = {"org"} -- Required since TS highlighter doesn't support all syntax features (conceal)
    },
    ensure_installed = {
        "lua",
        "typescript",
        "javascript",
        "css",
        "html",
        "json",
        "org"
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

require("orgmode").setup(
    {
        org_agenda_files = {"~/Documents/org/*", "~/my-orgs/**/*"},
        org_default_notes_file = "~/Documents/org/refile.org"
    }
)
