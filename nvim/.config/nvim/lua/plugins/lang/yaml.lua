-- https://www.schemastore.org/api/json/catalog.json
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
              -- apply this to everything else
              kubernetes = {
                "*.yaml",
                "*.yml",
                "!Chart.{yaml,yml}",
                "!compose*.{yml,yaml}",
                "!docker-compose*.{yml,yaml}"
              },
              -- helm
              ["https://www.schemastore.org/chart.json"] = "Chart.{yaml,yml}",
              -- docker-compose
              ["https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json"] = {
                "compose*.{yml,yaml}",
                "docker-compose*.{yml,yaml}"
              }
            },
          },
        },
      },
    },
  },
}
