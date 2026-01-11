return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      heading = {
        enabled = false,
      },
      bullet = {
        enabled = true,
        icons = { "-", "-", "-", "-" },
        -- icons = { '●', '○', '◆', '◇' },
        right_pad = 0,
      },
      code = {
        border = "none",
        language = true,
      },
    },
  },
}
