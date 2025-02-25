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
          "ts_ls",         -- typescript
        }
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },

    -- refer to each lsp's docs for config
    opts = {
      servers = {
        -- lua
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },

        -- rust
        rust_analyzer = {
          filetypes = { "rust" },
          settings = {
            ["rust-analyzer"] = {
              enable = true,
              checkOnSave = false, -- disable for big projects
            }
          }
        },

        -- python
        pyright = {
          filetypes = { "python" },

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
        },
      },
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')

      -- blink.cmp setup
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end

      -- change icons in gutter
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- TODO: move these to `keys`
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
    end
  }
}
