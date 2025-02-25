return {
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto", -- uses colorscheme
          icons_enabled = true,
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" }, -- │
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { {
            "filename",
            path = 1,
            shorting_target = 40,
          } },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  -- replaces bufferline
  {
    "romgrk/barbar.nvim",
    enabled = true,
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
    config = function()
      require("barbar").setup({
        animation = true,
        icons = {
          pinned = { button = "󰐃", filename = true },
        },
        insert_at_end = true,
      })
      vim.keymap.set("n", "<S-l>", ":bnext<CR>", { noremap = true }) -- remap :bnext
      vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { noremap = true }) -- remap :bprev
    end,
  },

  -- snacks TODO: read docs
{
  "snacks.nvim",
  opts = {
    indent = { enabled = false },
    input = { enabled = true },
    notifier = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false }, -- we set this in options.lua
    words = { enabled = false },
  },
  -- stylua: ignore
  -- keys = { { "<leader>n", function()
  --     if Snacks.config.picker and Snacks.config.picker.enabled then
  --       Snacks.picker.notifications()
  --     else
  --       Snacks.notifier.show_history()
  --     end
  --   end, desc = "Notification History" },
  --   { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
  -- },
}
}
