return {
  -- alpha
  {
    "goolord/alpha-nvim",
    enabled = true,
    dependencies = { "nvim-mini/mini.icons" },
    config = function()
      require("alpha").setup(require("alpha.themes.dashboard").config)
    end,
  },
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local LazyVim = require("lazyvim.util")

      require("lualine").setup({
        options = {
          theme = "auto", -- uses colorscheme
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
          lualine_b = {
            "branch",
            "diff",
            "diagnostics",
          },
          lualine_c = {
            {
              -- pretty path
              LazyVim.lualine.pretty_path({
                length = 0,
                relative = "cwd",
                modified_hl = "MatchParen",
                directory_hl = "",
                filename_hl = "Bold",
                modified_sign = "",
                readonly_icon = " 󰌾 ",
              }),
            },
          },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
  -- indent-blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = true,
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
  -- buffer management
  {
    "nnethercott/bento.nvim",
    -- dir = "~/bento.nvim/",
    opts = {
      max_open_buffers = 5,
      lock_char = "*",
      label_previous_buffer = true,
      buffer_deletion_metric = "frequency_access",
      buffer_notify_on_delete = false,
      ordering = "edit",
      ui = {
        mode = "tabline",
        tabline = {
          persistent = true,
        },
      },
    },
  },
}
