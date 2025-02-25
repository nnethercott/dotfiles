return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      lua = { "stylua" },
      rust = { "rustfmt" },
      python = { "ruff_format" },
      dart = { "dart_format" },
      typescript = { "biome" },
    },
    keys = {
      {
        "<leader>fo",
        mode = { "n", "x" },
        function()
          require("conform").format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
          })
        end,
      },
    },
  },
}
