-- Start treesitter for every filetype (enables mini.ai treesitter text objects and folds)
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		(vim.hl or vim.highlight).on_yank({ higroup = "visual", timeout = 100 })
	end,
})

-- Disable autoformat
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "*" },
	callback = function()
		vim.b.autoformat = false
	end,
})

-- close view-only windows with q / <C-c> (qf, help, man, gitsigns-blame, etc.)
local function set_close_keys(ev)
  local opts = { buffer = ev.buf, silent = true }
  vim.keymap.set("n", "q", "<cmd>q<CR>", opts)
  vim.keymap.set("n", "<C-c>", "<cmd>q<CR>", opts)
end

vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function(ev)
    if not vim.bo[ev.buf].modifiable then
      set_close_keys(ev)
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitsigns-blame",
  callback = set_close_keys,
})
