return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    input = { enabled = false, icon = "" },
    indent = {enabled = false,},
    notifier = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    words = { enabled = true, debounce = 75 },
    dashboard = { enabled = true }, -- alpha
    explorer = { enabled = true },
    picker = {
      sources = {
        finder = { cmd = "fd" },
        explorer = {
          title = "",
          layout = {
            -- preset = "vscode", -- cool
            cycle = false,
            layout = {
              width = 28,
              min_width = 28,
            },
          },
        },
      },
    },
    styles = {
      input = {
        relative = "cursor",
        row = -3,
        width = 25,
        keys = {
          ["<C-c>"] = { "close", mode = { "i", "n" } },
        },
      },
    },
  },
  keys = {
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
