return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        python = { "ruff_format" },
        dart = { "dart_format" },
        -- TODO: check these below
        typescript = { "eslint_d" },
        html = { "prettierd" },
      },
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
