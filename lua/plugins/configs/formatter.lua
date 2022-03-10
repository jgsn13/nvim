require("formatter").setup(
    {
        logging = false,
        filetype = {
            html = {
                -- prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--tab-width", "4", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
                        stdin = true
                    }
                end
            },
            css = {
                -- prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--tab-width", "4", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
                        stdin = true
                    }
                end
            },
            scss = {
                -- prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--tab-width", "4", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
                        stdin = true
                    }
                end
            },
            sass = {
                -- prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--tab-width", "4", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
                        stdin = true
                    }
                end
            },
            javascript = {
                -- prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
                        stdin = true
                    }
                end
            },
            typescript = {
                -- prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
                        stdin = true
                    }
                end
            },
            rust = {
                -- Rustfmt
                function()
                    return {
                        exe = "rustfmt",
                        args = {"--emit=stdout"},
                        stdin = true
                    }
                end
            },
            lua = {
                -- luafmt
                function()
                    return {
                        exe = "luafmt",
                        args = {"--indent-count", 4, "--stdin"},
                        stdin = true
                    }
                end
            },
            cpp = {
                -- clang-format
                function()
                    return {
                        exe = "clang-format",
                        args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
                        stdin = true,
                        cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
                    }
                end
            },
            c = {
                -- clang-format
                function()
                    return {
                        exe = "clang-format",
                        args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
                        stdin = true,
                        cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
                    }
                end
            },
            python = {
                -- black or autopep8
                function()
                    return {
                        exe = "black",
                        args = {vim.api.nvim_buf_get_name(0)},
                        stdin = false
                    }
                end
            }
        }
    }
)

-- Format on save
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.html,*.css,*.scss,*.sass,*.js,*.ts,*.rs,*.lua,*.cpp,*.c,*.py FormatWrite
augroup END
]], true)
