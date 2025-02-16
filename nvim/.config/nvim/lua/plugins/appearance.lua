return {
  -- code action popup
  {
    'stevearc/dressing.nvim',
    enabled = true,
    event = "VeryLazy",

    config = function()
      -- local actions = require("fzf-lua").actions
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
    end
  },
  -- code hover
  {
    "lewis6991/hover.nvim",
    enabled = true,
    config = function()
      local hover = require("hover")
      hover.setup({
        init = function()
          require("hover.providers.lsp")
        end,
        preview_opts = { border = 'rounded' },
        preview_window = true,
        title = false,
      })

      -- Setup keymaps
      vim.keymap.set("n", "<leader>d", hover.hover)
    end
  },
}
