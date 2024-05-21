vim.g.mapleader = " "

local map = vim.keymap
map.set("n", "<C-d>", "<C-d>zz", { desc = "skip and center", remap = true })
map.set("x", "y", "<Esc>", { remap = true, desc = "yank and move to last cursor position" })
map.set("x", "<leader>p", '"_dP', { remap = true, desc = "keep buffer" })
map.set("i", "jk", "<ESC>", { remap = true, desc = "shortcut to exit" })
map.set("n", "<leader>nh", ":nohl<CR>", { desc = "turn off search highlights" })
map.set("n", "p", "$<ESC>p", { desc = "paste in a new line below current line" })
map.set("i", "<C-s>", "<ESC>:w<CR>", { desc = "control s for save" })
map.set("n", "<C-s>", ":w<CR>", { desc = "control s for save" })
map.set("n", "<leader>qq", "<ESC>:qa<CR>")
map.set("i", "<C-c>", "<ESC>")
map.set("n", "<S-l>", ":bnext<cr>", { desc = "next buffer" })
map.set("n", "<S-h>", ":bprevious<cr>", { desc = "prev buffer" })
map.set("n", "<leader>bd", ":bd<CR>", { desc = "delete open buffer" })
