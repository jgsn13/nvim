local present, icons = pcall(require, "nvim-web-devicons")
if not present then
	return
end

icons.setup({
	override = {
		svg = {
			icon = "",
			color = "#00ff83",
			name = "svg",
		},
		sh = {
			icon = "",
			color = "#565346",
			name = "sh",
		},
		html = {
			icon = "",
			color = "#E44D26",
			name = "html",
		},
		css = {
			icon = "",
			color = "#42A5F5",
			name = "css",
		},
		ts = {
			icon = "ﯤ", -- "",
			color = "#0288D1",
			name = "typescript",
		},
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
		js = {
			icon = "",
			color = "#FFCA28",
			name = "javascript",
		},
		["yarn.lock"] = {
			icon = "",
			color = "#0282C8",
			name = "yarnlock",
		},
		rs = {
			icon = "",
			color = "#EA683F",
			name = "rust",
		},
		["Cargo.lock"] = {
			icon = "",
			color = "#EA683F",
			name = "cargolock",
		},
		[".editorconfig"] = {
			icon = "",
			color = "#E1CBF2",
			name = "editorconfig",
		},
		["angular.json"] = {
			icon = "",
			color = "#E53935",
			name = "angularconfig",
		},
		["module.ts"] = {
			icon = "",
			color = "#E53935",
			name = "angularmodule",
		},
		["component.ts"] = {
			icon = "",
			color = "#0288D1",
			name = "angularcomponent",
		},
		["service.ts"] = {
			icon = "",
			color = "#FFCA28",
			name = "angularservice",
		},
		["guard.ts"] = {
			icon = "",
			color = "#43A047",
			name = "angularguard",
		},
		["directive.ts"] = {
			icon = "",
			color = "#AB47BC",
			name = "angulardirective",
		},
		["resolver.ts"] = {
			icon = "",
			color = "#43A047",
			name = "angularresolver",
		},
		["pipe.ts"] = {
			icon = "",
			color = "#00897B",
			name = "angularpipe",
		},
		["karma.conf.js"] = {
			icon = "",
			color = "#3CBEAE",
			name = "karmaconfig",
		},
		[".browserslistrc"] = {
			icon = "",
			color = "#FFCA28",
			name = "browserslistrc",
		},
		["package.json"] = {
			icon = "",
			color = "#7BAC43",
			name = "nodepackages",
		},
		json = {
			icon = "ﬥ",
			color = "#FABF2C",
			name = "json",
		},
		txt = {
			icon = "",
			color = "#74c2c9",
			name = "text",
		},
		[".prettierrc"] = {
			icon = "",
			color = "#C596C7",
			name = "prettierrc",
		},
	},
})
