return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      explorer = { enabled = true },
      indent = { enabled = false },
      notifier = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      words = { enabled = false },
      dashboard = { enabled = true }, -- alpha
      input = { enabled = false },
    },
    keys = {
      -- remap fzf keys
      { "<leader>f", LazyVim.pick("files"), desc = "Find Files" },
      { "<leader>rg", LazyVim.pick("live_grep"), desc = "Grep" },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = { enabled = true, view = "cmdline" },
      messages = { enabled = false },
      popupmenu = { enabled = true, backend = "cmp" },
      notify = { enabled = false },
      lsp = {
        progress = { enabled = false },
        hover = { enabled = true, opts = {} },
        signature = { enabled = true, opts = {} },
        documentation = { enabled = true, opts = {} },
      },
    },
  },
}
