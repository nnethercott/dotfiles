return {
  -- top-level defn of available colorschemes
  {
    "nnethercott/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          "tokyonight",
          -- "cyberdream",
          -- "neobones",
          -- "zenbones",
          "zenwritten",
          "gruvbox",
          "gruvbox8_hard",
          "gruvbox-material",
        },
      })
      vim.cmd("set background=dark")
    end,
    keys = {
      { "<leader>ts", ":Themery<CR>", desc = "toggle themes" },
      {
        "<leader>t",
        function()
          vim.o.background = (vim.o.background == "dark") and "light" or "dark"
        end,
        desc = "toggle themes",
      },
    },
  },
  ------------------------------------
  -- themes configuration
  ------------------------------------
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    enabled = true,
    config = function()
      local transparent = true

      ---@diagnostic disable-next-line: missing-fields
      require("tokyonight").setup({
        style = "night",
        transparent = transparent,
        styles = {
          sidebars = transparent and "transparent" or "dark",
          floats = transparent and "transparent" or "dark",
        },
        day_brightness = 0.3,

        -- lualine transparency: https://github.com/folke/tokyonight.nvim/issues/516
        on_colors = function(colors)
          if transparent then
            colors.bg_statusline = colors.none
          end
        end,
      })
    end,
  },

  -- cyberdream
  {
    "scottmckendry/cyberdream.nvim",
    priority = 1000,
    enabled = true,
    config = function()
      require("cyberdream").setup({
        variant = "auto",
        saturation = 0.9,
        transparent = false,
        italic_comments = true,
        hide_fillchars = true,
        terminal_colors = false,
        cache = false,
        borderless_pickers = false,
        overrides = function(palette)
          local new = { fg = palette.yellow, italic = true }
          return {
            ["@keyword.conditional"] = new,
            ["@keyword.modifier"] = new,
            ["@keyword.rust"] = new,
            ["@module.rust"] = new,
          }
        end,
        colors = {
          dark = {
            fg = "#e0def4",
            -- bg = "#191724",
            yellow = "#f6c177",
          },
        },
      })

      vim.cmd("colorscheme cyberdream")
    end,
  },

  -- zenbones
  -- https://vimcolorschemes.com/zenbones-theme/zenbones.nvim
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- turn off string italics
      local opts = { italic_strings = false }
      vim.g.zenbones = opts
      vim.g.zenwritten = opts
      vim.g.neobones = opts
    end,
  },
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_enable_italic = 0
      vim.g.gruvbox_material_disable_italic_comment = 0
      vim.g.gruvbox_material_enable_bold = 1
    end,
  },
  {
    "https://gitlab.com/motaz-shokry/gruvbox.nvim",
    name = "gruvbox",
    enabled = true,
    opts = {
      dark_variant = "hard",
      styles = {
        italic = false,
      },
    },
  },
  {
    "lifepillar/vim-gruvbox8",
    branch = "neovim",
    config = function ()
      vim.g.gruvbox_italics = 0
    end
  }
}
