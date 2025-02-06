return {
  'stevearc/dressing.nvim',
  opts = {},
  enabled = true,
  config = function()
    local actions = require("telescope.actions")

    require('dressing').setup({
      select = {
        prompt_title = true,

        -- backend = { 'builtin' },
        -- builtin = {
        --   relative = "cursor",
        --
        --   width = nil,
        --   max_width = { 140, 0.8 },
        --   min_width = { 40, 0.2 },
        --   height = nil,
        --   max_height = 0.9,
        --   min_height = { 10, 0.1 },
        --
        --   mappings = {
        --     ["<C-c>"] = "Close",
        --     ["<CR>"] = "Confirm",
        --   },
        --   override = function(conf)
        --     conf.row = 1 -- offset cursorline by 1 to appear below
        --     return conf
        --   end
        -- }

        telescope = require('telescope.themes').get_cursor({
          border = true,
          mappings = {
            i = {
              ["<CR>"] = actions.select_default,
              ["<Tab>"] = actions.move_selection_previous,
              ["<S-Tab>"] = actions.move_selection_next,
            },
            n = {
              ["<CR>"] = actions.select_default,
              ["<Tab>"] = actions.move_selection_previous,
              ["<S-Tab>"] = actions.move_selection_next,
            },

          },
          layout_config = {
            width = 0.5,
          }
        })

      }
    })

    -- vim.lsp.buf.hover colors
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#2e2e2e", fg = "#ffffff" })
    -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#2e2e2e", fg = "#7aa2f7" })

  end
}
