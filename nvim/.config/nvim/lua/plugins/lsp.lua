return {
  -- mason
  {
    "williamboman/mason.nvim",
    enabled = true,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local mason = require("mason")
      local mason_lsp = require("mason-lspconfig")

      mason.setup()
      mason_lsp.setup({
        ensure_installed = {
          "lua_ls",        -- lua
          "rust_analyzer", -- rust
          "ruff",          -- python
          "pyright",
          "ast_grep",      -- dart
          "dockerls",      -- docker
          "yamlls",        --yaml
        }
      })
    end
  },

  -- lspconfig (should go after mason)
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    event = { "BufReadPre", "BufNewFile" }, -- load plugin on new buffers
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },

    config = function()
      local lspconfig = require("lspconfig")
      local mason_lsp = require("mason-lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local keymap = vim.keymap
      local opts = { noremap = true, silent = true }

      local on_attach = function(client, bufnr)
        opts.buffer = bufnr

        keymap.set({ "n", "x" }, "<leader>a", vim.lsp.buf.code_action, opts)
        keymap.set("n", "<leader>d", vim.lsp.buf.hover, opts)
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        keymap.set("n", "gr", vim.lsp.buf.references, opts)
        keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        keymap.set("n", "]g", vim.diagnostic.goto_prev, opts)
        keymap.set("n", "[g", vim.diagnostic.goto_next, opts)
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
        -- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
      end

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- hover style
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
          border = "none",
          max_width = 65,
          max_height = 20,
        }
      )

      -- LSP SETUP
      -- default handler for installed servers
      mason_lsp.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end
      })

      lspconfig.rust_analyzer.setup({
        filetypes = { "rust" },
        on_attach = on_attach,
        capabilities = capabilities,

        settings = {
          ["rust-analyzer"] = {
            enable = true,
            checkOnSave = false, -- disable for big projects
          }
        }

      })

      -- override pyright defaults
      lspconfig.pyright.setup({
        filetypes = { "python" },
        on_attach = on_attach,
        capabilities = capabilities,

        settings = {
          -- from https://microsoft.github.io/pyright/#/settings
          pyright = {
            ['inlayHints'] = {
              variableTypes = false,
              parameterTypes = false,
            },
          },
          python = {
            ['analysis'] = {
              typeCheckingMode = "off", -- slow in big projects
            }
          }
        }
      })

      -- lua add `vim` to global
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
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
