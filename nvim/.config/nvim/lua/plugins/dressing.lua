return {
  'stevearc/dressing.nvim',
  enabled = true,
  event = "VeryLazy",

  config = function()
    local actions = require("fzf-lua").actions
    require('dressing').setup({})

    require('dressing').setup({
      select = {
        prompt_title = true,
        backend = { 'builtin' },

        builtin = {
          relative = "cursor",

          width = 0.4,
          height = 0.1,

          win_options = {
            wrap = false,
            list = true,
            listchars = "precedes:…,extends:…",
          },

          mappings = {
            ["<C-c>"] = "Close",
            ["<CR>"] = "Confirm",
          },
          override = function(conf)
            conf.row = 1
            conf.border = "rounded"
            return conf
          end
        },
      }
    })
    -- vim.lsp.buf.hover colors
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#2e2e2e", fg = "#ffffff" })
    -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#2e2e2e", fg = "#7aa2f7" })
  end
}
