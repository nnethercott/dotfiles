return {
  -- mason
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "codelldb",
        "ruff",
        "ty",
        "terraform-ls",
        "helm-ls",
        "jinja-lsp",
      })
    end,
  },
  -- lspconfig keymaps
  {
    "neovim/nvim-lspconfig",
    opts = function()
      -- recognize tfstate as json
      vim.filetype.add({
        extension = { tfstate = "json" },
      })
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
        { "]g", vim.diagnostic.get_next, desc = "Goto T[y]pe Definition" },
        { "[g", vim.diagnostic.get_prev, desc = "Goto T[y]pe Definition" },
      })
    end,
  },
}
