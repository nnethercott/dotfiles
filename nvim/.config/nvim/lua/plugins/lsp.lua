return {
  -- mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "rust-analyzer",
      })
    end,
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },

      servers = {
        rust_analyzer = {
          filetypes = { "rust" },
          settings = {
            ["rust-analyzer"] = {
              enable = true,
              checkOnSave = false, -- disable for big projects
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
        -- { "gy", vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition" },
        -- { "gr", vim.lsp.buf.references, desc = "References", nowait = true },
        { "]g", vim.diagnostic.goto_prev, desc = "Goto T[y]pe Definition" },
        { "[g", vim.diagnostic.goto_next, desc = "Goto T[y]pe Definition" },
        { "<leader>rn", vim.lsp.buf.rename, desc = "Rename symbol" }, -- TODO: maybe change to dedicated plugin
      })
    end,
  },
}
