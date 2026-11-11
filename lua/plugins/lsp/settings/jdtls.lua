local java_exe = "/home/joaquim/.asdf/installs/java/openjdk-21.0.2/bin/java"
local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls/"
local launcher_jar = vim.fn.glob(jdtls_path .. "plugins/org.eclipse.equinox.launcher_*.jar")
local config_path = jdtls_path .. "config_linux"
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local java_cmd = {
	java_exe,
	"-Declipse.application=org.eclipse.jdt.ls.core.id1",
	"-Dosgi.bundles.defaultStartLevel=4",
	"-Declipse.product=org.eclipse.jdt.ls.core.product",
	"-Dlog.protocol=true",
	"-Dlog.level=ALL",
	"-Xms1g",
	"--add-modules=ALL-SYSTEM",
	"--add-opens",
	"java.base/java.util=ALL-UNNAMED",
	"--add-opens",
	"java.base/java.lang=ALL-UNNAMED",
	"-jar",
	launcher_jar,
	"-configuration",
	config_path,
	"-data",
	workspace_dir,
}

return {
	cmd = java_cmd,
	on_attach = require("plugins.lsp.handlers").on_attach,
	capabilities = require("plugins.lsp.handlers").capabilities,
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-21",
						path = "/home/joaquim/.asdf/installs/java/openjdk-21.0.2",
						default = true,
					},
				},
			},
		},
	},
}
