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

  -- barbar
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

  -- indent-blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufEnter" },
    main = "ibl",
    opts = {
      indent = { char = "│", highlight = "IblIndent" },
      scope = {
        char = "│",
        highlight = "IblScope",
        enabled = true,
        show_start = false,
        show_end = false,
      },
      exclude = { filetypes = { "lua", "yaml" } }, -- exclude langs here
    },
    config = function(_, opts)
      require("ibl").setup(opts)
      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
    end,
  },
}
