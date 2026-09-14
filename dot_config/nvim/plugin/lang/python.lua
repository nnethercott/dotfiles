vim.lsp.config("ty", {
	settings = {
		ty = {
			diagnosticMode = "workspace",
			experimental = {
				rename = true,
			},
		},
	},
})
vim.lsp.enable("ty")
