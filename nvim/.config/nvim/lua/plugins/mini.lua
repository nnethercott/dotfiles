return {
    'echasnovski/mini.nvim',
    version = false,

    config = function ()
      require("mini.ai").setup()
      require("mini.pairs").setup()
      require("mini.git").setup()
      require("mini.diff").setup({
        view = {style = 'sign',},
      })
      require("mini.comment").setup()
      require("mini.trailspace").setup()
      require("mini.splitjoin").setup()
      require("mini.surround").setup({
        mappings = {
          add = 'e',
          delete = 'ds',
          replace = 'cs',
        }
      })
    end,
}
