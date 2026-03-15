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

  -- https://cmp.saghen.dev/recipes.html#completion-menu-drawing
	completion = {
		menu = {
			draw = {
				components = {
					kind_icon = {
						text = function(ctx)
							local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
							return kind_icon .. " "
						end,
						-- (optional) use highlights from mini.icons
						highlight = function(ctx)
							local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
							return hl
						end,
					},
					kind = {
						-- (optional) use highlights from mini.icons
						highlight = function(ctx)
							local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
							return hl
						end,
					},
				},
			},
		},
	}
})
