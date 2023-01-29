return {
	"mhartington/formatter.nvim",
	config = function()
		local present, formatter = pcall(require, "formatter")
		if not present then
			return
		end

		local util_status_ok, util = pcall(require, "formatter.util")
		if not util_status_ok then
			return
		end

		formatter.setup({
			logging = false,
			filetype = {
				prisma = {
					function()
						return {
							exe = "prisma",
							args = {
								"format",
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = true,
						}
					end,
				},
				html = {
					-- prettier
					function()
						return {
							exe = "prettier",
							args = {
								"--tab-width",
								"2",
								"--stdin-filepath",
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = true,
						}
					end,
				},
				css = {
					-- prettier
					function()
						return {
							exe = "prettier",
							args = {
								"--tab-width",
								"2",
								"--stdin-filepath",
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = true,
						}
					end,
				},
				scss = {
					-- prettier
					function()
						return {
							exe = "prettier",
							args = {
								"--tab-width",
								"2",
								"--stdin-filepath",
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = true,
						}
					end,
				},
				sass = {
					-- prettier
					function()
						return {
							exe = "prettier",
							args = {
								"--tab-width",
								"2",
								"--stdin-filepath",
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = true,
						}
					end,
				},
				json = {
					-- prettier
					function()
						return {
							exe = "prettier",
							args = {
								"--stdin-filepath",
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = true,
						}
					end,
				},
				javascript = {
					-- prettier
					function()
						return {
							exe = "prettier",
							args = {
								"--single-quote",
								"--trailing-comma",
								"all",
								"--stdin-filepath",
								"--print-width",
								"80",
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = true,
						}
					end,
				},
				javascriptreact = {
					-- prettier
					function()
						return {
							exe = "prettier",
							args = {
								"--single-quote",
								"--trailing-comma",
								"all",
								"--stdin-filepath",
								"--print-width",
								"80",
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = true,
						}
					end,
				},
				typescript = {
					-- prettier
					function()
						return {
							exe = "prettier",
							args = {
								"--print-width",
								"80",
								"--single-quote",
								"--trailing-comma",
								"all",
								"--stdin-filepath",
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = true,
						}
					end,
				},
				typescriptreact = {
					-- prettier
					function()
						return {
							exe = "prettier",
							args = {
								"--single-quote",
								"--trailing-comma",
								"all",
								"--stdin-filepath",
								"--print-width",
								"80",
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = true,
						}
					end,
				},
				php = {
					-- prettier
					function()
						return {
							exe = "prettier",
							args = {
								"--tab-width",
								"4",
								"--stdin-filepath",
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = true,
						}
					end,
				},
				vue = {
					-- prettier
					function()
						return {
							exe = "prettier",
							args = {
								"--single-quote",
								"--trailing-comma",
								"all",
								"--stdin-filepath",
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = true,
						}
					end,
				},
				rust = {
					-- Rustfmt
					function()
						return {
							exe = "rustfmt",
							args = { "--emit=stdout" },
							stdin = true,
						}
					end,
				},
				lua = {
					-- stylua
					function()
						return {
							exe = "stylua",
							args = {
								"--search-parent-directories",
								"--stdin-filepath",
								util.escape_path(
									util.get_current_buffer_file_path()
								),
								"--column-width",
								80,
								"--indent-width",
								4,
								"--",
								"-",
							},
							stdin = true,
						}
					end,
				},
				cpp = {
					-- clang-format
					function()
						return {
							exe = "clang-format",
							args = {
								"--assume-filename",
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = true,
							cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
						}
					end,
				},
				c = {
					-- clang-format
					function()
						return {
							exe = "clang-format",
							args = {
								'-style="{IndentWidth: 4}"',
								"--assume-filename",
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = true,
							cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
						}
					end,
				},
				python = {
					-- black or autopep8
					function()
						return {
							exe = "black",
							args = {
								"--line-length",
								120,
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = false,
						}
					end,
				},
			},
		})

		-- Format on save
		vim.api.nvim_exec(
			[[
            augroup FormatAutogroup
              autocmd!
              autocmd BufWritePost *.prisma,*.html,*.css,*.scss,*.sass,*.ts,*.json,*.js,*.tsx,*.jsx,*.rs,*.lua,*.cpp,*.py FormatWrite
            augroup END
            ]],
			true
		)
	end,
}
