local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
	return
end

cmp.setup.buffer({
	sources = cmp.config.sources(
		{ { name = "conventionalcommits" } },
		{ { name = "buffer" } }
	),
})
