return {
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
          -- colors.bg = "#fcfbf9"
          -- colors.bg_float = "#d9dde8";
        end,
      })

      -- vim.cmd("colorscheme tokyonight")
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    priority = 1000,
    enabled = true,
    config = function()
      require("cyberdream").setup({
        variant = "auto",
        saturation = 1.0,
        transparent = false,
        italic_comments = true,
        hide_fillchars = true,
        terminal_colors = false,
        cache = false,
        borderless_pickers = false,
        colors = {
          -- For a list of colors see `lua/cyberdream/colours.lua`
          -- If you want to override colors for light or dark variants only, use the following format:
          dark = {
            fg = "#eaeaea",
          },
        },
      })

      vim.cmd("colorscheme cyberdream")

      -- https://github.com/scottmckendry/cyberdream.nvim/issues/137
      local italic_groups = {
        "Keyword",
        "Function",
      }
      for _, group in ipairs(italic_groups) do
        vim.cmd("hi " .. group .. " gui=italic cterm=italic")
      end
    end,
    keys = {
      { "<leader>tt", ":CyberdreamToggleMode<CR>", { noremap = true, silent = true } },
    },
  },

  -- need to manually update this !
  -- https://github.com/folke/lazy.nvim/discussions/1344
  {
    "rebelot/kanagawa.nvim",
    opts = {
      -- removes coloring on the sign/fold column
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
      -- colorscheme = "cyberdream",
      -- colorscheme = "kanagawa-wave",
    },
  },
}
