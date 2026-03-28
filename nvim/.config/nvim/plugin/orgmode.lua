vim.pack.add({
	"https://github.com/nvim-orgmode/orgmode",
	"https://github.com/chipsenkbeil/org-roam.nvim",
})

require("orgmode").setup({
	org_agenda_files = "~/orgfiles/**/*",
	org_default_notes_file = "~/orgfiles/refile.org",
	org_startup_folded = "showeverything",
	mappings = {
		capture = {
			org_capture_refile = "R",
			org_capture_finalize = "q",
		},
	},
})
require("org-roam").setup({
	directory = "~/orgfiles",
	org_files = {
		"~/orgfiles/**/*.org",
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "org",
	callback = function()
		vim.keymap.set("n", "<C-]>", function()
			require("orgmode").action("org_mappings.open_at_point")
		end, { buffer = true })
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "org-roam-select",
	callback = function()
		vim.b.completion = false
		vim.keymap.set("i", "<C-j>", "<C-n>", { buffer = true, remap = true })
		vim.keymap.set("i", "<C-k>", "<C-p>", { buffer = true, remap = true })
	end,
})

-- weird
local roam = require("org-roam")
local roam_api = require("org-roam.api")(roam)
vim.keymap.set("n", "<leader>nc", roam_api.capture_node, { desc = "Roam: capture node" })
vim.keymap.set("n", "<leader>nf", roam_api.find_node, { desc = "Roam: find node" })
