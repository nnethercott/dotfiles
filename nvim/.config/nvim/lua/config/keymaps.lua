vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap

-- Normal mode mappings
map("n", "<C-d>", "<C-d>zz", { noremap = true })
map("n", "<C-s>", ":w<CR>", { noremap = true })
map("n", "<C-c>", "<ESC>", { noremap = true })
map("n", "<S-l>", ":bnext<CR>", { noremap = true })
map("n", "<S-h>", ":bprevious<CR>", { noremap = true })
map("n", "<leader>bd", ":bd<CR>", { noremap = true })
map("n", "=", ":vertical resize +3<CR>", { noremap = true, silent = true })
map("n", "-", ":vertical resize -3<CR>", { noremap = true, silent = true })
map("n", "<leader>vs", ":vsplit<CR>", {})
map("n", "<leader>hs", ":split<CR>", {})

-- copy current file path to clipboard
map("n", "<leader>@", ':let @+ = expand("%:p:~:.")<CR>', {})

-- insert mode mappings
map("i", "jk", "<ESC>", { noremap = true })
map("i", "<C-s>", "<ESC>:w<CR>", { noremap = true })
map("i", "<C-c>", "<ESC>", { noremap = true })

-- visual mode mappings
map("v", ">", ">gv", { noremap = true })
map("v", "<", "<gv", { noremap = true })
map("v", "<S-j>", ":m '>+1<CR>gv=gv", { noremap = true, desc = "move selection down" })
map("v", "<S-k>", ":m '<-2<CR>gv=gv", { noremap = true, desc = "move selection up" })
map("v", "p", '"_dP', { noremap = true, desc = "paste without yanking" })
