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
    {"<leader>gb", ":Gitsigns toggle_current_line_blame(full=true)<CR>", desc = "Git blame inline"},
    {"gpr", ":Gitsigns preview_hunk_inline<CR>", desc = "Git preview hunk inline"},
  }
}
