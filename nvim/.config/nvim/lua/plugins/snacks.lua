return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      notifier = { enabled = true }, -- notifs
      terminal = {
        enabled = true,
        win = {
          height = 0.3
        }
      }
    },
    keys = {
      { "<leader>t", function() Snacks.terminal() end, desc = "Toggle Terminal" },
    }
  },
}
