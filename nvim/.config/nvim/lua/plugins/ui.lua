return {
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    enabled = false,
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
    "serhez/bento.nvim",
    opts = {
      max_open_buffers = 8,
      lock_char = "*",
      buffer_deletion_metric = "frequency_access",
      buffer_notify_on_delete = false,
      ordering = "access",
      ui = {
        mode = "tabline",
        floating = {
          minimal_menu = "full",
          position = "top_right",
        },
      },
    },
    config = function(_, opts)
      require("bento").setup(opts)

      -- register keymap after setup
      vim.keymap.set("n", "<leader>ba", function()
        require("bento").close_all_buffers({ locked = false, current = false })
      end)
    end,
  },
}
