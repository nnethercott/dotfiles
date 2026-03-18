vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
})

require("mini.icons").setup()
require("mini.splitjoin").setup()
require("mini.pairs").setup({
	mappings = {
		["'"] = false,
	},
})
require("mini.surround").setup({
	mappings = {
		add = "ye",
		delete = "ds",
		replace = "cs",
	},
})
require("mini.hipatterns").setup({
	highlighters = {
		hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
	},
})
require("mini.indentscope").setup({
	symbol = "│",
	draw = {
		animation = require("mini.indentscope").gen_animation.none(),
	},
})

-- require("mini.statusline").setup()
-- MiniStatusline.section_lsp = function()
-- 	return ""
-- end
-- MiniStatusline.section_filename = function()
-- 	return vim.fn.pathshorten(vim.fn.expand("%:~:."))
-- end

local miniTrailspace = require("mini.trailspace")
miniTrailspace.setup({
	only_in_normal_buffers = true,
})
vim.keymap.set("n", "<leader>cw", function()
	miniTrailspace.trim()
end, { desc = "Erase Whitespace" })
-- Ensure highlight never reappears by removing it on CursorMoved
vim.api.nvim_create_autocmd("CursorMoved", {
	pattern = "*",
	callback = function()
		require("mini.trailspace").unhighlight()
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesWindowOpen",
	callback = function(args)
		local win_id = args.data.win_id
		vim.wo[win_id].winblend = 10
		local config = vim.api.nvim_win_get_config(win_id)
		config.border = "none"
		vim.api.nvim_win_set_config(win_id, config)
	end,
})
local my_prefix = function(fs_entry)
	if fs_entry.fs_type == "directory" then
		-- NOTE: it is usually a good idea to use icon followed by space
		return " ", "MiniFilesDirectory"
	end
	return MiniFiles.default_prefix(fs_entry)
end
require("mini.files").setup({
	mappings = {
		close = "<C-c>",
		synchronize = "<CR>",
	},
	content = { prefix = my_prefix },
})

vim.keymap.set("n", "<leader>e", function()
	if not MiniFiles.close() then
		MiniFiles.open()
	end
end, { desc = "explorer" })

vim.keymap.set("n", "<leader>fe", function()
	local current_file_dir = vim.fn.expand("%:p")
	MiniFiles.open(current_file_dir)
end, {
	desc = "explorer at current file",
})

local spec_treesitter = require("mini.ai").gen_spec.treesitter
require("mini.ai").setup({
	n_lines = 500,
  search_method = 'cover_or_next',
	custom_textobjects = {
		f = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
		c = spec_treesitter({ a = "@class.outer", i = "@class.inner" }),
		o = spec_treesitter({
			a = { "@conditional.outer", "@loop.outer" },
			i = { "@conditional.inner", "@loop.inner" },
		}),
	},
})
