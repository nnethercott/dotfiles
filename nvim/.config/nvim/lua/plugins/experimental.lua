return {
  {
    "obsidian-nvim/obsidian.nvim",
    enabled = true,
    lazy = false,
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
      ui = { enable = false },
    },
  },
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
      -- signs = {
      --   enabled = false
      -- },
      -- indent = {
      --   enabled = false
      -- }
    },
  },
  -- FIXME: currently broken but looks useful
  {
    "mistweaverco/bafa.nvim",
    version = "v1.10.1",
    enabled = false,
    keys = {
      {
        "<leader>tg",
        function()
          require("bafa").toggle({
            with_jump_labels = true,
          })
        end,
      },
    },
  },
  -- FIXME: wait until difftastic upstream merged before comparing with vscode-diff
  {
    "clabby/difftastic.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    enabled=false,
    config = function()
      require("difftastic-nvim").setup({
        download = true, -- Auto-download pre-built binary
        vcs = "git",
      })
    end,
  },
}
