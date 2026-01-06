return {
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
      vim.keymap.set("n", "<leader>o", ":BufferOrderByBufferNumber<CR>", { noremap = true })
      vim.keymap.set("n", "<leader>ba", ":BufferCloseAllButCurrent<CR>", { noremap = true })

      -- vim.api.nvim_set_hl(0, "BufferTabpageFill", { bg = "none", fg = "none" })
      -- vim.api.nvim_set_hl(0, "TabLineFill",       { bg = "none", fg = "none" })
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
}
