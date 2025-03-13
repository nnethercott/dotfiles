-- tokyonight, cyberdream, vscode.nvim, catpuccin, nightfly-colors,
return {
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

      vim.cmd("colorscheme tokyonight")
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    priority = 1000,
    enabled = false,
    config = function()
      require("cyberdream").setup({
        variant = "auto",
        transparent = true,
        italic_comments = true,
        hide_fillchars = true,
        terminal_colors = false,
        cache = false,
        borderless_pickers = false,
        -- overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
        --   -- Example:
        --   return {
        --     ["@variable"] = { bg = colors.magenta, },
        --   }
        -- end,
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
    end
  },

  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     require("catppuccin").setup({
  --       flavour = "frappe",  --frappe not bad
  --     })
  --     vim.cmd.colorscheme "catppuccin"
  --   end
  -- }

  -- {
  --   "bluz71/vim-nightfly-colors",
  --   name = "nightfly",
  --   lazy = false,
  --   priority = 1000,
  --   config = function ()
  --     vim.cmd.colorscheme "nightfly"
  --     vim.g.nightflyCursorColor = true
  --   end
  -- }

  -- {
  --   "Mofiqul/vscode.nvim",
  --   name = "vscode",
  --   priority = 1000,
  --   config = function ()
  --     require("vscode").setup({
  --        style = "light"
  --     })
  --     vim.cmd.colorscheme "vscode"
  --   end
  -- }
}
