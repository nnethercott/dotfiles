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
                "!helmfile.yaml.gotmpl",
                "!*.yaml.gotmpl",
                "templates/*.{tpl,yaml,yml}",
                "!compose*.{yml,yaml}",
                "!docker-compose*.{yml,yaml}",
                "!**/.github/actions/**/*.{yml,yaml}",
                "!**/.github/workflows/**/*.{yml,yaml}",
              },
              -- helm
              ["https://json.schemastore.org/chart.json"] = {
                "Chart.{yaml,yml}",
                "templates/*.{tpl,yaml,yml}",
              },
              -- helmfile
              ["https://json.schemastore.org/helmfile.json"] = {
                "helmfile.yaml.gotmpl",
                "*.yaml.gotmpl",
              },
              -- docker-compose
              ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
                "compose*.{yml,yaml}",
                "docker-compose*.{yml,yaml}",
              },
              -- github actions
              ["https://json.schemastore.org/github-action.json"] = {
                "**/.github/actions/**/*.{yml,yaml}",
              },
              -- github workflow
              ["https://json.schemastore.org/github-workflow.json"] = {
                "**/.github/workflows/**/*.{yml,yaml}",
              },
            },
          },
        },
      },
    },
  },
}
