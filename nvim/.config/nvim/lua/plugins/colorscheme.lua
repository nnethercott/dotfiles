return {
  -- top-level defn of available colorschemes
  {
    "nnethercott/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          "tokyonight",
          "cyberdream",
          "neobones",
          "rosebones",
          "zenbones",
          "zenwritten",
          -- "forestbones",
          -- "nordbones",
          -- "seoulbones",
          -- "duckbones",
          -- "zenburned",
          -- "kanagawabones",
          -- "vimbones",
          -- "randombones"
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
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "zenbones",
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
    -- opts = function ()
    --   vim.g.zenbones_transparent_background = true
    -- end
  },
}
