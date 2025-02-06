return {
  {
    'stevearc/conform.nvim',
    config = function()
      local conform = require('conform')
      conform.setup({
        lua = { "stylua" },
        rust = { "rustfmt", lsp_format = "fallback" },
        -- python = {"ruff_format", "ruff_organize_imports", "ruff_fix"}

        -- passes this table to conform.format() and enables
        -- OR we define the au_group (below)
        -- format_on_save = {
        --   timeout_ms = 500,
        --   async = false,
        --   lsp_format = "fallback",
        -- },
      })

      -- keymap
      vim.keymap.set({ "n", "x" }, "<leader>fo", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end)

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format({ bufnr = args.buf })
        end,
      })
    end
  }
}
