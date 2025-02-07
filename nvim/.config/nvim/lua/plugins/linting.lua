return {
  {
    "mfussenegger/nvim-lint",
    enabled = true,
    config = function ()
        local lint = require('lint')

      lint.linters_by_ft = {
        -- rust = {'clippy'},
        python = {'ruff'},
        yaml = {'yamllint'},
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
        callback = function()
            require("lint").try_lint()
          end,
        })
    end
  }
}
