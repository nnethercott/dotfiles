return {
  {
    "obsidian-nvim/obsidian.nvim",
    enabled = true,
    -- lazy = false,
    version = "*", -- recommended, use latest release instead of latest commit
    ft = "markdown",
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      legacy_commands = false, -- this will be removed in the next major release
      workspaces = {
        {
          name = "main",
          path = "~/vaults/main",
        },
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      heading = {
        enabled = false
      },
      bullet = {
        enabled = false
      },
      -- signs = {
      --   enabled = false
      -- },
      -- indent = {
      --   enabled = false
      -- }
    },
  },
}
