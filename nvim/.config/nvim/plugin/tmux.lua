vim.pack.add( {
    "https://github.com/christoomey/vim-tmux-navigator",
})

vim.api.nvim_set_keymap("n", "<C-h>", ":TmuxNavigateLeft<cr>", {})
vim.api.nvim_set_keymap("n", "<C-j>", ":TmuxNavigateDown<cr>", {})
vim.api.nvim_set_keymap("n", "<C-k>", ":TmuxNavigateUp<cr>", {})
vim.api.nvim_set_keymap("n", "<C-l>", ":TmuxNavigateRight<cr>", {})
