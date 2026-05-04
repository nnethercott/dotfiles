vim.pack.add({
	-- selector
	"https://github.com/nnethercott/themery.nvim",
	-- dependencies
	"https://github.com/rktjmp/lush.nvim",
	-- colors
	"https://github.com/RRethy/base16-nvim",
	"https://gitlab.com/motaz-shokry/gruvbox.nvim",
	"https://github.com/zenbones-theme/zenbones.nvim",
})

require("themery").setup({
	themes = {
		"base16-black-metal-gorgoroth",
		"gruvbox",
	},
})

vim.api.nvim_set_keymap("n", "<leader>ts", ":Themery<CR>", { desc = "toggle themes" })
-- prevent terminal (Ghostty/OSC 11) from overriding vim.o.background on tmux session switch
pcall(vim.api.nvim_del_augroup_by_name, "nvim.tty")

vim.keymap.set("n", "<leader>t", function()
	vim.o.background = (vim.o.background == "dark") and "light" or "dark"
end, { desc = "toggle themes" })

-- theme setups
-- zenbones
-- https://vimcolorschemes.com/zenbones-theme/zenbones.nvim
local opts = { italic_strings = false }
vim.g.zenbones = opts
vim.g.zenwritten = opts
vim.g.neobones = opts

-- gruvbox
require("gruvbox").setup({
	-- dark_variant = "hard",
	styles = {
		italic = false,
	},
	-- plugin doesn't recognize mini statusline :(
	before_highlight = function(group, highlight, _)
		if group:match("^MiniStatusline") then
			for k in pairs(highlight) do
				highlight[k] = nil
			end
		end
	end,
})

-- base16-black-metal-gorgoroth
local gorgoroth_overrides = function()
	local hl = vim.api.nvim_set_hl
	hl(0, "DiagnosticVirtualTextError", { fg = "#912222" })
	hl(0, "TSComment", { fg = "#6f7b68" })
	hl(0, "Comment", { fg = "#6f7b68" })
	hl(0, "Visual", { bg = "#9b8d7f", fg = "#1e1e1e" })
	hl(0, "Search", { bg = "#9b8d7f", fg = "#1e1e1e" })
	hl(0, "PmenuSel", { bg = "#9b8d7f", fg = "#1e1e1e" })
	hl(0, "NormalFloat", { fg = "#c1c1c1", bg = "#121212" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		if vim.g.colors_name == "base16-black-metal-gorgoroth" then
			gorgoroth_overrides()
		end
	end,
})
