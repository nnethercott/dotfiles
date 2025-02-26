return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    input = { enabled = true, icon = "" },
    explorer = { enabled = true },
    indent = { enabled = false },
    notifier = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    words = { enabled = false },
    dashboard = { enabled = true }, -- alpha

    picker = {
      sources = {
        finder = {cmd = "fd"},

        -- explorer
        explorer = {
          title = "Browse",
          layout = {
            -- preset = "vscode", -- cool
            layout = {
              width = 32,
              min_width = 32,
            },
          },
        },
      },
    },
    styles = {
      -- ui.input for floating effect
      input = {
        relative = "cursor",
        row = -3,
        width = 25,
      },
    },
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
