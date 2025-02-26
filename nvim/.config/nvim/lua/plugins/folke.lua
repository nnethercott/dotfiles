return {
  -- snacks
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
      dashboard = { enabled = false }, -- alpha
    },
    keys = {
      -- remaps
      { "<leader>f", LazyVim.pick("files"), desc = "Find Files" },
      { "<leader>rg", LazyVim.pick("live_grep"), desc = "Grep" },
      {
        "<leader>lg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
    },
  },

  -- noice
  {
    "folke/noice.nvim",
    opts = {
      cmdline = { enabled = false, view = "cmdline" },
      messages = { enabled = false },
      popupmenu = { enabled = false, backend = "cmp" },
      notify = { enabled = false },
      lsp = {
        progress = { enabled = false },
        hover = { enabled = true, silent = true, opts = {} },
        signature = { enabled = true, opts = {} },
        documentation = { enabled = true, opts = {} },
      },
      presets = {
        lsp_doc_border = true, -- bordered hover
      },
    },
  },

  -- trouble
  {
    "folke/trouble.nvim",
    enabled = true,
    keys = {
      {
        "<leader>tr",
        "<cmd>Trouble lsp_references<cr>",
        desc = "Toggle lsp references",
        opts = { noremap = true, silent = true },
      },
    },
  },
}
