return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    input = {
      enabled = true,
      icon = "",
    },
    styles = {
      input = {
        relative = "cursor",
        row = -3,
        width = 25,
      },
    },
    explorer = {
      enabled = true,
    },
    indent = { enabled = false },
    notifier = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    words = { enabled = false },
    dashboard = { enabled = true }, -- alpha
  },
  keys = {
    -- remaps
    { "<leader>f", LazyVim.pick("files"), desc = "Find Files" },
    { "<leader>rg", LazyVim.pick("live_grep"), desc = "Grep" },
    {
      "<leader>k",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>lg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
  },
}
