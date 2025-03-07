local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Disable autoformat -- not sure why i need this
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("disable_autoformat"),
  pattern = { "*" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    (vim.hl or vim.highlight).on_yank({ higroup = "Visual", timeout = 100 })
  end,
})

-- close quickfix on select
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "qf" },
--   command = [[nnoremap <buffer> <CR> <CR>:cclose<CR>]],
-- })
