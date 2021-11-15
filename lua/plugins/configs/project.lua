require("project_nvim").setup {
    {
        manual_mode = false,
        detection_methods = {"lsp", "pattern"},
        patterns = {
            "gradle.build",
            "pom.xml",
            ".git",
            "_darcs",
            ".hg",
            ".bzr",
            ".svn",
            "Makefile",
            "package.json",
            "build.xml",
            "settings.gradle",
            "settings.gradle.kts",
            "build.gradle",
            "build.gradle.kts"
        },
        ignore_lsp = {},
        show_hidden = false,
        silent_chdir = true,
        datapath = vim.fn.stdpath("data")
    }
}
require("telescope").load_extension("projects")
