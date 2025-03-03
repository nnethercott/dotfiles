return {
  -- mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "rust-analyzer", -- rust
        "ruff", -- python
        "pyright",
        "typescript-language-server",
        "angular-language-server",
      })
    end,
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },

      servers = {
        -- rust-analyzer
        rust_analyzer = {
          filetypes = { "rust" },
          settings = {
            ["rust-analyzer"] = {
              enable = true,
              checkOnSave = false, -- disable for big projects
            },
          },
        },

        -- pyright
        -- pyright config with ruff: https://github.com/astral-sh/ruff-lsp/issues/384
        -- settings from https://microsoft.github.io/pyright/#/settings
        pyright = {
          filetypes = { "python" },
          settings = {
            pyright = {
              disableOrganizeImports = true, -- Using Ruff
              inlayHints = {
                variableTypes = false,
                parameterTypes = false,
              },
            },
            python = {
              analysis = {
                ignore = { '*' }, -- Using Ruff
                typeCheckingMode = "off", -- slow in big projects
              },
            },
          },
        },
      },
    },
  },

  -- lspconfig keymaps
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      vim.list_extend(keys, {
        -- uncomment to stop using default picker ...
        { "<leader>d", vim.lsp.buf.hover, desc = "Hover", has = "definition" },
        -- { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration", has = "definition" },
        { "gd", vim.lsp.buf.definition, desc = "Goto T[y]pe Definition" },
        { "gr", vim.lsp.buf.references, desc = "References", nowait = true },
        { "]g", vim.diagnostic.goto_prev, desc = "Goto T[y]pe Definition" },
        { "[g", vim.diagnostic.goto_next, desc = "Goto T[y]pe Definition" },
      })
    end,
  },

  -- dart
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function ()
      require("flutter-tools").setup {
        ui = {
          border = "rounded",
        }
      } 
    end
  },
}
