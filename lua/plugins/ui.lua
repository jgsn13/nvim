return {
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        init = function()
            local status_ok, ibl = pcall(require, "ibl")
            if not status_ok then
                return
            end

            ibl.setup()
        end
    },
    { "MunifTanjim/nui.nvim", lazy = true },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        init = function()
            local present, icons = pcall(require, "nvim-web-devicons")
            if not present then
                return
            end

            icons.setup({
                override = {
                    ["spec.ts"] = {
                        icon = "",
                        color = "#0288D1",
                        name = "typescripttest",
                    },
                    ["test.ts"] = {
                        icon = "",
                        color = "#0288D1",
                        name = "typescripttest",
                    },
                    txt = {
                        icon = "",
                        color = "#74c2c9",
                        name = "text",
                    },
                    asm = {
                        icon = "",
                        color = "#C596C7",
                        name = "assembly",
                    },
                    s = {
                        icon = "",
                        color = "#C596C7",
                        name = "assembly",
                    },
                },
            })
        end,
    },
}
