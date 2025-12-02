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
        "yaml-language-server",
      })
    end,
  },
  -- lspconfig keymaps
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            {
              "<leader>d",
              function()
                return vim.lsp.buf.hover()
              end,
              desc = "Hover",
              has = "definition",
            },
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
          },
        },
      },
    },
  },
}
