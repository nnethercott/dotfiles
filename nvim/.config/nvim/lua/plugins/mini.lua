return {
  'echasnovski/mini.nvim',
  version = false,

  config = function()
    require("mini.ai").setup()
    require("mini.pairs").setup()
    require("mini.git").setup()
    require("mini.diff").setup({
      view = { style = 'sign', },
    })
    require("mini.comment").setup()

    local trailspace = require("mini.trailspace")
    trailspace.setup({
      vim.keymap.set("n", "<leader>cw", function() trailspace.trim() end)
    })

    require("mini.splitjoin").setup()
    require("mini.surround").setup({
      mappings = {
        add = 'ye',
        delete = 'ds',
        replace = 'cs',
        find = 'ef',
        find_left = 'eF',
        highlight = 'eh',
        update_n_lines = 'en',
      }
    })
    require("mini.hipatterns").setup()
    -- animate cursor
    require("mini.animate").setup({
      cursor = { enable = false, timing = function() return 5 end },
      scroll = { enable = false, timing = function() return 5 end },
    })
  end,
}
