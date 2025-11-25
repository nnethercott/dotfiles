return {
  {
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
    },
  },
  {
    "esmuellert/vscode-diff.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("vscode-diff").setup({
        -- Keymaps in diff view
        keymaps = {
          view = {
            next_hunk = "<C-f>", -- Jump to next change
            prev_hunk = "<C-b>", -- Jump to previous change
            next_file = "<Tab>", -- Next file in explorer mode
            prev_file = "<S-Tab>", -- Previous file in explorer mode
          },
          explorer = {
            select = "<CR>", -- Open diff for selected file
            hover = "K", -- Show file diff preview
            refresh = "R", -- Refresh git status
          },
        },
      })
    end,
    keys = {
      { "<leader>cd", ":CodeDiff HEAD~1<CR>", desc = "Git diff HEAD~1" },
    },
  },
}
