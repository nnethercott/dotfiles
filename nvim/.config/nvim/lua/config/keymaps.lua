vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap

-- Normal mode mappings
map("n", "<C-d>", "<C-d>zz", { noremap = true })
map("n", "<C-s>", ":w<CR>", { noremap = true })
map("n", "<C-c>", "<ESC>", { noremap = true })
map("n", "q", ":cclose<CR>", { noremap = true, silent = true })
map("n", "<S-l>", ":bnext<CR>", { noremap = true })
map("n", "<S-h>", ":bprevious<CR>", { noremap = true })
map("n", "<leader>bd", ":bd<CR>", { noremap = true })
map("n", "=", ":vertical resize +5<CR>", { noremap = true, silent = true })
map("n", "-", ":vertical resize -5<CR>", { noremap = true, silent = true })

-- map('n', '<C-h>', ':wincmd h<CR>', { noremap = true, silent = true })
-- map('n', '<C-j>', ':wincmd j<CR>', { noremap = true, silent = true })
-- map('n', '<C-k>', ':wincmd k<CR>', { noremap = true, silent = true })
-- map('n', '<C-l>', ':wincmd l<CR>', { noremap = true, silent = true })

-- insert mode mappings
map("i", "jk", "<ESC>", { noremap = true })
map("i", "<C-s>", "<ESC>:w<CR>", { noremap = true })
map("i", "<C-c>", "<ESC>", { noremap = true })

-- visual mode mappings
map("v", ">", ">gv", { noremap = true })
map("v", "<", "<gv", { noremap = true })

-- close quickfix on select
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "qf" },
  command = [[nnoremap <buffer> <CR> <CR>:cclose<CR>]],
})
