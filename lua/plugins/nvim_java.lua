return {
    "nvim-java/nvim-java",
    ft = { "java" },
    config = function()
        if not vim.env.JAVA_HOME or not vim.env.JAVA_HOME:match("2[1-9]") then
            local jdk_candidates = {
                vim.fn.expand("~/.asdf/installs/java/openjdk-21.0.2"),
                vim.fn.glob(vim.fn.stdpath("data") .. "/nvim-java/packages/openjdk/*/*"),
            }
            for _, jdk in ipairs(jdk_candidates) do
                if vim.fn.isdirectory(jdk) == 1 and vim.fn.filereadable(jdk .. "/bin/java") == 1 then
                    vim.env.JAVA_HOME = jdk
                    break
                end
            end
        end

        require("java").setup()
        vim.lsp.enable("jdtls")
    end,
}
