return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    enabled = true,

    config = function()
      require 'nvim-treesitter.configs'.setup {
        indent = { enable = true },
        highlight = {
          enable = true,
          use_languagetree = true,
          -- disable = {"rust"},
        },
        ensure_installed = {
          "vim",
          "vimdoc",
          "query",
          "markdown",
          "markdown_inline",
          "rust",
          "lua",
          "python",
          "yaml",
          "dart",
          "dockerfile"
        },
      }
    end
  },
  -- text objects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    enabled = true,
    lazy = false,
    config = function()
      require 'nvim-treesitter.configs'.setup {
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
            },
            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V',  -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },
            include_surrounding_whitespace = false,
          },
        },
      }
    end
  },
}
