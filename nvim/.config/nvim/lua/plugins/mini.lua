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
  end,
}
