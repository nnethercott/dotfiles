vim.pack.add({
	-- selector
	"https://github.com/nnethercott/themery.nvim",
	-- dependencies
	"https://github.com/rktjmp/lush.nvim",
	-- colors
	"https://gitlab.com/motaz-shokry/gruvbox.nvim",
})

require("themery").setup({
	themes = {
		"base16-black-metal-gorgoroth",
		"gruvbox",
	},
})

vim.api.nvim_set_keymap("n", "<leader>ts", ":Themery<CR>", { desc = "toggle themes" })
vim.keymap.set("n", "<leader>t", function()
	vim.o.background = (vim.o.background == "dark") and "light" or "dark"
end, { desc = "toggle themes" })

-- theme setups
-- gruvbox
require("gruvbox").setup({
	dark_variant = "hard",
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

