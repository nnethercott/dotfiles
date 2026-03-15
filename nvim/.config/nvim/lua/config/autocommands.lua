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

-- quickfix quit
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
    vim.keymap.set("n", "q", "<cmd>q<CR>", opts)
    vim.keymap.set("n", "<C-c>", "<cmd>q<CR>", opts)
  end,
})
