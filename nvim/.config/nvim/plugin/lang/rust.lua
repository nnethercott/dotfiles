vim.pack.add({ "https://github.com/saecki/crates.nvim" })

vim.lsp.config("rust-analyzer", {
	settings = {
		["rust-analyzer"] = {
			checkonsave = true,
			diagnostics = {
				enable = true,
			},
			cargo = {
				features = "all",
				buildscripts = {
					enable = true,
				},
			},
			procmacro = {
				enable = true,
			},
			files = {
				excludedirs = {
					".direnv",
					".git",
					".github",
					".gitlab",
					"bin",
					"node_modules",
					"target",
					"venv",
					".venv",
				},
			},
		},
	},
})

require("crates").setup({
	completion = {
		crates = {
			enabled = true,
		},
	},
	lsp = {
		enabled = true,
		actions = true,
		completion = true,
		hover = true,
	},
})

