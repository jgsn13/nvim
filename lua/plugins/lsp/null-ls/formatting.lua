local M = {
	prettier = {
		extra_args = {
			"--single-quote",
			"--trailing-comma",
			"es5",
			"--stdin-filepath",
			"--print-width",
			"80",
		},
	},
	rustfmt = {
		extra_args = { "--emit=stdout" },
	},
	stylua = {
		extra_args = { "--column-width", 80, "--indent-width", 4 },
	},
	clang_format = {
		extra_args = {
			'-style="{IndentWidth: 4}"',
			"--assume-filename",
		},
	},
	black = { extra_args = { "--fast" } },
}

return M
