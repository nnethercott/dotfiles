return {
  'stevearc/dressing.nvim',
  opts = {},
  enabled = true,
  event = "VeryLazy",
  config = function()
    local actions = require("fzf-lua").actions

    require('dressing').setup({
      input = {
        enabled = true,
      },
      select = {
        prompt_title = true,

        backend = { 'fzf_lua', 'builtin'},
        builtin = {
          relative = "cursor",

          width = nil,
          max_width = { 140, 0.8 },
          min_width = { 40, 0.2 },
          height = nil,
          max_height = 0.9,
          min_height = { 10, 0.1 },

          mappings = {
            ["<C-c>"] = "Close",
            ["<CR>"] = "Confirm",
          },
          override = function(conf)
            conf.row = 1 -- offset cursorline by 1 to appear below
            conf.border = "rounded"
            return conf
          end
        },
        fzf_lua = {
          winopts = {
            preview = {
              hidden = 'hidden'
            },
            relative = "cursor",
            border = "rounded",
            backdrop = 100,
            row = 1.1,
            width = 0.25,
            height = 0.2,
          },
        },

      }
    })
    -- vim.lsp.buf.hover colors
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#2e2e2e", fg = "#ffffff" })
    -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#2e2e2e", fg = "#7aa2f7" })

  end
}
