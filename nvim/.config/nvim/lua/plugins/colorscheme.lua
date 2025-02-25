return {
  -- colorscheme
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    enabled = true,
    config = function()
      local transparent = false

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
}
