return {
  -- mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua", -- lua
        -- "rust-analyzer", -- rust
        "codelldb",
        "ruff", -- python
        "pyright",
        "angular-language-server", -- angular
        "dart-debug-adapter", -- dart
      })
    end,
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
    {
      "gs",
      function()
        vim.cmd("vsplit")
        vim.lsp.buf.definition()
      end,
      desc = "Goto T[y]pe Definition in new vsplit",
    },
    { "gr", vim.lsp.buf.references, desc = "References", nowait = true },
    { "]g", vim.diagnostic.goto_next, desc = "Goto T[y]pe Definition" },
    { "[g", vim.diagnostic.goto_prev, desc = "Goto T[y]pe Definition" },
  })
    end,
  },
}
