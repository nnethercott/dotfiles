return {
  {
    'stevearc/conform.nvim',
    config = function()
      local conform = require('conform')
      conform.setup({
        lua = { "stylua" },
        rust = {
          command = "rustfmt",
          lsp_format = "fallback",
          args = { "--config", "tab_spaces=2" }, -- doesn't work :(
        },
        python = { "ruff_format" },
        dart = {"dart_format"},
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
    end
  }
}
