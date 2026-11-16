return {
    "yelog/i18n.nvim",
    cmd = {
        "I18nEnable",
        "I18nDisable",
        "I18nToggleTranslation",
        "I18nToggleOrigin",
        "I18nNextLocale",
        "I18nShowTranslations",
        "I18nAddKey",
        "I18nKeyUsages",
        "I18nReload",
        "I18nStatus",
    },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
    },
    opts = {
        activation = "auto",
        auto_detect = false, -- Avoid faulty {bu}.{module} prefixes and slow directory scans
        locales = { "pt", "en", "es" },
        func_pattern = { "t", "$t", "i18n.t" },
        func_type = {
            "typescript",
            "javascript",
            "typescriptreact",
            "javascriptreact",
            "vue",
            "java",
        },
        sources = {
            { pattern = "src/mixins/locales/{locales}/{module}.json", prefix = "" },
            { pattern = "src/locales/{locales}/{module}.json", prefix = "" },
            { pattern = "src/locales/{locales}.json", prefix = "" },
            { pattern = "locales/{locales}/{module}.json", prefix = "" },
            { pattern = "locales/{locales}.json", prefix = "" },
            { pattern = "src/main/resources/messages_{locales}.properties", prefix = "" },
            { pattern = "src/main/resources/messages.properties", prefix = "" },
        },
        usage = {
            popup_type = "telescope",
            scan_on_startup = false, -- Never block editor startup scanning files!
        },
    },
    config = function(_, opts)
        require("i18n").setup(opts)

        -- Safely register completion source
        local ok_cmp, cmp = pcall(require, "cmp")
        if ok_cmp then
            local ok_source, i18n_source = pcall(require, "i18n.integration.cmp_source")
            if ok_source and i18n_source then
                pcall(cmp.register_source, "i18n", i18n_source.new())
            end
        end
    end,
    keys = {
        { "<leader>is", "<cmd>I18nShowTranslations<cr>", desc = "Show Translations under Cursor" },
        { "<leader>it", "<cmd>I18nToggleTranslation<cr>", desc = "Toggle Translation Preview" },
        { "<leader>io", "<cmd>I18nToggleOrigin<cr>", desc = "Toggle Original Key" },
        { "<leader>il", "<cmd>I18nNextLocale<cr>", desc = "Next Locale" },
        { "<leader>ia", "<cmd>I18nAddKey<cr>", desc = "Add Translation Key" },
        { "<leader>iu", "<cmd>I18nKeyUsages<cr>", desc = "Find Key Usages" },
        { "<leader>ir", "<cmd>I18nReload<cr>", desc = "Reload Translations" },
        {
            "<leader>fi",
            function()
                require("i18n").i18n_keys()
            end,
            desc = "Find i18n Keys (Telescope)",
        },
    },
}
