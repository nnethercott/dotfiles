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

      -- keymaps
      local keymap = vim.keymap
      keymap.set({ "n", "x" }, "<leader>a", vim.lsp.buf.code_action)
      -- keymap.set("n", "<leader>d", vim.lsp.buf.hover)
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
      keymap.set("n", "gd", vim.lsp.buf.definition)
      keymap.set("n", "gr", vim.lsp.buf.references)
      keymap.set("n", "gy", vim.lsp.buf.type_definition)
      keymap.set("n", "gD", vim.lsp.buf.declaration)
      keymap.set("n", "]g", vim.diagnostic.goto_prev)
      keymap.set("n", "[g", vim.diagnostic.goto_next)

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()


      -- LSP SETUP
      -- default handler for installed servers
      mason_lsp.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end
      })

      -- dartls NOT managed by mason
      lspconfig.dartls.setup({
            capabilities = capabilities,
      })

      lspconfig.rust_analyzer.setup({
        filetypes = { "rust" },
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
