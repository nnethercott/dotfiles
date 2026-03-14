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
          "neobones",
          "zenbones",
          "zenwritten",
          "base16-black-metal-gorgoroth",
          "gruvbox",
          "gruvbox8",
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
    "https://gitlab.com/motaz-shokry/gruvbox.nvim",
    name = "gruvbox",
    enabled = true,
    opts = {
      dark_variant = "hard",
      styles = {
        italic = false,
      },
      -- plugin doesn't recognize mini statusline :(
      before_highlight = function(group, highlight, _)
        if group:match("^MiniStatusline") then
          for k in pairs(highlight) do
            highlight[k] = nil
          end
        end
      end,
    },
  },
  {
    "lifepillar/vim-gruvbox8",
    branch = "neovim",
    config = function()
      vim.g.gruvbox_italics = 0
    end,
  },
  {
    "RRethy/base16-nvim",
    config = function()
      local function black_metal_theme_overrides()
        local hl = vim.api.nvim_set_hl
        hl(0, "DiagnosticVirtualTextError", { fg = "#912222" })
        hl(0, "TSComment", { fg = "#6f7b68", gui = nil })
        hl(0, "Comment", { fg = "#6f7b68", gui = nil })
        hl(0, "Visual", { bg = "#9b8d7f", fg = "#1e1e1e" })
        hl(0, "Search", { bg = "#9b8d7f", fg = "#1e1e1e" })
        hl(0, "PmenuSel", { bg = "#9b8d7f", fg = "#1e1e1e" })
      end

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          local colorscheme = vim.g.colors_name

          if colorscheme:find("^base16") ~= nil then
            black_metal_theme_overrides()
          end
        end,
      })
    end,
  },
}
