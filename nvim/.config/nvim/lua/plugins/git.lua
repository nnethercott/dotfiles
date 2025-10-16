return {
  "lewis6991/gitsigns.nvim",
  enabled = true,
  opts = {
    signs = {
      add = { text = "▒" },
      change = { text = "▒" },
      delete = { text = "▒" },
      topdelete = { text = "▒" },
      changedelete = { text = "▒" },
      untracked = { text = "┆" },
    },
    signs_staged = {
      add = { text = "▒" },
      change = { text = "▒" },
      delete = { text = "▒" },
      topdelete = { text = "▒" },
      changedelete = { text = "▒" },
      untracked = { text = "┆" },
    },
    signcolumn = false,
  },
  keys = {
    -- {"<leader>gd", ":Gitsigns diffthis ", desc = "Git diff a rev"},
  }
}
