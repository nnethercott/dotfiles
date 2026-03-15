-- util fn for finding common commit between curr branch and origin/main
local get_base_rev = function()
	local curr = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("%s+", "")
	return vim.fn.system("git merge-base " .. curr .. " origin/main"):gsub("%s+", "")
end

vim.pack.add({
	"https://github.com/esmuellert/codediff.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
})

-- NOTE: lazygit configured in folke.lua

-- codediff
require("codediff").setup({
	-- Keymaps in diff view
	keymaps = {
		view = {
			quit = "q", -- Close diff tab
			toggle_explorer = "<leader>cx", -- Toggle explorer visibility (explorer mode only)
			next_hunk = "<C-n>", -- Jump to next change
			prev_hunk = "<C-p>", -- Jump to previous change
			next_file = "<Tab>", -- Next file in explorer mode
			prev_file = "<S-Tab>", -- Previous file in explorer mode
		},
		conflict = {
			accept_incoming = "<leader>ai", -- Accept incoming (theirs/left) change
			accept_current = "<leader>ac", -- Accept current (ours/right) change
			accept_both = "<leader>ab", -- Accept both changes (incoming first)
			discard = "<leader>ad", -- Discard both, keep base
		},
	},
})

vim.keymap.set("n", "<leader>cd", function()
	vim.cmd(":CodeDiff " .. get_base_rev())
end, { desc = "Git diff repo @-" })
vim.keymap.set("n", "<leader>cf", function()
	vim.cmd(":CodeDiff file " .. get_base_rev())
end, { desc = "Git diff file @-" })
