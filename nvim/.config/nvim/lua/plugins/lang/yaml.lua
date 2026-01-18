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
                "!docker-compose*.{yml,yaml}",
                "!**/.github/actions/**/*.{yml,yaml}",
                "!**/.github/workflows/**/*.{yml,yaml}",
              },
              -- helm
              ["https://json.schemastore.org/chart.json"] = "Chart.{yaml,yml}",
              -- docker-compose
              ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
                "compose*.{yml,yaml}",
                "docker-compose*.{yml,yaml}"
              },
              -- github actions
              ["https://json.schemastore.org/github-action.json"] = {
                "**/.github/actions/**/*.{yml,yaml}",
              },
              -- github workflow
              ["https://json.schemastore.org/github-workflow.json"] = {
                "**/.github/workflows/**/*.{yml,yaml}",
              }
            },
          },
        },
      },
    },
  },
}
