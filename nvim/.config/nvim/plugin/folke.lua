vim.pack.add({
	"https://github.com/folke/snacks.nvim",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/folke/noice.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
})

-- snacks
require("snacks").setup({
	input = { enabled = true, icon = "" },
	lazygit = { enabled = true },
	styles = {
		input = {
			relative = "cursor",
			row = -3,
			width = 25,
			keys = {
				["<C-c>"] = { "close", mode = { "i", "n" } },
			},
		},
		zen = {
			backdrop = { transparent = true, blend = 30 },
		},
	},
})

vim.keymap.set("n", "<leader>lg", require("snacks").lazygit.open, { desc = "Lazygit symbols toggle" })

-- trouble
local trouble = require("trouble")
local local_opts = {
	mode = "lsp_document_symbols",
	format = "{kind_icon} {symbol.name}",
	focus = true,
	follow = true,
	auto_preview = false,
	preview = { type = "none" },
	auto_fold = true,
	win = {
		position = "right",
		size = 40,
		wo = {
			winhighlight = "Normal:NONE,NormalNC:NONE",
		},
	},
	filter = {
		["not"] = { ft = "lua", kind = "Package" },
		any = {
			ft = { "help", "markdown" },
			kind = {
				"Class",
				"Constructor",
				"Namespace",
				"Enum",
				"Field",
				"Function",
				"Interface",
				"Method",
				"Module",
				"Namespace",
				"Property",
				"Struct",
				"Trait",
			},
		},
	},
}

vim.keymap.set("n", "<leader>cs", function()
	trouble.toggle(local_opts)
end, { desc = "Trouble symbols toggle" })

-- noice
require("noice").setup({
	cmdline = { enabled = false, view = "cmdline" },
	messages = { enabled = false },
	popupmenu = { enabled = false }, -- cmdline completion styling
	notify = { enabled = false },
	lsp = {
		progress = { enabled = false },
		hover = {
			enabled = true,
			silent = false,
			opts = {
				size = {
					max_width = 60, -- max documentation width
				},
			},
		},
		signature = { enabled = true, opts = {} },
		documentation = {
			enabled = true,
			opts = {
				size = {
					max_width = 60, -- max documentation width
				},
			},
		},
	},
	presets = {
		lsp_doc_border = false, -- bordered hover
	},
})

vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
	if not require("noice.lsp").scroll(4) then
		return "<c-f>"
	end
end, { silent = true, expr = true })

vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
	if not require("noice.lsp").scroll(-4) then
		return "<c-b>"
	end
end, { silent = true, expr = true })
