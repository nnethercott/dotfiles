return {
  -- mason
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local mason = require("mason")
      local mason_lsp = require("mason-lspconfig")

      mason.setup()
      mason_lsp.setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
        }
      })
    end
  },

  -- lspconfig (should go after mason)
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- load plugin on new buffers
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
      },

    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local keymap = vim.keymap
      local opts = {noremap=true, silent=true}

      local on_attach = function(client, bufnr)
        opts.buffer = bufnr

          keymap.set("n", "<leader>d", vim.lsp.buf.hover, opts)
          keymap.set({ "n", "x" }, "<leader>a", vim.lsp.buf.code_action, opts)
          keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          keymap.set("n", "gr", vim.lsp.buf.references, opts)
          keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          keymap.set("n", "]g", vim.diagnostic.goto_prev, opts)
          keymap.set("n", "[g", vim.diagnostic.goto_next, opts)
          keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

        -- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
      end

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- LSP SETUP
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities
      })

      lspconfig.rust_analyzer.setup({
        on_attach = on_attach,
        capabilities = capabilities
      })


      -- change icons in gutter
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
    end,
  },
}
