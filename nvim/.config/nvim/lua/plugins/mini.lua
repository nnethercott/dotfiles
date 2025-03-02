return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require("mini.ai").setup()
    require("mini.pairs").setup()
    --  messes with 
    -- local trailspace = require("mini.trailspace")
    -- trailspace.setup({
    --   vim.keymap.set("n", "<leader>cw", function() trailspace.trim() end)
    -- })

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
    require("mini.hipatterns").setup({
      highlighters = {
        hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
      }
    })
  end,
}
