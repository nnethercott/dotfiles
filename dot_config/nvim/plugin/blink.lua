vim.pack.add({
	"https://github.com/saghen/blink.cmp",
	"https://github.com/rafamadriz/friendly-snippets",
})

require("blink.cmp").setup({
	cmdline = {
		enabled = true,
	},
	keymap = {
		["<S-Tab>"] = { "select_prev", "fallback" },
		["<Tab>"] = { "select_next", "fallback" },
		["<C-n>"] = { "snippet_forward", "fallback" },
		["<C-o>"] = { "snippet_backward", "fallback" },
		["<CR>"] = { "accept", "fallback" },
	},
	fuzzy = {
		implementation = "prefer_rust",
	},
})
