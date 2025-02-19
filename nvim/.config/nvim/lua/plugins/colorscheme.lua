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
      })

      vim.cmd("colorscheme tokyonight")
    end,
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
  --   lazy = false,
  --   priority = 1000,
  --   config = function ()
  --     require("vscode").setup({
  --        style = "light"
  --     })
  --     vim.cmd.colorscheme "vscode"
  --   end
  -- }
}

-- vscode.nvim, catpuccin, nightfly-colors,
