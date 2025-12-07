return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      yamlls = {
        settings = {
          yaml = {
            schemaStore = {
              enable = true,
            },
            schemas = {
              -- k8s
              kubernetes = { "*.yaml", "*.yml" },
            },
          },
        },
      },
    },
  },
}
