return {
  -- mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "rust-analyzer"
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
      -- diable a keymap
      keys[#keys + 1] = { "K", false }

      -- adding more keys ...
      -- vim.list_extend(keys, {
      --   {
      --     "gd",
      --     function()
      --       -- DO NOT RESUSE WINDOW
      --       require("telescope.builtin").lsp_definitions({ reuse_win = false })
      --     end,
      --     desc = "Goto Definition",
      --     has = "definition",
      --   },
      -- })
    end,
  },
}
