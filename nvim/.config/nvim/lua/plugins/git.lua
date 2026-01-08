return {
  -- TODO: remove later when vscode diff is stable
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
      { "<leader>gb", ":Gitsigns blame<CR>", desc = "Git blame" },
    },
  },
  {
    "esmuellert/codediff.nvim",
    enabled = true,
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = "CodeDiff",
    config = function()
      require("vscode-diff").setup({
        -- Keymaps in diff view
        keymaps = {
          view = {
            quit = "q", -- Close diff tab
            toggle_explorer = "<leader>cx", -- Toggle explorer visibility (explorer mode only)
            next_hunk = "<C-n>", -- Jump to next change
            prev_hunk = "<C-p>", -- Jump to previous change
            next_file = "<Tab>", -- Next file in explorer mode
            prev_file = "<S-Tab>", -- Previous file in explorer mode
          },
          conflict = {
            accept_incoming = "<leader>ai", -- Accept incoming (theirs/left) change
            accept_current = "<leader>ac", -- Accept current (ours/right) change
            accept_both = "<leader>ab", -- Accept both changes (incoming first)
            discard = "<leader>ad", -- Discard both, keep base
          },
        },
      })
    end,
    keys = {
      { "<leader>cd", ":CodeDiff main<CR>", desc = "Git diff repo @-" },
      { "<leader>cf", ":CodeDiff file main<CR>", desc = "Git diff file repo @-" },
    },
  },
}
