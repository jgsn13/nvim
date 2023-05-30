return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    opts = {
        load = {
            ["core.defaults"] = {},  -- Loads default behaviour
            ["core.concealer"] = {}, -- Adds pretty icons to your documents
            ["core.dirman"] = {      -- Manages Neorg workspaces
                config = {
                    workspaces = {
                        home = "~/Notes/home",
                        work = "~/Notes/work",
                        study = "~/Notes/study",
                    },
                },
            },
        },
    },
    dependencies = { { "nvim-lua/plenary.nvim" } },
}
