vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/stevearc/conform.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

-- disable logs
-- https://neovim.io/doc/user/lsp/#_lua-module%3a-vim.lsp.log
vim.lsp.log.set_level("off")

require("mason").setup()
require("mason-lspconfig").setup()
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		python = { "ruff_format" },
		typescript = { "prettier" },
		html = { "prettier" },
	},
})

-- keymaps
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "cr", vim.lsp.buf.rename, { desc = "Rename", nowait = true })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References", nowait = true })
vim.keymap.set("n", "]g", vim.diagnostic.get_next, { desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "[g", vim.diagnostic.get_prev, { desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "<leader>d", function()
	return vim.lsp.buf.hover()
end, { desc = "Hover" })
vim.keymap.set("n", "gs", function()
	vim.cmd("vsplit")
	vim.lsp.buf.definition()
end, { desc = "Goto T[y]pe Definition in new vsplit" })

vim.keymap.set({ "n", "x" }, "<leader>fo", function()
	require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 500 })
end, { desc = "Format" })

-- diagnostics
vim.keymap.set({ "n" }, "<leader>ud", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle lsp diagnostics" })

-- NOTE: virtual_lines is cool too !
-- https://www.reddit.com/r/neovim/comments/1if024i/theres_now_a_builtin_virtual_lines_diagnostic/
vim.diagnostic.config({ virtual_text = true })

vim.keymap.set({ "n", "x", "o" }, "]f", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@function.inner", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]c", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@class.inner", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[f", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[c", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end)
