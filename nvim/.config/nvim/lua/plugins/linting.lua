return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufWritePost" }, -- load plugin on new buffers
    config = function ()
        local lint = require('lint')

      lint.linters_by_ft = {
        -- rust = {'clippy'},
        python = {'ruff'},
        -- typescript = {'biomejs'},
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
        callback = function()
            require("lint").try_lint()
          end,
        })
    end
  }
}
