return{
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
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
                ignore = { "*" }, -- Using Ruff
                typeCheckingMode = "off", -- slow in big projects
              },
            },
          },
        },
      },
    },
  },
}

