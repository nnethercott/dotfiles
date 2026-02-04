return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ty = {
        settings = {
          ty = {
            diagnosticMode = "workspace",
            experimental = {
              rename = true,
            },
          },
        },
      },
    },
  },
}
